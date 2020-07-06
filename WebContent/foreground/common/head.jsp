<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row-fluid">
	<div class="span12">
		
	</div>
</div>
<div class="row-fluid">
	<div class="span12">
		<div class="navbar">
		  <div class="navbar-inner">
		    <a class="brand" href="goIndex">HOME</a>
		    <ul class="nav">
		       <c:forEach var="newsType" items="${newsTypeList}">
		       		<li><a href="news?action=list&typeId=${newsType.newsTypeId }">${newsType.typeName }</a></li>
		       </c:forEach>
		    </ul>
		  </div>
		</div>
	</div>
</div>