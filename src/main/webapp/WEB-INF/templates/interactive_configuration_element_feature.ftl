<#include "config/splot_config.ftl" />

<#function leftHTMLSpaces count>
  <#local singleSpace = "&nbsp;&nbsp;&nbsp;">
  <#local spaces = "">
  <#list 1..count as i>
     <#local spaces = spaces + singleSpace>
  </#list>
  <#return spaces>
</#function>

<#function formatFeatureName featureName>
	<#if (featureName?length > 35)>
		<#return featureName?substring(0,32)?html + "...">
	<#else>
		<#return featureName?html> 
	</#if>
</#function>

<#if feature_type != "group" && feature_decision == "-1"><img title="Feature yet to be decided" src="/${contextName}/images/unknown.gif"><#else><img src="/${contextName}/images/known.gif"></#if>${leftHTMLSpaces(feature_level+1)}
<#compress>
<img onClick="javascript:expandcollapse('${feature_id}')" id="${feature_id}_icon" src="images/minus.jpg">
<#if feature_type != "group">
  <#if feature_decision == "-1">
		<img id="${feature_id}_checkmark" style="cursor:pointer;" onClick="javascript:updateConfigurationElements('conf','decision','${feature_id}:1')" onmouseover="javascript:highlightSelectionButton(this,'boxedcheckmark.gif')" onmouseout="javascript:highlightSelectionButton(this,'checkmark.gif')" title="click to select feature" src="images/checkmark.gif">
		<img id="${feature_id}_crossmark" style="cursor:pointer;" onClick="javascript:updateConfigurationElements('conf','decision','${feature_id}:0')" onmouseover="javascript:highlightSelectionButton(this,'boxedcrossmark.gif')" onmouseout="javascript:highlightSelectionButton(this,'crossmark.gif')" title="click to deselect feature" src="images/crossmark.gif">
  <#else>
    <img title="${feature_decisionType} decision at step ${feature_decisionStep}" src="/${contextName}/images/${feature_decisionType}.gif">
	<#if feature_decisionStep != "1">
	    <#if feature_decision == "0">
			<img style="cursor:pointer;" onMouseOver="this.src='/${contextName}/images/toggle_greenh.gif'" onMouseOut="this.src='/${contextName}/images/toggle_green.gif'" onclick="javascript:detectToggleConflicts('${feature_id}')" title="Toggle decision to SELECTED (click to see conflicts)" src="/${contextName}/images/toggle_green.gif">
		<#elseif feature_decision == "1">
			<img style="cursor:pointer;" onMouseOver="this.src='/${contextName}/images/toggle_redh.gif'" onMouseOut="this.src='/${contextName}/images/toggle_red.gif'" onclick="javascript:detectToggleConflicts('${feature_id}')" title="Toggle decision to DESELECTED (click to see conflicts)" src="/${contextName}/images/toggle_red.gif">
		</#if>
	</#if>
  </#if>
</#if>
<img id="${feature_id}_type" src="/${contextName}/images/${feature_type}.gif" alt="${feature_type}">
<#if feature_type != "group">
	<#if feature_decision == "-1">
 		<span title="${feature_name}" class="normalFeature" id="${feature_id}_name" onmouseover="this.className='highlightFeature'" onmouseout="this.className='normalFeature'">${formatFeatureName(feature_name)}</span>
  	<#elseif feature_decision = "0">
 		<span title="${feature_name}" class="deselectedFeature" id="${feature_id}_name">${formatFeatureName(feature_name)}</span>
  	<#else>
 		<span title="${feature_name}" class="selectedFeature" id="${feature_id}_name">${formatFeatureName(feature_name)}</span>
  	</#if>
<#else>
 	<span title="${feature_name}" id="${feature_id}_name">${formatFeatureName(feature_name)}</span>
</#if>
</#compress>
