package com.example.webstorex.Service;
import java.util.List;
import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.CartDetail;
import com.example.webstorex.Entity.CartItem;
import com.example.webstorex.Entity.Product;
import com.example.webstorex.Interface.CartDetailDAO;
import com.example.webstorex.Interface.CartItemDAO;
import com.example.webstorex.Interface.ProductDAO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
@SessionScope
@Service("cart")
public class ShoppingCart implements ShoppingCartService {
	@Autowired
	CartDetailDAO daocd;

	@Autowired
	ProductDAO daopd;

	@Autowired
	CartItemDAO daoit;

	@Autowired
	SessionService session;

	@Autowired
	HttpServletRequest req;

// them gio hang
	@Override
	public void add(Integer id) {
		Product p = daopd.findById(id).get();
		// Lấy tài khoản đang dn
		Account acc = session.getAttribute("user");
		// nếu cd mà null tất là chưa có giỏ hàng
		if (acc != null) { // item ci;
			// lấy id cart
			CartItem cart = daoit.findByAccount(acc);
			if (cart == null) {
				// them dc cartitem
				CartItem cart1 = new CartItem();
				cart1.setAccount(acc);
				daoit.saveAndFlush(cart1);
				p = daopd.findById(id).get();
				// them khi ngay lan dau
				CartDetail item = daocd.findByCartItemIsAndProduct(cart1, p);
				if (item == null) {
					cart = daoit.findByAccount(acc);
					CartDetail item2 = new CartDetail();
					item2.setCartItem(cart);
					item2.setProduct(p);
					item2.setPrice(p.getPrice());
					String gia = req.getParameter("quality");
					if (gia != null) {
						item2.setAmount(Integer.parseInt(gia));
					} else {
						item2.setAmount(1);
					}
					daocd.saveAndFlush(item2);
				}
			} else {// cart khac null
				p = daopd.findById(id).get();
				CartDetail item = daocd.findByCartItemIsAndProduct(cart, p);
				if (item == null) {
					cart = daoit.findByAccount(acc);
					CartDetail item2 = new CartDetail();
					item2.setCartItem(cart);
					item2.setProduct(p);
					item2.setPrice(p.getPrice());
					String gia = req.getParameter("quality");
					if (gia != null) {
						item2.setAmount(Integer.parseInt(gia));
					} else {
						item2.setAmount(1);
					}

					daocd.saveAndFlush(item2);
				} else { // item != null
					if (p.getId() == item.getProduct().getId()) { // p da ton tai
						String gia = req.getParameter("quality");
						if (gia != null) {
							item.setAmount(item.getAmount() + Integer.parseInt(gia));
						} else {
							item.setAmount(item.getAmount() + 1);
						}
						daocd.saveAndFlush(item);
					}
				}

			}

		}
	}

// xoa gio hang theo id cua ci
	@Override
	public void remove(Integer id) {
		// Lấy tài khoản đang dn
		Account acc = session.getAttribute("user");
		// nếu cd mà null tất là chưa có giỏ hàng
		if (acc != null) { // item ci;
			// lấy id cart
			CartItem cart = daoit.findByAccount(acc);
			if (cart != null) {
				daocd.deleteById(id);
			}
		}

	}

// cap nhat gio hang
	@Override
	public void update(Integer id, int amount) {

		Product p = daopd.findById(id).get();
		Account acc = session.getAttribute("user");
		CartItem cart = daoit.findByAccount(acc);
		CartDetail item = daocd.findByCartItemIsAndProduct(cart, p);
		if (cart != null && p != null) {
			item.setAmount(amount);
			daocd.saveAndFlush(item);
		}

	}

// xoa tat ca
	@Override
	public void clear() {
		/*
		 * CartDetail item = null; for (Integer id : mapcd.keySet()) { item =
		 * mapcd.get(id); item.setAmount(0); } mapcd.clear();
		 */
	}

// lay so san pham
	@Override
	public int getCount() {
		Account acc = session.getAttribute("user");
		CartItem cartitem = daoit.findByAccount(acc);
		if (cartitem != null) {
			List<CartDetail> items = daocd.findByCartId(cartitem.getId());
			return items.size();
		}
		return 0;
	}

// tinh tong tien
	@Override
	public double getTotal() {
		Double tongtien = 0.0;
		Double gia = 0.0;
		Account acc = session.getAttribute("user");
		CartItem cartitem = daoit.findByAccount(acc);
		if (cartitem != null) {
			List<CartDetail> items = daocd.findByCartId(cartitem.getId());
			for (CartDetail item : items) {
				if (item.getProduct().getDiscount() == 0) {
					gia = item.getPrice();
					tongtien += gia * item.getAmount();
				} else {
					gia = item.getPrice() * (1 - ((double) item.getProduct().getDiscount() / 100));
					tongtien += gia * item.getAmount();
				}
			}

		}
		return tongtien;

	}

}
