<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#checkedAll").click(function(){
			if($(this).prop("checked")==true){
				$("input[name='commentIds']").prop("checked",true);
			}else{
				$("input[name='commentIds']").prop("checked",false);
			}
		});
		
	});
	
	function commentsDelete(){
		var chk_value=[];
		$('input[name="commentIds"]:checked').each(function(){
			chk_value.push($(this).val());
		});
		if(chk_value.length==0){
			alert("Select the data to delete");
			return;
		}
		var commentIds=chk_value.join(",");
		if(confirm("Are you sure you want to delete these comments?")){
			$.post("comment?action=delete",{commentIds:commentIds},
				function(result){
					var result=eval('('+result+')');
					if(result.success){
						alert("Deleted successfully"+result.delNums+"pieces of data");
						window.location.href="${pageContext.request.contextPath}/comment?action=backList";
					}else{
						alert(result.errorMsg);
					}
				}
			);
		}
	}

	function commentDelete(commentId){
		if(confirm("Are you sure you want to delete this comment?")){
			$.post("comment?action=delete",{commentIds:commentId},
				function(result){
					var result=eval('('+result+')');
					if(result.success){
						alert("Delete successful!");
						window.location.href="${pageContext.request.contextPath}/comment?action=backList";
					}else{
						alert(result.errorMsg);
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
	<div class="search_content" style="vertical-align: middle;padding-right: 20px;">
		<div style="float: left;padding-top: 10px;">
			<button class="btn btn-mini btn-danger" type="button" onclick="commentsDelete()">Batch delete</button>
		</div>
		<div style="float: right;">
			<form action="${pageContext.request.contextPath}/comment?action=backList" method="post">
				Comment on the date：<input type="text" id="s_bCommentDate" name="s_bCommentDate" class="Wdate" onclick="WdatePicker()" style="width: 100px;" value="${s_bCommentDate }"/>
				&nbsp;-&nbsp;<input type="text" id="s_aCommentDate" name="s_aCommentDate" class="Wdate" onclick="WdatePicker()" style="width: 100px;" value="${s_aCommentDate }"/>
				&nbsp;&nbsp;<button class="btn btn-mini btn-primary" type="submit" style="margin-top: -8px;">Query</button>
			</form>
		</div>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th><input type="checkbox" id="checkedAll"/></th>
				<th>Number</th>
				<th>Comment content</th>
				<th>Subject</th>
				<th>Comment time</th>
				<th>Operation</th>
			</tr>
			<c:forEach var="commentBack" items="${commentBackList }" varStatus="status">
				<tr>
					<td><input type="checkbox" name="commentIds" value="${commentBack.commentId}"/></td>
					<td>${status.index+1 }</td>
					<td><a title="${commentBack.content }">${fn:substring(commentBack.content,0,15) }...</a></td>
					<td><a title="${commentBack.newsTitle }" target="_blank" href="news?action=show&newsId=${commentBack.newsId }">${fn:substring(commentBack.newsTitle,0,15) }...</a></td>
					<td><fmt:formatDate value="${commentBack.commentDate }" type="date" pattern="yyyy-MM-dd"/></td>
					<td><button class="btn btn-mini btn-danger" type="button" onclick="commentDelete(${commentBack.commentId})">delete</button></td>
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