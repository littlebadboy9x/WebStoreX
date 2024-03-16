package com.example.webstorex.Controller.User;
import java.util.Date;
import java.util.List;
import com.example.webstorex.Entity.*;
import com.example.webstorex.Interface.*;
import com.example.webstorex.Service.SessionService;
import com.example.webstorex.Service.ShoppingCartService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {

	@Autowired
	ShoppingCartService cart;

	@Autowired
	SessionService session;

	@Autowired
	PayDAO dao;

	@Autowired
	OrderDetailDAO ordao;

	@Autowired
	ProductDAO daopd;

	@Autowired
	CartDetailDAO daocd;

	@Autowired
	CartItemDAO daoci;

	@Autowired
	HttpServletRequest req;

	@GetMapping("/user/cart/checkout")
	public String checkout1(Model model) {
		model.addAttribute("TT", cart.getTotal());
		return "sub-page/checkout";
	}

	@PostMapping("/user/cart/checkout")
	public String checkout(Model model) {
		Date date = new Date();
		Account acc = session.getAttribute("user");
		CartItem cartitem = daoci.findByAccount(acc);
		// tao don hang
		if (cart.getCount() == 0) {
			System.err.println("NULL Giỏ hàng");
			model.addAttribute("message", "Không có gì để thanh toán!");
		} else {
			Pay pay = new Pay();
			pay.setAccount(acc);
			pay.setAddress(req.getParameter("address"));
			pay.setMessage(req.getParameter("message"));
			pay.setPhone(req.getParameter("phone"));
			pay.setTotal(cart.getTotal());
			pay.setPayment(req.getParameter("payment"));
			pay.setStatus("Chưa thanh toán");
			pay.setCreated(date);
			dao.saveAndFlush(pay);
			// them tung sp vao ord
			if (acc != null && cartitem != null) {
				List<CartDetail> items = daocd.findByCartId(cartitem.getId());
				for (CartDetail item : items) {
					OrderDetail ord = new OrderDetail();
					ord.setPay(pay);
					ord.setProduct(item.getProduct());
					ord.setAmount(item.getAmount());
					ord.setPrice(item.getPrice());
					ordao.saveAndFlush(ord);
					daocd.delete(item);
				}
				model.addAttribute("message", "Bạn đã đặt hàng thành công!");
			} else {
				System.err.println("NULL");
			}
		}

		model.addAttribute("SLTGH", cart.getCount());
		model.addAttribute("TT", cart.getTotal());
		return "sub-page/checkout";
	}

	@RequestMapping("/user/order/history")
	public String HistoryOrder(Model model) {
		Account item = session.getAttribute("user");
		List<Pay> historyorder = dao.findByAccount(item);
		model.addAttribute("historyorder", historyorder);
		return "order/historyorder";

	}

	@RequestMapping("/user/order/detail/{id}")
	public String listOrderDetail(Model model, @PathVariable("id") Long id) {
		Pay item = dao.findById(id).get();
		model.addAttribute("total", item.getTotal().intValue());
		model.addAttribute("ord", item);
		List<OrderDetail> listorderdetail = ordao.findByPayId(id);
		model.addAttribute("listorderdetail", listorderdetail);
		return "order/orderdetailhistory";
	}

	@RequestMapping("/user/order/list")
	public String listproducthistory(Model model) {
		Account item = session.getAttribute("user");
		List<Product> list = dao.getProductByUsername(item.getUsername());
		model.addAttribute("list", list);
		return "order/listproducthistory";
	}
	@ModelAttribute("listob")
	public List<Report2> getReport() {
		List<Report2> list = daopd.getAmountTotal();
		return list;
	}
	
}
