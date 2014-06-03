<cfcomponent extends="cfmlabs.Application">


	<cffunction name="onRequestStart" returntype="boolean">
	  <cfargument name="thePage" type="string" required="true">
	  <cfscript>
			super.onREquestStart(thePage);
			this.vars.AirbrakeNotifier = createobject("component", "cfmlabs.lib.cfcs.util.coldfusion-airbrake-notifier.AirbrakeNotifier").init('faf08b4b248ed411103caaba0842c134');
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
    <cfscript>
	    this.vars.AirbrakeNotifier.send(arguments.exception);
    </cfscript>
		<cfcontent reset="yes" />
		there was an error but no need to worry, <a href="https://labs.airbrake.io/">we're on it</a> ...
    <cfreturn />
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