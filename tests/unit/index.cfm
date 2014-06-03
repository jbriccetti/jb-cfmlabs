<cfparam name="url.output" default="extjs">

<cfsetting enablecfoutputonly="true">

<cfinvoke component="mxunit.runner.DirectoryTestSuite"   
method="run"  
directory="#getDirectoryFromPath(getCurrentTemplatePath())#"  
componentpath="#request.vars.mapping#.tests.unit"                                                              
recurse="true"   
returnvariable="results" />  

<cfif url.output eq "xml">
  <cfcontent reset="true" type="text/xml" />
<cfelse>
  <cfcontent reset="true" type="text/html" />
	<cfoutput><a href="../../index.cfm">&laquo;&laquo; Home</a></cfoutput>
</cfif>
<cfoutput>#results.getResultsOutput(url.output)#</cfoutput>  