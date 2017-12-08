
<%@page session="false" %>
<html>
    <%@include file="/libs/foundation/global.jsp"%>
    <cq:include script="/libs/wcm/core/components/init/init.jsp"/>
   <cq:include script="head.jsp"/>
   <body>
       <div class="page-content">
			<div class="container">    
				<cq:include script="header.jsp"/>
                <cq:include script="bodycontent.jsp"/>
                <cq:include path="par" resourceType="foundation/components/parsys" />
                <hr>
                <cq:include path="general" resourceType="foundation/components/iparsys"/>
                <cq:include script="footer.jsp"/>
			</div>    
		</div>    
   </body>
</html> 