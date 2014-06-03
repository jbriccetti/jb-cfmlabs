<cfcomponent accessors="true">
	<cfproperty name="failStatus" type="string" default="FAILURE">
	<cfproperty name="successStatus" type="string" default="SUCCESS">

	<cffunction name="init" returntype="any">
		<cfscript>
				setFailStatus("FAILURE");
				setSuccessStatus("SUCCESS");
			</cfscript>
		<cfreturn this/>
	</cffunction>
	
<cffunction name="initResult" access="private" returntype="struct" output="false">
  <cfset var ret = {}>
  <cfset ret["body"] = "">
  <cfset ret["header"] = {}>
  <cfset ret["header"]["status"] = getFailStatus()>
  <cfreturn ret />
</cffunction>
<cffunction name="setSuccess" access="private" returntype="void" output="false">
  <cfargument name="result" type="struct" required="true">
  <cfargument name="body" type="any" required="true">
  <cfset setResult(result, body, getSuccessStatus())>
</cffunction>
<cffunction name="setFailure" access="private" returntype="void" output="false">
  <cfargument name="result" type="struct" required="true">
  <cfargument name="body" type="any" required="true">
  <cfset setResult(result, body, getFailStatus())>
</cffunction>
<cffunction name="setResult" access="private" returntype="void" output="false">
  <cfargument name="result" type="struct" required="true">
  <cfargument name="body" type="any" required="true">
  <cfargument name="status" type="string" required="true">
  <cfset result.header.status = arguments.status>
  <cfset result.body = arguments.body>
</cffunction>
<cffunction name="ping" access="remote" returntype="struct" output="false">
  <cfset var ret = initResult()>
  <cfset setSuccess( ret, "Ping successful" )>
  <cfreturn ret>
</cffunction>
</cfcomponent>
