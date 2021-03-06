<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function linkDelete(linkId){
		if(confirm("Are you sure you want to delete this link?")){
			$.post("link?action=delete",{linkId:linkId},
				function(result){
					var result=eval('('+result+')');
					if(result.success){
						alert("Delete successful!");
						window.location.href="${pageContext.request.contextPath}/link?action=backList";
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
				<th>number</th>
				<th>link name</th>
				<th>link address</th>
				<th>email</th>
				<th>sort order</th>
				<th>operation</th>
			</tr>
			<c:forEach var="linkBack" items="${linkBackList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${linkBack.linkName }</td>
					<td>${linkBack.linkUrl }</td>
					<td>${linkBack.linkEmail }</td>
					<td>${linkBack.orderNum }</td>
					<td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='link?action=preSave&linkId=${linkBack.linkId}'">modify</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" onclick="linkDelete(${linkBack.linkId})">delete</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>