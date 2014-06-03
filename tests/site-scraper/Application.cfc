<cfcomponent extends="cfmlabs.Application">


	<cffunction name="onRequestStart" returntype="boolean">
	  <cfargument name="thePage" type="string" required="true">
	  <cfscript>
			super.onREquestStart(thePage);
			this.vars.SiteScraper = createobject("component", "cfmlabs.lib.cfcs.util.SiteScraper.SiteScraper").init(baseURL="http://www.google.com/");
    </cfscript>
		<cfreturn true>
	</cffunction>

  <!--- <cffunction name="onRequestEnd" returntype="void" output="true">
    <cfargument name="thePage" />
    <cfreturn super.onRequestEnd(thePage) />
  </cffunction> --->
	 
	
  <cffunction name="onError" returntype="void" output="true">
    <cfargument name="exception" />
    <cfargument name="eventname" />
		<cfdump var="#exception#" abort />
    <cfreturn super.onError(exception,eventname)/>
  </cffunction>
  
	<!--- <cffunction name="onMissingTemplate" returntype="boolean">
	  <cfargument name="targetPage" type="string" required="yes" />
	  <cfreturn super.onMissingTemplate(targetPage)/>
  </cffunction> --->
      
	<!--- <cffunction name="oncfcRequest" returnType="void"> 
    <cfargument type="string" name="cfcname"> 
    <cfargument type="string" name="method"> 
    <cfargument type="struct" name="args"> 
	</cffunction> --->

</cfcomponent>