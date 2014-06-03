<cfparam name="url.err" default="" />

<cfswitch expression="#err#">
  <cfcase value="1">
  <cfthrow detail="test error" errorcode="1" extendedinfo="extended info would go here" message="error message" type="Application" />
  </cfcase>
  <cfcase value="2">
  <cfquery name="q">
	  SELECT * from artistss
  </cfquery>
  <cfdump var="#q#" label="" />
  </cfcase>

	<cfcase value="3">
  	<cfoutput>#idontexist#</cfoutput>
  </cfcase>
	<cfcase value="4">
		<cfset t = createObject("component","idontexist.cfc").init() />
  </cfcase>
	<cfcase value="5">
		<cfinclude template="../airbrake/idontexist.cfm" />
  </cfcase>
  <cfdefaultcase>
  nothing to see here, move along
  </cfdefaultcase>
</cfswitch>
