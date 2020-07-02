<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<script type="text/javascript">
function newsDelete(newsId){
	if(confirm("Are you sure you want to delete this story?")){
		$.post("news?action=delete",{newsId:newsId},
			function(delFlag){
				var flag=eval('('+delFlag+')');
				if(flag){
					alert("Delete successful!");
					window.location.href="${pageContext.request.contextPath}/news?action=backList";
				}else{
					alert("Delete failed!");
				}
			}
		);
	}
}
</script>
<body>
<div class="data_list backMain">
	<div class="dataHeader navi">
		${navCode}
	</div>
	<div class="search_content" style="vertical-align: middle;">
		<form action="${pageContext.request.contextPath}/news?action=backList" method="post">
			Headline:<input type="text" id="s_title" name="s_title" style="width:180px" value="${s_title }"/>&nbsp;&nbsp;
			Date of Issue:<input type="text" id="s_bPublishDate" name="s_bPublishDate" class="Wdate" onclick="WdatePicker()" style="width: 100px;" value="${s_bPublishDate }"/>
			&nbsp;-&nbsp;<input type="text" id="s_aPublishDate" name="s_aPublishDate" class="Wdate" onclick="WdatePicker()" style="width: 100px;" value="${s_aPublishDate }"/>
			&nbsp;&nbsp;<button class="btn btn-mini btn-primary" type="submit" style="margin-top: -8px;">Query</button>
		</form>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th><input type="checkbox" id="checkedAll"/></th>
				<th>Number</th>
				<th>News Headlines</th>
				<th>News Category</th>
				<th>Release Time</th>
				<th>Operation</th>
			</tr>
			<c:forEach var="newsBack" items="${newsBackList }" varStatus="status">
				<tr>
					<td><input type="checkbox" name="newsIds" value="${newsBack.newsId}"/></td>
					<td>${status.index+1 }</td>
					<td>${newsBack.title }</td>
					<td>${newsBack.typeName }</td>
					<td><fmt:formatDate value="${newsBack.publishDate }" type="date" pattern="yyyy-MM-dd"/></td>
					<td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location.href='news?action=preSave&newsId=${newsBack.newsId}'">modify</button>&nbsp;<button class="btn btn-mini btn-danger" type="button" onclick="newsDelete(${newsBack.newsId})">delete</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="pagination pagination-centered">
  		<ul>
  			${pageCode }
  		</ul>
  	</div>
</div>
</body>
</html>