package com.artisan.util;

public class PageUtil {

	public static String getUpAndDownPagation(int totalNum,int currentPage,int pageSize,String typeId){
		int totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		StringBuffer pageCode=new StringBuffer();
		pageCode.append("<ul class='pager'>");
		if(currentPage==1){
			pageCode.append("<li class='disabled'><a href='#'>back</a></li>");
		}else{
			pageCode.append("<li><a href='news?action=list&typeId="+typeId+"&page="+(currentPage-1)+"'>back</a></li>");			
		}
		pageCode.append("&nbsp;&nbsp;");
		if(currentPage==totalPage){
			pageCode.append("<li class='disabled'><a href='#'>next</a></li>");
		}else{
			pageCode.append("<li><a href='news?action=list&typeId="+typeId+"&page="+(currentPage+1)+"'>next</a></li>");			
		}
		pageCode.append("</ul>");
		return pageCode.toString();
	}
	
	public static String getPagation(String targetUrl,int totalNum,int currentPage,int pageSize){
		int totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		StringBuffer pageCode=new StringBuffer();
		pageCode.append("<li><a href='"+targetUrl+"&page=1'>HOME</a></li>");
		if(currentPage==1){
			pageCode.append("<li class='disabled'><a href='#'>back</a></li>");
		}else{
			pageCode.append("<li><a href='"+targetUrl+"&page="+(currentPage-1)+"'>back</a></li>");
		}
		
		for(int i=currentPage-2;i<=currentPage+2;i++){
			if(i<1 || i>totalPage){
				continue;
			}
			if(i==currentPage){
				pageCode.append("<li class='active'><a href='#'>"+i+"</a></li>");
			}else{
				pageCode.append("<li><a href='"+targetUrl+"&page="+i+"'>"+i+"</a></li>");
			}
			
		}
		
		if(currentPage==totalPage){
			pageCode.append("<li class='disabled'><a href='#'>next</a></li>");
		}else{
			pageCode.append("<li><a href='"+targetUrl+"&page="+(currentPage+1)+"'>next</a></li>");
		}
		pageCode.append("<li><a href='"+targetUrl+"&page="+totalPage+"'>end</a></li>");
		return pageCode.toString();
	}
}
