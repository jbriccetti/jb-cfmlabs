<cfscript>
	this.vars["appPath"] = "briccetti/cfmlabs/";
	this.vars["baseURL"] = "http://#cgi.http_host#/#this.vars.appPath#";		
	this.vars["debug"] = false;
	this.vars["isproduction"] = true;
</cfscript>