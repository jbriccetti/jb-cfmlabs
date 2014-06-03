<cfcomponent extends="BaseService" accessors="true">
	<cfproperty name="dataDir" type="string" />
	<cfproperty name="sep" type="string" />

	<cffunction name="init" returntype="any" output="false" hint="pseudo-constructor">
		<cfscript>
    	super.init();
      if(isDefined("request.vars.baseFilePath")){
				setDataDir(request.vars.baseFilePath);
			}
      if(isDefined("request.vars.sep")){
				setSep(request.vars.sep);
			}else{
				setSep(createObject("java", "java.lang.System").getProperty("file.separator"));
			}
    </cfscript>
    <cfreturn this />
	</cffunction>

	<cffunction name="getdata" output="false" access="public" returntype="any" hint="HINT">
		<cfargument name="element" type="string" required="yes" />
		<cfargument name="extension" type="string" required="no" default="xls" />
		<cfscript>
			local["result"] =initResult();
			local.data = false;
			local.file = "#listAppend(getDataDir(),element,getSep())#.#arguments.extension#";
    </cfscript>
		<cfif fileExists(local.file)>
	    <cfspreadsheet action="read" src="#local.file#" query="local.data" headerrow="1" rows="2-9999" />     
    <cfelse>
    	<cfset setfailure(local.result,"#local.file# doesnt exist") />
		</cfif>
    <cfif isQuery(local.data)>
			<cfset setSuccess(local.result,local.data) />
		<cfelse>
    	<cfset setfailure(local.result,"couldn't read #local.file#") />
		</cfif>
		<cfreturn local.result />
	</cffunction>

<cffunction name="queryToDropDownArray" access="private" returntype="array" output="false">
  <cfargument name="q" type="query" required="true">
  <cfargument name="value" type="string" required="true">
  <cfargument name="display" type="string" required="false">
		<cfset var local = {}>
		<cfif not structkeyexists(arguments, 'display')>
			<cfset arguments.display = arguments.value>
		</cfif>
		<cfset local.ret = [] />
		<cfloop query="q">
		<cfset local.ret[currentrow] = { value=q[value][currentrow],display=q[display][currentrow] } />
		</cfloop>
  <cfreturn local.ret>
</cffunction>
<cffunction name="queryToHTMLOptions" output="false" access="public" returntype="string" hint="i return html options for a query">
  <cfargument name="q" type="query" required="true">
  <cfargument name="value" type="string" required="true">
  <cfargument name="display" type="string" required="false">
		<cfscript>
				local["result"]="";
				if(NOT structkeyexists(arguments, 'display')) arguments.display = arguments.value;
			</cfscript>
			<cfsavecontent variable="local.result">
				<cfoutput query="q">
					<option value="#htmleditformat(q[value][currentrow])#">#htmleditformat(q[display][currentrow])#</option>
				</cfoutput>
			</cfsavecontent>
  <cfreturn trim(local.result) />
</cffunction>


	
</cfcomponent>