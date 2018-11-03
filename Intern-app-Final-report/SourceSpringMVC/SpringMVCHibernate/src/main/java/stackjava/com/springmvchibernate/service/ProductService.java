package stackjava.com.springmvchibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import stackjava.com.springmvchibernate.dao.ProductDAO;
import stackjava.com.springmvchibernate.entities.Product;

@Service
@Transactional
public class ProductService {
	@Autowired
	  private ProductDAO productDAO;
	  
	  public List<Product> findAll() {
	    return productDAO.findAll();
	  }

	  public Product findById(String id) {
	    return productDAO.findById(id);
	  }
	  
	  public Product findByName(String name) {
		    return productDAO.findByName(name);
	  }
	  
	  public void save(Product product){
	    // validate business
		  productDAO.save(product);
	  }

	  public void update(Product product){
	    // validate business
		  productDAO.update(product);
	  }
	  
	  public void delete(String id){
	    // validate business
		  productDAO.delete(id);
	  }
}
