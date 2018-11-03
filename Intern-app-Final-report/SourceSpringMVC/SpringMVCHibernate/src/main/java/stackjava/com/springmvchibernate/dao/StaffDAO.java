package stackjava.com.springmvchibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import stackjava.com.springmvchibernate.entities.Staff;

@Repository(value = "staffDAO")
@Transactional(rollbackFor = Exception.class)
public class StaffDAO {
	  @Autowired
	  private SessionFactory sessionFactory;

	  public void save(final Staff staff) {
	    Session session = this.sessionFactory.getCurrentSession();
	    session.save(staff);
	  }

	  public void update(final Staff staff) {
	    Session session = this.sessionFactory.getCurrentSession();
	    session.update(staff);
	  }

	  public Staff findById(final String id) {
	    Session session = this.sessionFactory.getCurrentSession();
	    return session.get(Staff.class, id);
	  }
	  
	  public Staff findByUsername(final String username) {
		  
		  List<Staff> listStaff = this.findAll();
		  for(Staff staff : listStaff) {
			  if(staff.getUsername().equals(username)) {
				  return staff;
			  }
		  }
		  
		  return null;
	  }

	  public void delete(final String id) {
	    Session session = this.sessionFactory.getCurrentSession();
	    Staff staff = this.findById(id);
	    session.remove(staff);
	  }

	  public List<Staff> findAll() {
	    Session session = this.sessionFactory.getCurrentSession();
	    return session.createQuery("FROM Staff", Staff.class).getResultList();
	  }
}
