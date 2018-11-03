package stackjava.com.springmvchibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import stackjava.com.springmvchibernate.entities.Product;

@Repository(value = "productDAO")
@Transactional(rollbackFor = Exception.class)
public class ProductDAO {
	  @Autowired
	  private SessionFactory sessionFactory;

	  public void save(final Product product) {
	    Session session = this.sessionFactory.getCurrentSession();
	    session.save(product);
	  }

	  public void update(final Product product) {
	    Session session = this.sessionFactory.getCurrentSession();
	    session.update(product);
	  }

	  public Product findById(final String id) {
	    Session session = this.sessionFactory.getCurrentSession();
	    return session.get(Product.class, id);
	  }
	  
	  public Product findByName(final String name) {
		  
		  List<Product> listProduct = this.findAll();
		  for(Product product : listProduct) {
			  if(product.getName().equals(name)) {
				  return product;
			  }
		  }
		  
		  return null;
	  }

	  public void delete(final String id) {
	    Session session = this.sessionFactory.getCurrentSession();
	    Product product = this.findById(id);
	    session.remove(product);
	  }

	  public List<Product> findAll() {
	    Session session = this.sessionFactory.getCurrentSession();
	    return session.createQuery("FROM Product", Product.class).getResultList();
	  }
}
