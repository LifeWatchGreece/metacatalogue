<%-- 
    Document   : occurences
    Created on : 18 Μαϊ 2015, 10:26:07 πμ
    Author     : Alexandros
--%>

<%@page import="eu.lifewatch.core.model.Pair"%>
<%@page import="eu.lifewatch.core.model.MicroCTScanningStruct"%>
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
            <div style="float:left; font-size: 30px; margin-left: 30px; margin-top: 4px">
                Advanced Search - MicroCT Scanning Results
            </div>
                <a href="${baseUrl}/searching/full_search_pane.jsp">
                    <img src="${baseUrl}/images/comment.png" class="my-speed-button" title="Produce Text">
                </a> 
                <a href="${baseUrl}/searching/sparql_search_pane.jsp">
                    <img src="${baseUrl}/images/sparql.png" class="my-speed-button" title="SPARQL Endpoint">
                </a> 
                <a href="${baseUrl}/searching/browse_search_pane.jsp">
                    <img src="${baseUrl}/images/browse.png" class="my-speed-button" title="Browse Contents">
                </a> 
                <a href="${baseUrl}/searching/advanced_search_pane.jsp">
                    <img src="${baseUrl}/images/refine.png" class="my-speed-button-selected" title="Advanced Search">
                </a>    
                <a href="${baseUrl}/">
                    <img src="${baseUrl}/images/search.png" class="my-speed-button" title="Basic Search">
                </a>
            <div style="clear: both"></div>
        </div>      
        <!-- Metacatalogue Top Bar : END -->
        
        <div class="results_wrapper">
            <h3>MicroCT Scanning Information Found</h3>
            <table class="footable table table-bordered" >
                <thead>
                    <th>Row</th>
                    <th>Scan ID</th>
                    <th>Specimen ID</th>
                    <th>Specimen Name</th>
                    <th data-toggle="true"></th>
                    <th data-hide="all">Enhancement Contrast Method</th>
                    <th data-hide="all">Filter</th>                                 
                    <th data-hide="all">Protocol</th>
                    <th data-hide="all">Preparation Date/Time</th>
                    <th data-hide="all">Preparation Notes</th>
                    <th data-hide="all">Scope of Scan</th>
                    <th data-hide="all">Sample holder</th>
                    <th data-hide="all">Scanning medium</th>
                    <th data-hide="all">Scanned part</th>
                    <th data-hide="all">Scanned by</th>
                    <th data-hide="all">Scan date</th>
                    <th data-hide="all">Scan duration</th>
                    <th data-hide="all">Instrument</th>
                    <th data-hide="all">Voltage (kV)</th>
                    <th data-hide="all">Current (uA)</th>
                    <th data-hide="all">Zoom (um)</th>
                    <th data-hide="all">Camera resolution</th>
                    <th data-hide="all">Averaging</th>
                    <th data-hide="all">Random movement</th>
                    <th data-hide="all">Scan (360 or 180)</th>
                    <th data-hide="all">Exposure time (ms)</th>
                    <th data-hide="all">Oversize settings</th>
<!--                    <th data-hide="all">File location</th>-->
                    <th data-hide="all">Collection code</th>
                    <th data-hide="all">Specimen provider</th>
                    <th data-hide="all">Specimen provider institute</th>
                    <th data-hide="all">Specimen description</th>
                    <th data-hide="all">Material</th>
                    <th data-hide="all">Scientific name</th>
                    <th data-hide="all">Taxonomic group</th>
                    <th data-hide="all">Specimen size (mm)</th>
                    <th data-hide="all">Fixation type</th>
                    <th data-hide="all">Storage place</th>
                </thead>
                <tbody>
                    <c:forEach items="${results}" var="item" varStatus="status">
                        <tr>
                            <td><strong>${(page-1)*rpp + status.count}</strong></td>
                            <td>${item.getScanningLabel()}&nbsp;<a href="${baseUrl}/search/browse?uri=${item.getScanningURI()}"><img src="../../images/list_view.png" title="Show with triple-browser"></img></a></td>
                            <td>${item.getSpecimen().getSpecimenID()}</td>
                            <td>${item.getSpecimen().getSpecimenName()}</td>
                            <td><span class="footable-toggle"></span> More info</td>
                            <td>${item.getContrastMethod()}</td>
                            <td>${item.getFilter()}</td>
                            <td>${item.getProtocol()}</td>
                            <td>${item.getPreparationDateTime()}</td>
                            <td>${item.getDescription()}</td>
                            <td>${item.getScopeOfScan()}</td>
                            <td>${item.getSampleHolder()}</td>
                            <td>${item.getScanningMedium()}</td>
                            <td>${item.getScannedPart()}</td>
                            <td>${item.getActorName()}</td>
                            <td>${item.getScanDate()}</td>
                            <td>${item.getScanningDuration()}</td>
                            <td>${item.getDeviceName()}</td>
                            <td>${item.getVoltage()}</td>
                            <td>${item.getCurrent()}</td>
                            <td>${item.getZoom()}</td>
                            <td>${item.getCameraResolution()}</td>
                            <td>${item.getAveraging()}</td>
                            <td>${item.getRandomMovement()}</td>
                            <td>${item.getScanDegrees()}</td>
                            <td>${item.getExposureTime()}</td>
                            <td>${item.getOversizeSettings()}</td>
                            <!--<td>${item.getFileLocation()}</td>-->
                            <td>${item.getSpecimen().getCollectionName()}</td>
                            <td>${item.getSpecimen().getProviderName()}</td>
                            <td>${item.getSpecimen().getInstitutionName()}</td>
                            <td>${item.getSpecimen().getDescription()}</td>
                            <td>${item.getSpecimen().getMaterial()}</td>
                            <td>${item.getSpecimen().getSpeciesName()}</td>
                            <td>${item.getSpecimen().getTaxonomicGroup()}</td>
                            <td>${item.getSpecimen().getDimensionValue()}</td>
                            <td>${item.getSpecimen().getFixationType()}</td>
                            <td>${item.getSpecimen().getStoragePlace()}</td>
                        <tr/>
                    </c:forEach>
                </tbody>
            </table>
            
            <c:if test = "${lastPage != 1}">                                        
                <nav>
                    <ul class="pagination">
                        <li <c:if test = "${!leftArrow}">class='disabled'</c:if> >
                            <a href="${baseUrl}/search/advanced/microct_scanning?species=${species}&specimen=${specimen}&device=${device}&contrast=${contrast}&page=${page-1}" aria-label="Previous">
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
                                        <li><a href="${baseUrl}/search/advanced/microct_scanning?species=${species}&specimen=${specimen}&device=${device}&contrast=${contrast}&page=${loop.index}">${loop.index}</a></li>
                                    </c:if>                                                                      
                                </c:otherwise>
                            </c:choose>                        
                        </c:forEach>
                        <c:if test = "${rightArrow}">
                            <li>
                                <a href="${baseUrl}/search/advanced/microct_scanning?species=${species}&specimen=${specimen}&device=${device}&contrast=${contrast}&page=${page+1}" aria-label="Next">
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
