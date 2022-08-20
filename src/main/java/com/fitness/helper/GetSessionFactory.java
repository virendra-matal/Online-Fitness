package com.fitness.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class GetSessionFactory {
	
	public static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		if(factory==null) {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}
	
	public static void CloseFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}

}
