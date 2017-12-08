<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>

<% String text = (String)properties.get("text");
if(text!=null){
    %>
<%=text%>
<%}else{%>
custom Text
<%}%>