package com.pjh.test;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.Test;

import com.pjh.entity.MAIN;
import com.pjh.service.MainDao;
import com.pjh.service.UserDao;

public class MainDaoTest {
	// 测试插入表单功能
	@Test
	public void testAdd() {
		MainDao md = new MainDao();
		MAIN m = new MAIN(123, "yqyq", "1", "ABC", "张家口市", "www.yqyq.com", "yqyqy@qq.com",
			"qwfa", "555555", "awsl", "1550003383", "1550003382", "15134", "高等院校",
			"12sfaw23", "web", "2014", "2021", "qwdfas", "zbzdf", "dgsfh",
			"sgasasg", 99, "独立研发", "", "基础研究", "140.物理学 14015.理论物理学", "",
			"", "", "yyqq", 0, "", 0, "",
			0);
		double result = (double) MainDao.insert(m);
		assertEquals(1,result, 0);
	}
	
	// 测试查询全部表单功能
	@Test
	public void testSelectAll() {
		ArrayList<MAIN> list = new ArrayList<>();
		list = MainDao.selectMainAll();
		assertEquals(179, list.size(), 0);
	}
	
	// 测试根据id查询表单功能
	@Test
	public void testSelectMain() {
		ArrayList<MAIN> list = new ArrayList<>();
		list.add(MainDao.selectMainById(7));
		assertEquals(1, list.size(), 0);
	}
	
	// 测试根据id删除表单功能
	@Test
	public void testDelete() {
		double result = (double) MainDao.deleteMainById(10);
		assertEquals(1,result, 0);
	}
	
	// 测试更新表单功能
	@Test
	public void testUpdate() {
		double result = (double) MainDao.updateMain(1, "111", 1, 20);
		assertEquals(1,result, 0);
	}
}
