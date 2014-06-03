<cffunction name="displayDate" output="true" access="public" returntype="any" hint="HINT">
	<cfargument name="thedate" type="date" required="no" default="#now()#" hint="HINT" />
	<cfoutput>#dateformat(thedate,"yyyy-mm-dd")#</cfoutput>

	<cfreturn />
</cffunction>

<cffunction name="browseDirectory" output="yes" access="public" returntype="void" hint="i display a directory list of folders and files. i wont display files or folders that begin with '.' or '_' which are implicitly private">
	<cfargument name="dir" type="string" required="yes" hint="an absolute path to a directory" >
	<cfargument name="title" type="string" required="no" hint="what to display as a title. if blank no title displayed">
	<cfscript>
		var local = structnew();
		local.result = false;
	</cfscript>
		<cfif len(trim(title))><h3>#title#</h3></cfif>
		<cfdirectory action="list" name="local.list" directory="#dir#" />
		<ul style="unstyled" class="small-caps">
		<cfoutput query="local.list">
			<cfif type EQ "dir" AND NOT listFindNoCase(".,_",left(name,1))>
				<li><a href="#name#/">#name#</a></li>
			</cfif>
		</cfoutput>
		</ul>
	<cfreturn />
</cffunction>
