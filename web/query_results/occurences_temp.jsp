<%-- 
    Document   : occurences
    Created on : 18 Μαϊ 2015, 10:26:07 πμ
    Author     : Alexandros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Services - Search results</title>
        <jsp:include page="/template/head.jsp"><jsp:param name="baseUrl" value="${baseUrl}" /></jsp:include>      
        <script type="text/javascript" src="${baseUrl}/js/footable.js"></script>
        <link rel="stylesheet" href="${baseUrl}/css/footable.core.css" />
        <link rel="stylesheet" href="${baseUrl}/css/custom.css" />
    </head>
    <body>
        
        <jsp:include page="/template/body_top.jsp"><jsp:param name="baseUrl" value="${baseUrl}" /></jsp:include>
        
        <!-- Metacatalogue Top Bar : START -->
        <div style="border: 1px solid gray; border-radius: 4px; padding:6px 0px 6px 10px; margin: 0 20px 20px 20px; background-color: #E6F3F7">
            <div style="float: left">
                <img src="${baseUrl}/images/data_services.png" style="width: 50px">
            </div>
            <div style="float:left; font-size: 30px; margin-left: 30px; margin-top: 4px">
                Dataset Catalogue Service
            </div>
            <c:if test = "${canManage.equals('yes')}">
    
                <img src="${baseUrl}/images/search.png" class="my-speed-button-selected">
                <a href="${baseUrl}/publish">
                    <img src="${baseUrl}/images/edit.png" class="my-speed-button">
                </a>
            </c:if>            
            <div style="clear: both"></div>
        </div>     
        <!-- Metacatalogue Top Bar : END -->
        
        <div class="results_wrapper">
            <h3>Temp Stats Information Found</h3>
            <table class="footable table table-bordered" >
                <thead>
                    <th>Row</th>
                    <th>Species</th>
                    <th>Country</th>
                    <th>Date</th>                
                    <th>Related Dataset</th>
                    <th data-toggle="true"></th>
                    <th data-hide="all">Dataset Title</th>
                    <th data-hide="all">Temporary Aggregate</th>
                    <th data-hide="all">Number of Parts</th>
                    <th data-hide="all">Occurrence Event ID</th>
                    <th data-hide="all">Individual ID</th>                
                    <th data-hide="all">Actor Name</th>
                    <th data-hide="all">Place Name</th>                          
                    <th data-hide="all">Water Area Name</th>                             
                    <th data-hide="all">Habitat</th>                                                                
                    <th data-hide="all">Ecosystem</th>  
                    <th data-hide="all">Equipment Type</th>              
                    <th data-hide="all">Description</th>                  
                    <th data-hide="all">Station URI</th>  
                    <th data-hide="all">Station Notes</th>  
                    <th data-hide="all">Bibliographic Citiation</th>  
                    <th data-hide="all">Sampling Protocol</th>  
                    <th data-hide="all">Coordinates</th>  
                </thead>
                <tbody>
                    <c:forEach items="${results}" var="item" varStatus="status">
                        <tr>
                            <td><strong>${(page-1)*rpp + status.count}</strong></td>
                            <td style="text-align: left"><a href="${baseUrl}/search/browse?uri=${item.getSpeciesURI()}">${item.getSpeciesName()}</a></td>
                            <td style="text-align: left"><a href="${baseUrl}/search/browse?uri=${item.getCountryURI()}">${item.getCountryName()}</a></td>
                            <td style="text-align: left">${item.getTimeSpan()}</td>                        
                            <td><a href="${baseUrl}/search/directory?datasetName=&owner=&datasetURI=${item.getDatasetURI()}">View dataset</a></td>
                            <td><span class="footable-toggle"></span> More info</td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getDatasetURI()}">${item.getDatasetTitle()}</a></td>
                     
                            <td><a href="${baseUrl}/search/browse?uri=${item.getTemporaryAggregateURI()}">${item.getTemporaryAggregate()}</a></td>
                            <td>${item.getNumberOfParts()}</td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getOccurrenceEventURI()}">${item.getOccurrenceEvent()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getPhysicalObjectURI()}">${item.getPhysicalObject()}</a></td>                        
                            <td><a href="${baseUrl}/search/browse?uri=${item.getActors().get(0).getKey().toString()}">${item.getActors().get(0).getValue().toString()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getLocalityURI()}">${item.getLocalityName()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getWaterAreaURI()}">${item.getWaterAreaName()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getHabitatURI()}">${item.getHabitatName()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getEcosystemURI()}">${item.getEcosystemName()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getEquipmentTypeURI()}">${item.getEquipmentTypeName()}</a></td>
                            <td>${item.getDescription()}</td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getStationURI()}">${item.getStationURI()}</a></td>
                            <td>${item.getStationNotes()}</td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getBibliographicCitationURI()}">${item.getBibliographicCitation()}</a></td>
                            <td><a href="${baseUrl}/search/browse?uri=${item.getSamplingProtocolURI()}">${item.getSamplingProtocolName()}</a></td>
                            <td>${item.getCoordinates()}</td>
                        <tr/>
                    </c:forEach>
                </tbody>
            </table>
            
            <c:if test = "${lastPage != 1}">                                        
                <nav>
                    <ul class="pagination">
                        <li <c:if test = "${!leftArrow}">class='disabled'</c:if> >
                            <a href="${baseUrl}/search/advanced/temp_stats?sciName=${sciName}&location=${location}&year=${year}&number=${number}&page=${page-1}" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">                    
                            <c:choose>
                                <c:when test="${loop.index == page}">
                                    <li class='active'><a href="#">${loop.index}</a></li>
                                </c:when>    
                                <c:otherwise>     
                                    <c:if test = "${loop.index <= lastPage}">
                                        <li><a href="${baseUrl}/search/advanced/temp_stats?sciName=${sciName}&location=${location}&year=${year}&number=${number}&page=${loop.index}">${loop.index}</a></li>
                                    </c:if>                                                                      
                                </c:otherwise>
                            </c:choose>                        
                        </c:forEach>
                        <c:if test = "${rightArrow}">
                            <li>
                                <a href="${baseUrl}/search/advanced/temp_stats?sciName=${sciName}&location=${location}&year=${year}&number=${number}&page=${page+1}" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>            
            </c:if>
            
        </div>
        
        <script type="text/javascript">
            $(function () {
                $('.footable').footable();
            });
        </script>
        <jsp:include page="/template/body_bottom.jsp"><jsp:param name="baseUrl" value="${baseUrl}" /></jsp:include>
    </body>
</html>
