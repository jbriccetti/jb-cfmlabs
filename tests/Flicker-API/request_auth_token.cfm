
<cfset auth_url = request.Cflickr.service.getAuthUrl("read") />

<cfif structKeyExists(url, "frob")>

	<cfset resp = request.Cflickr.service.auth_gettoken(frob=url.frob) />
	
	<cfif resp.success>

		<code><cfoutput>
		your auth token is: #resp.auth.token#<br>
		your user id is: #resp.auth.user.nsid#
		</cfoutput></code>
		<cfdump var="#resp#" label="auth_gettoken() response">
	
	<cfelse>

		oops! the following error occured
		<cfdump var="#resp#" label="Error response">
		
	</cfif>
	
<cfelse>

	<cfoutput>
	Click <a href="#auth_url#">this link</a> to be taken to flickr to authenticate.<br> 
	You should set the callback url to whatever url your running the page from, for example 
	http://#cgi.server_name#:#cgi.server_port##cgi.script_name#
	</cfoutput>
	
	
</cfif> 

