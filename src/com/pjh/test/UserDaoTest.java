package com.pjh.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.pjh.entity.MAIN;
import com.pjh.entity.USER;
import com.pjh.service.MainDao;
import com.pjh.service.UserDao;

public class UserDaoTest {
	// �����û���Ϣ��ӹ���
	@Test
	public void testInsert() {
		USER user = new USER(0, "ccc", "123", null, null, null, null, 
				null, null, null, null, null, null, 
				null, null, null, null, null, 0);
		double result = (double) UserDao.insert(user);
		assertEquals(1,result, 0);
	}
	
	// ���Ը����û�����ѯ�û���Ϣ����
	@Test
	public void testSelect() {
		double id = (double)UserDao.findUserIdByUsername("admin");
		assertEquals(1, id, 0);
	}
	
	// ���Ը���idɾ���û���Ϣ����
	@Test
	public void testDelete() {
		double result = (double) MainDao.deleteUser(16);
		assertEquals(1,result, 0);
	}
	
	// ���Ը����û���Ϣ����
	@Test
	public void testUpdate() {
		double result = (double) MainDao.updateUserName("pjh2", 4);
		assertEquals(1,result, 0);
	}
}
