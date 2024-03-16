package com.example.webstorex.Controller.User;

import java.util.List;

import com.example.webstorex.Entity.Account;
import com.example.webstorex.Entity.CartDetail;
import com.example.webstorex.Entity.CartItem;
import com.example.webstorex.Interface.CartDetailDAO;
import com.example.webstorex.Interface.CartItemDAO;
import com.example.webstorex.Service.SessionService;
import com.example.webstorex.Service.ShoppingCartService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CRUDCartController {

	@Autowired
	SessionService session;

	@Autowired
	ShoppingCartService cart;

	@Autowired
	HttpServletRequest req;

	@Autowired
	CartDetailDAO daocd;

	@Autowired
	CartItemDAO daoci;
// xem gio hang
	@RequestMapping("/user/cart")
	public String cart(Model model) {
		// lay user dn, tim cartitem cua user do
		Account acc = session.getAttribute("user");
		CartItem cartitem = daoci.findByAccount(acc);
		if (acc != null && cartitem != null) {
			List<CartDetail> items = daocd.findByCartId(cartitem.getId());
			model.addAttribute("list2", items);
			model.addAttribute("SLTGH", cart.getCount());
		} else {
			System.err.println("NULL");
		}
		model.addAttribute("TT", cart.getTotal());
		return "sub-page/cart";
	}
// xem gio hang post
	@PostMapping("/user/cart")
	public String cart1(Model model) {
		// lay user dn, tim cartitem cua user do
		Account acc = session.getAttribute("user");
		CartItem cartitem = daoci.findByAccount(acc);
		if (acc != null && cartitem != null) {
			List<CartDetail> items = daocd.findByCartId(cartitem.getId());
			model.addAttribute("list2", items);
			model.addAttribute("SLTGH", cart.getCount());
		} else {
			model.addAttribute("message", "Trống");
		}
		model.addAttribute("TT", cart.getTotal());
		return "sub-page/cart";
	}
// them gio hang
	@RequestMapping("/user/add/cart/product/{id}")
	public String addcart(Model model, @PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/user/cart";
	}
// cap nhat gio hang
	@PostMapping("/user/cart/update")
	public String updatecart(Model model) {
		Account acc = session.getAttribute("user");
		CartItem cartitem = daoci.findByAccount(acc);
		System.err.println("Tk: "+acc.getUsername());
		if (acc != null && cartitem != null) {
			List<CartDetail> items = daocd.findAll();
			for(CartDetail item: items) {
				String amount = req.getParameter(item.getProduct().getId().toString());
				/* System.err.println("amount"+item.getId()+";"+amount); */
				if(amount!=null) {
					cart.update(item.getProduct().getId(), Integer.parseInt(amount));
				}
			}
		}
		return "redirect:/user/cart";
	}
	// xoa gio hang
	@RequestMapping("/user/cart/delete/{id}")
	public String delete(@PathVariable("id") Integer id, Model m, RedirectAttributes params) {
		try {
			cart.remove(id);
			params.addAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			params.addAttribute("message", "Xóa thất bại!");
		}

		return "redirect:/user/cart";
	}


}
