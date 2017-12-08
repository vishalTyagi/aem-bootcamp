<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.tagging.*,com.day.cq.commons.RangeIterator" %>
<cq:defineObjects/>
<%@page session="false" %>
<% String text = (String)properties.get("title");
    if(text!=null){
%>
<%=text%>
<%}else{%>
BLog Text
<%}%>
<%
    TagManager tagManager = resourceResolver.adaptTo(TagManager.class);
    Tag[] tags = tagManager.getTags(resource);
    for(Tag tag:tags){
%>
<a href="/content/bootcamp/page/home.html?id=<%=tag.getTagID()%>"><%=tag.getTitle()%></a><br>
<%}%>
