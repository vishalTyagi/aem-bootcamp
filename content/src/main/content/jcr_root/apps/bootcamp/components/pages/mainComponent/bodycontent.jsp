<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.tagging.*,com.day.cq.commons.RangeIterator" %>
<cq:defineObjects/> 
<p>
    <b>Bootcamp</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/content/bootcamp/page/generalPage.html">Back</a>
</p>
<%
    String tagId = request.getParameter("id");%>
<%=tagId%> +++
<%
if(tagId !=null){
	TagManager tagManager = resourceResolver.adaptTo(TagManager.class);
	RangeIterator<Resource> taggedResources = tagManager.find(tagId);%>
<ul>
    <%
    while(taggedResources.hasNext()){
	Resource taggedResource = (Resource)taggedResources.next();%>

    <li>
        <%=taggedResource.getValueMap().get("jcr:title")%> 
    </li>
    <%}%>
    </ul>
<%}%>


