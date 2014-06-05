<cfcomponent extends="cfmlabs.Application">
	<cffunction name="onRequestStart" returntype="boolean">
	  <cfargument name="thePage" type="string" required="true">
	  <cfscript>
			super.onREquestStart(thePage);
			request.CFlickr = {
				service = createobject("component", "cfmlabs.lib.cfcs.api.CFlickr").init(),
				token = "get this by authenticating",
				userid = "get this by authenticating"
			};
    </cfscript>
		<cfreturn true>
	</cffunction>

</cfcomponent>