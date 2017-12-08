<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.tagging.*" %>
<cq:defineObjects/> 
<p>
    this is the general page body
</p>
<hr>
<%
TagManager tagManager = resourceResolver.adaptTo(TagManager.class);
Tag[] tags = tagManager.getTags(resource);
for(Tag tag:tags){
%>
<a href="/content/bootcamp/page/home.html?id=<%=tag.getTagID()%>"><%=tag.getTitle()%></a><br>
<%}%>