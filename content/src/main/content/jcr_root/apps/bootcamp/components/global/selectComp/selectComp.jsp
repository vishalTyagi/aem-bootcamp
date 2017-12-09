<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<% String text = (String)properties.get("city");
String url = (String)properties.get("paths");
if(text!=null){%>
Selected City :- 
<%=text%><br>

<%}else{%>
Select something <br>
<%}%>
Selected Paths:- 
<%=url%><br>
Selected Urls:- 
<ul>
<%String[] paths = (String[])properties.get("pathUrls");
for(String p:paths){%>
    <li>
<%=p%> ;;;;
    </li>
<%}%>
</ul>