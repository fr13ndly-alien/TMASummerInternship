package stackjava.com.springmvchibernate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import stackjava.com.springmvchibernate.entities.Customer;
import stackjava.com.springmvchibernate.entities.Product;
import stackjava.com.springmvchibernate.entities.Staff;
import stackjava.com.springmvchibernate.service.CustomerService;
import stackjava.com.springmvchibernate.service.ProductService;
import stackjava.com.springmvchibernate.service.StaffService;


@Controller
public class HomeController {
	
	  @Autowired
	  private CustomerService customerService;
	  
	  @Autowired
	  private StaffService staffService;
	  
	  @Autowired
	  private ProductService productService;
	  
	  private String getPrincipal(){
		  String userName = null;
		  Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		  if (principal instanceof UserDetails) {
			  userName = ((UserDetails)principal).getUsername();
		  } else {
			  userName = principal.toString();
		  }
		  return userName;
	  }
	  
	  @RequestMapping(value = { "/login", "/" }, method = RequestMethod.GET)
	  	  public String loginPage() {
		  return "login2";
	  }
	  
	  @RequestMapping(value = "/admin", method = RequestMethod.GET)
	  public String adminPage(ModelMap model) {
		  String username = getPrincipal();
		  Staff staff = staffService.findByUsername(username);
		  model.addAttribute("staff", staff);
		  return "admin";
	  }
	  
	  @RequestMapping(value = "/user", method = RequestMethod.GET)
	  public String userPage(ModelMap model) {
		  String username = getPrincipal();
		  Staff staff = staffService.findByUsername(username);
		  model.addAttribute("staff", staff);
		  return "user";
	  }
	  
	  /* ************ STAFF HANDLER ********** */
	  @RequestMapping(value = {"/staff-update/{id}","*/staff-update/{id}", "staff-view/staff-update/{id}"})
	  public String updateStaff(@PathVariable String id, Model model) {
	    Staff staff = staffService.findById(id);
	    model.addAttribute("staff", staff);
	    return "staff-update";
	  }
	  
	  @RequestMapping("/updateStaff")
	  public String doUpdateStaff(@ModelAttribute("Staff") Staff staff, Model model) {
		System.out.println("Email : " + staff.getEmail());
	    staffService.update(staff);
	    model.addAttribute("staff", staff);
	    return "user";
	  }
	  
	  @RequestMapping("/staff-list")
	  public String listStaff(Model model) {
		  System.out.println("Getting staff.....");
		  List<Staff> staffs = staffService.findAll();
		  model.addAttribute("staffs", staffs);
		  return "staff-list";
	  }
	  @RequestMapping("/staff-list-api")
	  public String listStaffAPI(Model model) {
		  System.out.println("Getting staff.....");
		  List<Staff> staffs = staffService.findAll();
		  model.addAttribute("staffs", staffs);
		  return "staff-list-api";
	  }
	  
	  @RequestMapping("/staff-delete/{id}")
	  public String deleteStaff(@PathVariable String id, Model model) {
		  System.out.println("Deleting Staff id "+ id +"...");
		  staffService.delete(id);
		  System.out.println("Delete Success!");
		  List<Staff> staffs = staffService.findAll();
		  model.addAttribute("staffs", staffs);
		  return "staff-list";
	  }
	  
	  @RequestMapping("/staff-view/{id}")
	  public String viewStaff(@PathVariable String id, Model model) {
		  Staff staff = staffService.findById(id);
		  model.addAttribute("staff", staff);
		  return "staff-view";
	  };
	  
	  @RequestMapping("/staff-save")
	  public String saveStaff(Model model) {
		  Staff staff = new Staff();
		  staff.setGender("Male");
		  model.addAttribute("staff", staff);
		  return "staff-save";
	  }
	  @RequestMapping("/saveStaff")
	  public String doSaveStaff(@ModelAttribute Staff staff, Model model) {
		  staffService.save(staff);
		  List<Staff> staffs = staffService.findAll();
		  model.addAttribute("staffs", staffs);
		  return "staff-list";
	  }
	  
	  /* ************ END STAFF HANDLER ********** */
	  
	  @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	  public String accessDeniedPage(ModelMap model) {
		  model.addAttribute("user", getPrincipal());
	  	  return "accessDenied";
	  }
	  
	  @RequestMapping(value="/logout", method = RequestMethod.GET)
	  public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  if (auth != null){
			  new SecurityContextLogoutHandler().logout(request, response, auth);
		  }
		  return "redirect:/login?logout";
	  }
	  
	  /* ************ PRODUCT HANDLER ********** */
	  @RequestMapping(value = "/viewproducts", method = RequestMethod.GET)
	  public String viewProductsPage(ModelMap model) {
		  List<Product> listProduct = productService.findAll();
		  model.addAttribute("listProduct", listProduct);
		  return "viewproducts";
	  }
	  
	  @RequestMapping(value = "/adminviewproducts", method = RequestMethod.GET)
	  public String adminViewProductsPage(ModelMap model) {
		  List<Product> listProduct = productService.findAll();
		  model.addAttribute("listProduct", listProduct);
		  return "adminviewproducts";
	  }
	  
	  @RequestMapping(value = "/addproduct")
	  public String addProductPage(ModelMap model) {
		  model.addAttribute("product", new Product());
		  return "addproduct";
	  }
	  
	  @RequestMapping("/saveProduct")
	  public String doSaveCustomer(@ModelAttribute("Product") Product product, Model model) {
		productService.save(product);
	    List<Product> listProduct = productService.findAll();
	    model.addAttribute("listProduct", listProduct);
	    return "adminviewproducts";
	  }
	  
	  @RequestMapping("/product-edit/{id}")
	  public String productEdit(@PathVariable String id, Model model) {
		  model.addAttribute("product", productService.findById(id));
		  return "product-edit";
	  }
	  
	  @RequestMapping("product-delete/{id}")
	  public String productDelete(@PathVariable String id, Model model) {
		  productService.delete(id);
		  model.addAttribute("listProduct", productService.findAll());
		  return "adminviewproducts";
	  }
	  
	  @RequestMapping("/editProduct")
	  public String doEditProduct(@ModelAttribute Product product, Model model) {
		  productService.update(product);
		  model.addAttribute("listProduct", productService.findAll());
		  return "adminviewproducts";
	  }
	  
	  /* ************ END PRODUCT HANDLER ********** */
	  
	  /* ************ CUSTOMER HANDLER ********** */
	  @RequestMapping("/customer-save")
	  public String insertCustomer(Model model) {
	    model.addAttribute("customer", new Customer());
	    return "customer-save";
	  }

	  @RequestMapping("/customer-view/{id}")
	  public String viewCustomer(@PathVariable int id, Model model) {
	    Customer customer = customerService.findById(id);
	    model.addAttribute("customer", customer);
	    return "customer-view";
	  }
	  
	  @RequestMapping("/customer-update/{id}")
	  public String updateCustomer(@PathVariable int id, Model model) {
	    Customer customer = customerService.findById(id);
	    model.addAttribute("customer", customer);
	    return "customer-update";
	  }

	  @RequestMapping("/saveCustomer")
	  public String doSaveCustomer(@ModelAttribute("Customer") Customer customer, Model model) {
	    customerService.save(customer);
	    model.addAttribute("listCustomer", customerService.findAll());
	    return "customer-list";
	  }

	  @RequestMapping("/updateCustomer")
	  public String doUpdateCustomer(@ModelAttribute("Customer") Customer customer, Model model) {
	    customerService.update(customer);
	    model.addAttribute("listCustomer", customerService.findAll());
	    return "customer-list";
	  }
	  
	  @RequestMapping("/customerDelete/{id}")
	  public String doDeleteCustomer(@PathVariable int id, Model model) {
	    customerService.delete(id);
	    model.addAttribute("listCustomer", customerService.findAll());
	    return "customer-list";
	  }
	  
	  /* ************ END CUSTOMER HANDLER ********** */
	  
	  /* ************ END CUSTOMER HANDLER ********** */
	  @RequestMapping("/api-page")
	  public String restAPI() {
		  return "api-index";
	  }
	  
	  @RequestMapping("/rest/staff-save")
	  public String restStaffSave(Model model) {
		  Staff staff = new Staff();
		  staff.setGender("Male");
		  model.addAttribute("staff", staff);
		  return "api-staff-save";
	  }
	  
	  @RequestMapping(value = "/rest/staff-update/{id}", method = RequestMethod.GET)
	  public String restStaffUpdate(@PathVariable String id, Model model) {
		  model.addAttribute("staff", staffService.findById(id));
		  return "api-staff-update";
	  }
}
