<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>layAdmin后台管理系统模板</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <link rel="stylesheet" href="../../static/css/app.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    	label{text-align: right;}
    	.icon-a-add{
    		display:block;
    		height:38px;
    		width:38px;
    		margin-left:10px;
    		float:left;
    		background-image:url(../icon/add1.png);
		    background-repeat: no-repeat;
		    background-position:50% 50%;
		    background-size: 18px 18px;  
    	}
    	.icon-a-sub{
    		display:block;
    		height:38px;
    		width:38px;
    		margin-left:10px;
    		float:left;
    		background-image:url(../icon/sub.png);
		    background-repeat: no-repeat;
		    background-position:50% 50%;
		    background-size: 20px 20px;  
		    
    	}
    	.icon-a-sub:hover{
    		background-image:url(../icon/sub-h.png);
    		background-color:#00000000;
    		cursor:pointer;
    	}
    	.icon-a-add:hover{
    		background-image:url(../icon/add1-h.png);
    		background-color:#00000000;
    		cursor:pointer;
    	}
    	.clear{
    		clear:both;
    	}
    	select{
    		display:inline-block;
    	}
    </style>
</head>
<body>
    <div class="tpl-app <!--{$Think.session.app_style} .tpl-small-app 为折叠状态-->">
<c:if test="${sessionScope.user.username == null }">
<script>
alert("请先进行登录");
window.location="../user/login.html";
</script>
</c:if>
        <!--头部-->
        <!--{include file="public/tpl-head"/}-->
        <div class="tpl-header tpl-left">
            <div class="tpl-header-item">
                <ul class="tpl-head-nav left-item">
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;" class="tpl-dent"><i class="layui-icon layui-icon-shrink-right"></i></a>
                    </li>
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;" target="_blank"><i class="layui-icon layui-icon-website"></i></a>
                    </li>
                    <li class="tpl-head-nav-item">
                        <a href=""><i class="layui-icon layui-icon-refresh"></i></a>
                    </li>
                </ul>
                <ul class="tpl-head-nav right-item">
                    <li class="tpl-head-nav-item">
                        <a href="../msg/index.html"><i class="layui-icon layui-icon-notice"></i></a>
                        <span class="tpl-badeg"></span>
                    </li>
                    <li class="tpl-head-nav-item theme">
                        <a href="javascript:;"><i class="layui-icon layui-icon-theme"></i></a>
                    </li>
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;" class="screen"><i class="layui-icon layui-icon-screen-full"></i></a>
                    </li>
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;" class="user-item">${sessionScope.user.username } <i class="fa caret fa-caret-down"></i></a>
                        <ul class="child-nav">
                            <span class="triangle"><em></em></span>
                            <li>
                                <a href="../user/login.html" class="logout"><i class="fa fa-sign-out"></i>退出登陆</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--导航栏-->
        <div class="tpl-side">
            <div class="tpl-side-menu">
                <div class="tpl-user-image">
                    <span class="user-name">河北省科技信息通用调查</span>
                    <a href="javascript:;" class="user-logo"><img src="../../static/images/logo.jpg"></a>
                </div>
                <ul class="tpl-nav">
                    <div class="tpl-nav-body">
					<c:choose>
                    <c:when test="${sessionScope.user.status == 0 }">
                        <li class="nav-item">
                            <a href="/Demand/view/demand/index.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-home nav-icon"></i>
                                <span>主页</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../demand/index.html" class="nav-item-link">
                                <i class="layui-icon layui-icon-user nav-icon"></i>
                                <span>信息征集管理</span>
                                <i class="fa fa-caret-right nav-right-icon"></i>
                            </a>
                            <ul class="child-nav">
                                <li class="child-nav-item">
                                    <a href="../demand/demand_add.jsp">
                                        <i class="fa fa-plus-circle"></i>
                                        <span>需求征集</span>
                                    </a>
                                </li>
                                <li class="child-nav-item">
                                    <a href="../demand/main_manage.jsp">
                                        <i class="fa fa-users"></i>
                                        <span>需求管理</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        
                        
                    </c:when>
                    <c:when test="${sessionScope.user.status == -2 }">
                        <li class="nav-item">
                            <a href="/Demand/view/demand/index.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-home nav-icon"></i>
                                <span>主页</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../demand/check.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-survey nav-icon"></i>
                                <span>形式审核</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../index.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-read nav-icon"></i>
                                <span>统计查询权限</span>
                            </a>
                        </li>
                    </c:when>
                    <c:when test="${sessionScope.user.status > 0 }">
                        <li class="nav-item">
                            <a href="/Demand/view/demand/index.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-home nav-icon"></i>
                                <span>主页</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../demand/check.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-survey nav-icon"></i>
                                <span>部门审核</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../index.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-read nav-icon"></i>
                                <span>统计查询权限</span>
                            </a>
                        </li>
                    </c:when>
                    <c:when test="${sessionScope.user.status == -1 }">
                        <li class="nav-item">
                            <a href="/Demand/view/demand/index.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-home nav-icon"></i>
                                <span>主页</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../demand/demand_manage.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-survey nav-icon"></i>
                                <span>查看所有需求</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../demand/auth_manage.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-read nav-icon"></i>
                                <span>用户权限管理</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../demand/charts.jsp" class="nav-item-link">
                                <i class="layui-icon layui-icon-read nav-icon"></i>
                                <span>图表统计</span>
                            </a>
                        </li>
                    </c:when>
                    </c:choose>
                    </div>
                </ul>
                <ul class="tpl-bottom-nav">
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-notice"></i></a>
                    </li>
                    <li class="tpl-head-nav-item theme">
                        <a href="javascript:;"><i class="layui-icon layui-icon-theme"></i></a>
                    </li>
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-username"></i></a>
                    </li>
                    <li class="tpl-head-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-edit"></i></a>
                    </li>
                </ul>
            </div>
        </div>