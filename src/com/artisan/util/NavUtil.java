package com.artisan.util;

public class NavUtil {

	public static String genNewsManageNavigation(String modName,String actionName){
		StringBuffer navCode=new StringBuffer();
		navCode.append("WORLD£º&nbsp;&nbsp;");
		navCode.append("HOME&nbsp;&nbsp;>&nbsp;&nbsp;");
		navCode.append(modName+"&nbsp;&nbsp;>&nbsp;&nbsp;");
		navCode.append(actionName+"&nbsp;&nbsp;");
		return navCode.toString();
	}
	
	public static String genNewsListNavigation(String typeName,String typeId){
		StringBuffer navCode=new StringBuffer();
		navCode.append("WORLD£º&nbsp;&nbsp;");
		navCode.append("<a href='goIndex'>HOME</a>&nbsp;&nbsp;>&nbsp;&nbsp;");
		navCode.append("<a href='news?action=list&typeId="+typeId+"'>"+typeName+"</a>");
		return navCode.toString();
	}
	
	public static String genNewsNavigation(String typeName,String typeId,String newsName){
		StringBuffer navCode=new StringBuffer();
		navCode.append("WORLD£º&nbsp;&nbsp;");
		navCode.append("<a href='goIndex'>HOME</a>&nbsp;&nbsp;>&nbsp;&nbsp;");
		navCode.append("<a href='news?action=list&typeId="+typeId+"'>"+typeName+"</a>&nbsp;&nbsp;>&nbsp;&nbsp;"+newsName);
		return navCode.toString();
	}
}
