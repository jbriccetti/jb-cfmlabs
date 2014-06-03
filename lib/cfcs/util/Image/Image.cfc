<cfcomponent accessors="true">
	<cfproperty name="cacheDir" type="string" />
	<cfproperty name="imageDir" type="string" />
	<cfproperty name="sep" type="string" />

	<cffunction name="init" returntype="any">
		<cfargument name="cacheDir" required="no" type="string" default="#getDirectoryFromPath(getCurrentTemplatePath())#" hint="the directory for the cache folder" />
		<cfargument name="imageDir" required="no" type="string" default="#getDirectoryFromPath(getCurrentTemplatePath())#" hint="the directory for the images folder" />
		<cfscript>
			setSep(createObject("java", "java.lang.System").getProperty("file.separator"));
			local.cachedir = listToArray(cacheDir,getSep());
			arrayAppend(local.cacheDir,"cache");
			setCacheDir(arrayToList(local.cacheDir,getSep()));
			if(NOT DirectoryExists(getCacheDir())) directoryCreate(getCacheDir());

			local.imageDir = listToArray(imageDir,getSep());
			arrayAppend(local.imageDir,"images");
			setImageDir(arrayToList(local.imageDir,getSep()));
			if(NOT DirectoryExists(getImageDir())) directoryCreate(getImageDir());
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	  <cffunction name="display" output="true" access="public" returntype="any" hint="HINT">
		<cfscript>
			local["result"]=false;
		</cfscript>
		<cfdump var="#getcacheDir()#" />
		<cfdump var="#getimageDir()#" />

		<cfreturn local.result />
	</cffunction>


</cfcomponent>