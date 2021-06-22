package com.pjh.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;
import com.pjh.service.MainDao;
import com.pjh.service.UserDao;
import com.pjh.entity.*;;

public class testService {

	@Test
	public void test1() {
		MainDao md = new MainDao();
		MAIN m = new MAIN(123, "yqyq", "1", "ABC", "�żҿ���", "www.yqyq.com", "yqyqy@qq.com",
			"qwfa", "555555", "awsl", "1550003383", "1550003382", "15134", "�ߵ�ԺУ",
			"12sfaw23", "web", "2014", "2021", "qwdfas", "zbzdf", "dgsfh",
			"sgasasg", 99, "�����з�", "", "�����о�", "140.����ѧ 14015.��������ѧ", "",
			"", "", "yyqq", 0, "", 0, "",
			0);
		double result = (double) MainDao.insert(m);
		assertEquals(1,result, 0);
	}
	
	@Test
	public void test2() {
		double id = (double)UserDao.findUserIdByUsername("admin");
		assertEquals(1, id, 0);
	}
	
	@Test
	public void testDelete() {
		double result = (double) MainDao.deleteUser(5);
		assertEquals(1,result, 0);
	}
	
	@Test
	public void testUpdate() {
		double result = (double) MainDao.updateUserName("pjh", 4);
		assertEquals(1,result, 0);
	}

}
