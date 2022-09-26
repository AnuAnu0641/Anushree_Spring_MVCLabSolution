package com.gl.student.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.gl.student.entity.Student;

@Repository
public class StudentServiceImpl implements StudentService {
	
	private SessionFactory sessionFactory;
	
	private Session session;	
																			//here we are passing sessionFactory values from servlet.xml to controller -for that give Autowired // check if Autowire is necessary
	@Autowired
	public StudentServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
		try {
			this.session=sessionFactory.getCurrentSession();
		}
		catch(HibernateException e) {
			this.session = sessionFactory.openSession();
		}
	}

	@Override
	public List<Student> findAll() {		
		List<Student> studentList = session.createQuery("from Student").list();
		return studentList;
	}

	@Override
	public Student findById(int id) {
		Student student = new Student();
		student = session.get(Student.class, id);                                         //this id is the value coming from parameter
		return student;
	}

	@Override
	@Transactional
	public void save(Student theStudent) {
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(theStudent);
		tx.commit();
	}

	@Override
	@Transactional
	public void deleteById(int id) {
		Transaction tx = session.beginTransaction();
		Student student = session.get(Student.class, id);
		session.delete(student);
		tx.commit();
	}
	
}
