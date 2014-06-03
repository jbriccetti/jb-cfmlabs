<cfcomponent>

<!--- 
		//troyweb1 Framework for ColdFusion
    Copyright (C) 2012 Troy Web Consulting, LLC

		This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

 --->

  <cffunction name="$globals" output="false" access="private" returntype="void" hint="i setup some core global variables">
		<cfscript>
			this.vars["appPath"] = ""; //
			this.vars["baseURL"] = "http://#cgi.HTTP_HOST#/#this.vars.appPath#";	
			if(isNull(this.vars.framework)) this.vars.framework = {"mapping"="framework"};
			this.vars.framework["lib"] = "#listChangeDelims(this.vars.framework.mapping,".","/")#.lib";
			this.vars.framework["credits"]="//troyweb";
			if(isNull(this.vars.mapping)) this.vars.mapping = "";
			this.vars["lib"] = "#listChangeDelims(this.vars.mapping,".","/")#.lib.cfcs";
			this.vars["CRLF"] = chr(13)&chr(10);
			this.vars["debug"] = {"enabled"=false,"queue"=[],"showcache"=false};
			this.vars["isproduction"] = true;
    </cfscript>
		<cftry>
    	<cfinclude template="/#this.vars.mapping#/lib/includes/globals.cfm" />
    	<cfcatch><!--- watch out if i fail, you'll never know it use this to find out more: <cfdump var="#cfcatch#" abort /> ---></cfcatch>
    </cftry>

		<cfreturn />
  </cffunction>

  <cffunction name="$env" output="false" access="private" returntype="void" hint="i setup the applications' this.vars">
		<cftry>
			<!--- look for environment specific variables based on server name. these will overwrite the defaults if need be --->
    	<cfinclude template="/#this.vars.mapping#/lib/includes/env/#lcase(cgi.server_name)#.cfm" />
    	<cfcatch><!--- watch out if i fail, you'll never know it use this to find out more: <cfdump var="#cfcatch#" abort /> ---></cfcatch>
    </cftry>
		<cfscript>
			if(LEN(TRIM(this.vars.appPath)))
				//this.vars.baseFilePath = "#this.vars.baseFilePath##listChangeDelims(this.vars.appPath,this.vars.sep,'/')#";
			if(RIGHT(this.vars.baseFilePath,1) EQ this.vars.sep)
				this.vars.baseFilePath = LEFT(this.vars.baseFilePath,LEN(this.vars.baseFilePath)-1);

			this.vars["init_ts"]=now();
    </cfscript>	
		<cfreturn />
	</cffunction>



		<cffunction name="onApplicationStart" returntype="boolean" output="false" hint="This event fires when the application times out or restarts automatically, including on server startup.">
      <cflock scope="application" type="exclusive" timeout="10">
      	<cfset application["cache"]={"created"=now()} />
      </cflock>
			<cfreturn true />
		</cffunction>

		<cffunction name="onApplicationEnd" returntype="void" output="false">
			<cfargument name="appScope" />
			<cflog file="#this.name#" type="information" text="SHUTDOWN #this.name#">
			<cfreturn />
		</cffunction>
	
		<cffunction name="onSessionStart" returntype="void" output="false">
      <cfreturn />
		</cffunction>
		
		<cffunction name="onSessionEnd" returntype="void" output="false">
			<cfargument name="sessionScope" />
			<cfargument name="appScope" />
			<cfreturn />
    </cffunction>

		<cffunction name="onRequestStart" returntype="boolean" output="true" hint="This event fires at the begining of each request.">
			<cfargument name="thePage" type="string" required="true">
			<cfscript>
				request.app = this;
				request.vars=this.vars;
				request.params = $firewall();
				if($manageCache(request.params)){
					// cache reloaded. do what ya gotta
				}
      </cfscript>
      <cfreturn true />
		</cffunction>

	
  <cffunction name="$isAjaxRequest" output="false" returntype="boolean" access="public">
    <cfset var headers = getHttpRequestData().headers />
    <cfreturn structKeyExists(headers, "X-Requested-With") and 
      (headers["X-Requested-With"] eq "XMLHttpRequest") />
  </cffunction>


	<cffunction name="$firewall" output="false" access="public" returntype="struct" hint="input cleansing firewall">
		<cfscript>
			var local["result"] ={};
			structDelete(form,"fieldnames",false);
			for (local.key in cookie){
				cookie[local.key] = $inputFilter(cookie[local.key]);
			}
			for (local.key in url) {
				url[local.key] = $inputFilter(url[local.key]);
			}
			for (local.key in form){
				form[local.key] = $inputFilter(form[local.key]);
			}
			local.result.cgi ={};
			for(local.key in cgi){
				local.result.cgi[local.key] = $inputFilter(cgi[local.key]);
			}
			structAppend(local.result,cookie);
			structAppend(local.result,url);
			structAppend(local.result,form);
    </cfscript>
		<cfreturn local.result />
	</cffunction>

  <cffunction name="$inputFilter" access="private" returntype="string" output="no" hint="Extends XMLFormat to include stripping non-printable characters">
    <cfargument name="str" type="string" required="yes" hint="the string to make safe" />
    <cfreturn replace(XMLFormat(REReplace(str, "[^[:print:]]", "", "ALL")),"&apos;","&##39;","ALL") />
  </cffunction>

	<cffunction name="$manageCache" access="public" output="false" returntype="boolean" hint="checks request for refresh indicators and routes applicatioon calls accordingly.">
		<cfargument name="params" required="no" type="struct" default="#request.params#" hint="request params" />

		<cfparam name="params.refresh" default="false" />
		<cfscript>
			local["result"] = false;
			switch(params.refresh){
				case "all":
					onApplicationStart();
					onSessionStart();
					local.result = true;
					break;
				case "application":
					onApplicationStart();
					local.result = true;
					break;
				case "session":
					onSessionStart();
					break;
				default:
					break;
			}
			</cfscript>
		<cfreturn local.result />
	</cffunction>

  <cffunction name="$factory" output="true" access="public" returntype="any" hint="i return components you ask me for... if i can find it. someday when i grow up i'll get smart about caching things too" >
    <cfargument name="what" type="string" required="yes" hint="the thing you want me to create" />
		<cfargument name="vars" required="no" type="struct" default="#this.vars#" hint="app global vars" />
		<cfargument name="initargs" required="no" type="struct" default="#{}#" hint="arguments collection for a constructor" />
		<cfscript>
			what = trim(what);
      if(NOT len(what) GT 2){
        return;
      }
      local.cmd = LEFT(what,1);
      local.target = removeChars(what,1,1);
			arguments.initargs["globals"] = vars;
    </cfscript>
    
    <cfswitch expression="#cmd#">
	    <cfcase value="!">
				<!--- looking for an instance of a generic plugin type object --->
        <cftry>
					<!--- try to find the component in the app lib folder --->
          <cfset local.result = createObject("component","#vars.lib#.#target#").init(argumentcollection=initargs) />
          <cfcatch>
						<cfset $debug(cfcatch) />
            <cftry>
            <!--- try to find the component in the framework lib folder --->
              <cfset local.result = createObject("component","#vars.framework.lib#.#target#").init(argumentcollection=initargs) /> 
              <cfcatch>
         				<cftry>
									<cfset $debug(local.errqueue) />
									<cfcatch></cfcatch>
								</cftry>
          			<cfrethrow>
        			</cfcatch>
            </cftry>
          </cfcatch>
        </cftry>
    </cfcase>
    <cfcase value="@">
			<!--- looking for an instance of a database gateway --->
      <cftry>
        <!--- if we cant find it in the applications directory structure, look for it in the firecracker built in area --->
        <cfset local.result = createObject("component","#vars.lib#.model.gateway.#target#Gateway").init(vars) />
        <cfcatch>
          <cfset $debug(cfcatch) />
			    <cfrethrow>
        </cfcatch>
      </cftry>
    </cfcase>
    </cfswitch>

    <cfif structKeyExists(local,"result")>
      <cfreturn local.result />
      <cfelse>
      <cfreturn />
    </cfif>
  </cffunction>


	<cffunction name="$initCache" output="false" access="public" returntype="void" hint="i initialize a cache structure for the passed scope. i take care of locking so you dont have to">
		<cfargument name="scope" type="string" required="yes" hint="request,session or application" />
		<cfargument name="key" type="string" required="no" default="cache" hint="the key in the cache scope to setup" />
		<cfif listFindNoCase("request,session,application",scope)>
			<cflock scope="#scope#" timeout="10" type="exclusive">
      	<cfset "#scope#.#key#" = {created=now()} />
      </cflock>
		</cfif>
		<cfreturn />
	</cffunction>

</cfcomponent>