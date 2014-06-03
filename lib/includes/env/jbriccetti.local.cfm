<cfscript>
	this.vars["appPath"] = "cfmlabs/";
	this.vars["baseURL"] = "http://#cgi.http_host#/#this.vars.appPath#";		
	this.vars["debug"] = true;
	this.vars["isproduction"] = false;
</cfscript>
