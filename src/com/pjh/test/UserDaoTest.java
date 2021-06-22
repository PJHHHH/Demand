package com.pjh.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.pjh.entity.MAIN;
import com.pjh.entity.USER;
import com.pjh.service.MainDao;
import com.pjh.service.UserDao;

public class UserDaoTest {
	// 测试用户信息添加功能
	@Test
	public void testInsert() {
		USER user = new USER(0, "ccc", "123", null, null, null, null, 
				null, null, null, null, null, null, 
				null, null, null, null, null, 0);
		double result = (double) UserDao.insert(user);
		assertEquals(1,result, 0);
	}
	
	// 测试根据用户名查询用户信息功能
	@Test
	public void testSelect() {
		double id = (double)UserDao.findUserIdByUsername("admin");
		assertEquals(1, id, 0);
	}
	
	// 测试根据id删除用户信息功能
	@Test
	public void testDelete() {
		double result = (double) MainDao.deleteUser(16);
		assertEquals(1,result, 0);
	}
	
	// 测试更新用户信息功能
	@Test
	public void testUpdate() {
		double result = (double) MainDao.updateUserName("pjh2", 4);
		assertEquals(1,result, 0);
	}
}
