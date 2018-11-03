package stackjava.com.springmvchibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import stackjava.com.springmvchibernate.dao.StaffDAO;
import stackjava.com.springmvchibernate.entities.Staff;

@Service
@Transactional
public class StaffService {
	  @Autowired
	  private StaffDAO staffDAO;
	  
	  public List<Staff> findAll() {
	    return staffDAO.findAll();
	  }

	  public Staff findById(String id) {
	    return staffDAO.findById(id);
	  }
	  
	  public Staff findByUsername(String username) {
		    return staffDAO.findByUsername(username);
	  }
	  
	  public void save(Staff staff){
	    // validate business
		  staffDAO.save(staff);
	  }

	  public void update(Staff staff){
	    // validate business
		  staffDAO.update(staff);
	  }
	  
	  public void delete(String id){
	    // validate business
		  staffDAO.delete(id);
	  }
}
