<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function setDateTime(){
			var date=new Date();
			var day=date.getDay();
			var Month=date.getMonth();
			var week;
			switch(day){
			case 0:week="Sunday";break;
			case 1:week="Monday";break;
			case 2:week="Tuesday";break;
			case 3:week="Wednesday";break;
			case 4:week="Thursday";break;
			case 5:week="Friday";break;
			case 6:week="Saturday";break;
			}
			switch(Month){
			case 0:Month="January";break;
			case 1:Month="February";break;
			case 2:Month="March";break;
			case 3:Month="April";break;
			case 4:Month="May";break;
			case 5:Month="June";break;
			case 6:Month="July";break;
			case 7:Month="August";break;
			case 8:Month="September";break;
			case 9:Month="October";break;
			case 10:Month="November";break;
			case 11:Month="December";break;
			}
			var today=Month+" "+date.getDate()+","+date.getFullYear()+" "+week+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			document.getElementById("today").innerHTML=today;
		}
		
		window.setInterval("setDateTime()", 1000);
		
		function logout(){
			if(confirm('Are you sure you want to log out?')){
				window.location.href='user?action=logout';
			}
		}
		var admin = '${currentUser.userName }';
		if(admin == ''){
			window.location.href = 'background/login.jsp';
		}
	</script>
<div class="row-fluid">
	<div class="span12">
		<div>
			<div class="headLeft">
				
			</div>
			<div class="headRight">
				Welcome Administrator：<font color="red">${currentUser.userName }</font>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:logout()">[&nbsp;Exit&nbsp;]</a>&nbsp;&nbsp;&nbsp;&nbsp;<font id="today" class="currentDateTime"></font>
			</div>
		</div>
	</div>
</div>
