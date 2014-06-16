<cfcomponent name="ServerTest" extends="mxunit.framework.TestCase">

<!--- Begin specific tests --->
	<cffunction name="testInit" access="public" returnType="void">
    <cfscript>
			var local = {};
			
			local.msg= "testing if component is an object";
			local.expected = "true";
			local.actual = isObject(variables.cfc);
			assertEquals( local.expected, local.actual, local.msg );
		</cfscript>
	</cffunction>
  
	<cffunction name="testPhotos_GetRecent" access="public" returnType="void">
    <cfscript>
			local.page = 1;
			local.per_page = 25; 
						
			local.expected = "true";
			local.resp = variables.cfc.photos_getRecent(per_page=local.per_page, page=local.page);
			debug(local.resp);
			local.test = isStruct(local.resp);
			local.msg= "test to see if we obtain a struct back";
			assertEquals( local.expected, local.test, local.msg );
			
			local.test = local.test && structKeyExists(local.resp,"photos");
			local.msg= "test to see if we obtain a photos element in the structure";
			assertEquals( local.expected, local.test, local.msg );

			local.test = local.test && structKeyExists(local.resp.photos,"page") && (local.resp.photos.page == local.page);
			local.msg= "test to see if we obtain the correct page";
			assertEquals( local.expected, local.test, local.msg );

			local.test = local.test && structKeyExists(local.resp.photos,"perpage") && (local.resp.photos.perpage == local.per_page);
			local.msg= "test to see if we obtain the correct perpage";
			assertEquals( local.expected, local.test, local.msg );

			local.test = local.test && structKeyExists(local.resp.photos,"photo") && isArray(local.resp.photos.photo);
			local.msg= "test to see if we obtain the photo array";
			assertEquals( local.expected, local.test, local.msg );

		</cfscript>
	</cffunction>	
	
	<cffunction name="testNotImplemented" access="public" returnType="void">
		<cfscript>
			assertFalse(true,"Test not implemented");
		</cfscript>
	</cffunction>

<!--- setup and teardown --->
	
	<cffunction name="setUp" returntype="void" access="public" hint="constructor script to setup resources and dependencies for unit test functions to run">
		<cfscript>
		variables.cfc = createObject("component","cfmlabs.lib.cfcs.api.CFlickr").init();
			//debug(variables.cfc);
    </cfscript>
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public" hint="destructor script to realloc resources and destroy objects after unit test functions run">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>

</cfcomponent>