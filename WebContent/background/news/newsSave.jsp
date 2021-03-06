<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkChange(){
		if(document.getElementById("isImage").checked){
			$("#hdtp").show();
		}else{
			$("#hdtp").hide();
		}
	}
	
	function checkForm(){
		var title=document.getElementById("title").value;
		var author=document.getElementById("author").value;
		var typeId=document.getElementById("typeId").value;
		var content=CKEDITOR.instances.content.getData();
		if(title==null||title==""){
			document.getElementById("error").innerHTML="News headlines should not be empty！";
			return false;
		}
		if(author==null||author==""){
			document.getElementById("error").innerHTML="The author cannot be empty！";
			return false;
		}
		if(typeId==null||typeId==""){
			document.getElementById("error").innerHTML="Please select the news category！";
			return false;
		}
		if(content==null||content==""){
			document.getElementById("error").innerHTML="The news content cannot be empty！";
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="data_list backMain">
	<div class="dataHeader navi">
		${navCode}
	</div>
	<div class="data_content">
		<form action="news?action=save" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
			<table cellpadding="5" width="100%">
				<tr>
					<td width="80px">
						<label>Headline:</label>
					</td>
					<td>
						<input type="text" id="title" name="title" class="input-xxlarge" value="${news.title }"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>News writer:</label>
					</td>
					<td>
						<input type="text" id="author" name="author" value="${news.author }"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>News Category:</label>
					</td>
					<td>
						<select id="typeId" name="typeId">
							<option value="">Please select the news category</option>
							<c:forEach var="newsType" items="${newsTypeList }">
								<option value="${newsType.newsTypeId }" ${newsType.newsTypeId==news.typeId?'selected':'' }>${newsType.typeName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label>News properties:</label>
					</td>
					<td>
						<label class="checkbox inline">
						  <input type="checkbox" id="isHead" name="isHead" value="1" ${news.isHead==1?'checked':'' }>Headlines
						</label>
						<label class="checkbox inline">
						  <input type="checkbox" id="isImage" name="isImage" onclick="checkChange()" value="1" ${news.isImage==1?'checked':'' }>Slide
						</label>
						<label class="checkbox inline">
						  <input type="checkbox" id="isHot" name="isHot" value="1" ${news.isHot==1?'checked':'' }>Hot
						</label>
					</td>
				</tr>
				<tr id="hdtp" style="display: none">
					<td>
						<label>Slide show Pictures:</label>
					</td>
					<td>
						<input type="file" id="picFile" name="picFile" />
						<input type="text" id="imageName" name="imageName" value="${news.imageName }"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label>News Content:</label>
					</td>
					<td>
						<textarea class="ckeditor" id="content" name="content">${news.content }</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="newsId" name="newsId" value="${news.newsId }"/>&nbsp;
					</td>
					<td>
						<input type="submit" class="btn btn-primary" value="save"/>&nbsp;&nbsp;
						<input type="button" class="btn btn-primary" value="return" onclick="javascript:history.back()"/>&nbsp;&nbsp;<font id="error" color="red">${error }</font>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</div>
</body>
</html>
<script>
	if('${news.isImage}'==1){
		$("#hdtp").show();	
	}
</script>