<cfscript>
	this.vars["appPath"] = "anywhere/in/your/webroot/";
	this.vars["baseURL"] = "http://#cgi.http_host#/#this.vars.appPath#";		
	this.vars["debug"] = true;
	this.vars["isproduction"] = false;
</cfscript>