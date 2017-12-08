<html>
    <head>
        <title>Search</title>
        <%@include file="/libs/foundation/global.jsp"%>
        <%@ page import="java.util.*,javax.jcr.Session,com.day.cq.wcm.api.*,com.day.cq.search.*,com.day.cq.search.result.*,org.apache.sling.api.resource.Resource" %>
<cq:defineObjects/> 
    </head>
    <body>
    </body>
    <div>
        <div>
            <%String text = request.getParameter("text");
				if(text==null){
    				text = "";
				}
			%>
            <form action="/content/bootcamp/page/search.html">
                <input type="text" name="text" placeholder="search something" value="<%=text%>"/>
                <input type="hidden" name="offset" value="0"/>
                <input type="submit" value="Search"/>
            </form>
        </div>
        <div>
<%

    if(text!=null && text!=""){
    Map<String, String> map = new HashMap<String, String>();
    map.put("path", "/content/bootcamp");
    // map.put("type", "cq:Page");
    //  map.put("group.p.or", "true"); 
    //map.put("group.1_fulltext", text);
map.put("fulltext", text);
    map.put("p.offset", request.getParameter("offset"));
    map.put("p.limit", "2"); 
    Session session = resourceResolver.adaptTo(Session.class);
	QueryBuilder builder = sling.getService(QueryBuilder.class);
	Query query = builder.createQuery(PredicateGroup.create(map), session);
	SearchResult result = query.getResult();
    //Iterator<Node> nodes = 	result.getNodes();
	// paging metadata
   		 int hitsPerPage = result.getHits().size();
   		 long totalMatches = result.getTotalMatches();
    	long offset = result.getStartIndex();
    long numberOfPages = (hitsPerPage>0)?(totalMatches / hitsPerPage):0l;
     %>
totalMatchees <%=totalMatches%>
            hitsPerpage : <%=hitsPerPage%>
            <%
         Iterator<Resource> resources = result.getResources();%>

    <ul>
        <%
         while(resources.hasNext()){
			Resource resource1 = resources.next();
            %>
             <li>
                 <%=resource1.getName()%>:- <%=resource1.getPath()%>
            </li>
            <%
     }
    %>
            </ul>
            <%if((hitsPerPage>0) && (offset>0)){%>
				<a href="/content/bootcamp/page/search.html?text=<%=text%>&offset=<%=offset-2%>">pervious Page</a>

            <%}if((hitsPerPage>0) && ((offset+hitsPerPage)<totalMatches)){%>
            <a href="/content/bootcamp/page/search.html?text=<%=text%>&offset=<%=offset+hitsPerPage%>">next Page</a>

            <%
                               }

}


    %>

        </div>
    </div>
</html>
