package com.gl.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.student.entity.Student;
import com.gl.student.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/list")
	public String getStudents(Model theModel) {		
		System.out.println("Request Received");											  // get list of students from database  // add list of students extracted from db to spring model(Map:Key-Value pair; key in frontend and value in backend) //Model is a class given by spring to interact between database and frontend. the data extracted from database(ie list of students will be stored in frontend in Model class) //Model accessible both in frontend and backend ; acts as a connection between frontend and backend
		List<Student> studentList = studentService.findAll();		
		theModel.addAttribute("ListOfStudents", studentList);                             //here Students name will be used in list-students.jsp as ${ListOfStudents}
		return "list-students";		
	}
	
	@RequestMapping("/display")
	public String displayListOfstudents(Model theModel) {
		List<Student> studentList = studentService.findAll();
		theModel.addAttribute("StudentsList", studentList);                             //here Students name will be used in list-students.jsp as ${ListOfStudents}
		return "display-list";		
	}
	
	@RequestMapping("/fillForm")
	public String showFormForAdd(Model theModel) {		
		Student theStudent = new Student();
		theModel.addAttribute("Student", theStudent);                                      //this "Student" should be same as that in student-form.jsp
		return "student-form";
	}
	
	@RequestMapping("/update")
	public String updateStudent(@RequestParam("studentId") int theId, Model theModel){		//this studentId should be same as that in list-students.jsp or else value will not come from frontend
		Student theStudent = studentService.findById(theId);								//model is for mapping frontend and backend	
		theModel.addAttribute("Student", theStudent);
		return "student-form";		
	}
	
	@PostMapping("/save")
	public String saveStudent(@RequestParam("id") int id, @RequestParam("name") String name,
							  @RequestParam("department") String department,@RequestParam("country") String country){
		
		System.out.println(id);
		Student theStudent;
		if(id != 0) {
			theStudent = studentService.findById(id);
			theStudent.setName(name);
			theStudent.setDepartment(department);
			theStudent.setCountry(country);
		} 
		else
			theStudent = new Student(name, department, country);		
		studentService.save(theStudent);                                                          // save the Student		
		return "redirect:/student/list";                                                          // use a redirect to prevent duplicate submissions
	}
	
	@RequestMapping("/delete")
	public String deleteStudent(@RequestParam("studentId") int theId) {				
				studentService.deleteById(theId);                                                  // delete the Student
				return "redirect:/student/list";                                                     // redirect to /Student/list
	}
	
}
