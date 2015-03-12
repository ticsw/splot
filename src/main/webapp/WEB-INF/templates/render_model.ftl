<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<#include "config/splot_config.ftl" />

<html>
<head>
<title>Welcome to the Software Product Lines Online Tools Homepage</TITLE>

<link type="text/css" rel="stylesheet" href="css/${theme}/splot.css">

</head>
<body>

<div id="wrapper"> 
<div class="btm"> 
	<div id="page"> 
		<div id="content"> 
			<div class="post"> 
				<div class="entry"> 
					<table>
					<tr><td>
					<b>Feature Tree:</b>
					<#compress>
					<#list features as feature>
						<div style="position: relative; left: ${feature.shift}px;" id="${feature.id}"><img src="images/${feature.image}.gif">&nbsp;${feature.name}&nbsp;
							<#if feature.highlightType="dead">
							     <span class="${feature.highlightType}FeatureStyle"> (Dead)</span>
							<#elseif feature.highlightType="common">
							     <span class="${feature.highlightType}FeatureStyle"> (Common)</span>
							</#if>
						</div>
					</#list>
					</#compress>
					<span style="position:relative; top:10px;"><b>Extra Constraints:</b>
					<#list extraconstraints as constraint>
						<div style="position: relative; left: 10px;">-${constraint.name}: ${constraint.formula}</div>
					</#list>
					</span>
					</td></tr>
					</table>
				</div> 
			</div> 
		</div> 
		<!-- end #content --> 
		<div style="clear: both;">&nbsp;</div> 
	</div> 
	<!-- end #page --> 
</div> 
</div> 

</body>
</html>
