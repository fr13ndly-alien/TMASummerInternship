package stackjava.com.springmvchibernate.restful.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import stackjava.com.springmvchibernate.entities.Staff;
import stackjava.com.springmvchibernate.entities.UserAPI;
import stackjava.com.springmvchibernate.service.StaffService;

@RestController
public class StaffRestController {
	
	@Autowired
	StaffService staffService;
	
	  /* ---------------- FIND ALL STAFF ------------------------ */
	@RequestMapping(value = "/rest/staffs", method= RequestMethod.GET)
	public ResponseEntity<List<Staff>> getAllStaff(){
		List<Staff> listStaff = new ArrayList<Staff>(staffService.findAll());
		return new ResponseEntity<List<Staff>>(listStaff, HttpStatus.OK);
	}
	
	/* ---------------- FIND BY ID ------------------------ */
	@RequestMapping(value = "/rest/staff/{id}", method = RequestMethod.GET)
	public ResponseEntity<Staff> findById(@PathVariable String id){
		Staff staff= staffService.findById(id);
		return new ResponseEntity<Staff>(staff, HttpStatus.OK);
	}
	
	/* ---------------- CREATE NEW STAFF ------------------------ */
	//save and return that staff
	@RequestMapping(value = "rest/staff-save", method = RequestMethod.POST)
	public ResponseEntity<Staff> saveStaff(@ModelAttribute Staff staff){
		staffService.save(staff);
		return new ResponseEntity<Staff>(staff, HttpStatus.OK);
	}
	
	/* ---------------- DELETE STAFF ------------------------ */
	@RequestMapping(value= "rest/staff-delete/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteStaff(@PathVariable String id){
		staffService.delete(id);
		return new ResponseEntity<String>("Deleted!", HttpStatus.OK);
	}
	
	/* ---------------- UPDATE STAFF ------------------------ 
	 * @RequestBody annotation parse request data to Object
	 * when you send request, you sent data with JSON type, not submit type in web
	 * */
	
	@RequestMapping(value = "rest/staff-update", method = RequestMethod.POST)
	public ResponseEntity<String> updateStaff(@RequestBody Staff staff){
		staffService.update(staff);
		return new ResponseEntity<String>("Updated!", HttpStatus.OK);
	}
		
}
