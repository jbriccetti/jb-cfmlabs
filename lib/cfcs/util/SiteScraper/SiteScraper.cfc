<cfcomponent accessors="true">
	<cfproperty name="baseURL" type="string" />
	<cfproperty name="cacheDir" type="string" />

	<cffunction name="init" returntype="any">
		<cfargument name="baseURL" required="yes" type="string" hint="the baseURL of the site you want to spider" />
		<cfargument name="cacheDir" required="no" type="string" default="#getDirectoryFromPath(getCurrentTemplatePath())#" hint="the directory for the cache folder for scraping" />
		<cfscript>
			variables.sep = createObject("java", "java.lang.System").getProperty("file.separator");
			setBaseURL(baseURL);
			local.cachedir = listToArray(cacheDir,sep);
			arrayAppend(local.cacheDir,"cache");
			arrayAppend(local.cacheDir,hash(baseURL));
			setCacheDir(arrayToList(local.cacheDir,sep));
			if(NOT DirectoryExists(getCacheDir())) directoryCreate(getCacheDir());
		</cfscript>
		<cfhttp url="#getBaseURL()#" method="get" />
		<cffile file="#getCacheDir()##sep#index.html" action="write" output="#cfhttp.FileContent#" />
		<cfreturn this />
	</cffunction>

</cfcomponent>