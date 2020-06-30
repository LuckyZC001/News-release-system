<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function newsTypeDelete(newsTypeId){
		if(confirm("Are you sure you want to delete this news category?")){
			$.post("newsType?action=delete",{newsTypeId:newsTypeId},
				function(result){
					var result=eval('('+result+')');
					if(result.success){
						alert("Delete successful!");
						window.location.href="${pageContext.request.contextPath}/newsType?action=backList";
					}else{
						alert(result.errorMsg);
					}
				}
			);
		}
	}
</script>
</head>
<body>
<div class="data_list backMain">
	<div class="dataHeader navi">
		${navCode}
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th>Number</th>
				<th>Category Name</th>
				<th>Operation</th>
			</tr>
			<c:forEach var="newsTypeBack" items="${newsTypeBackList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${newsTypeBack.typeName }</td>
					<td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='newsType?action=preSave&newsTypeId=${newsTypeBack.newsTypeId}'">modify</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" onclick="newsTypeDelete(${newsTypeBack.newsTypeId})">delete</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>