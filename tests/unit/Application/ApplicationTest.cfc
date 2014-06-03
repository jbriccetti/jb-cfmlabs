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
  
	<cffunction name="testAnything" access="public" returnType="void">
    <cfscript>
			var local = {};
			
			local.msg= "";
			local.expected = "true";
			local.actual = isObject(variables.cfc);
			assertEquals( local.expected, local.actual, local.msg );
		</cfscript>
	</cffunction>	
	
	<cffunction name="testSomethingElse" access="public" returnType="void">
		<cfscript>
			assertFalse(true,"Test not implemented");
		</cfscript>
	</cffunction>

<!--- setup and teardown --->
	
	<cffunction name="setUp" returntype="void" access="public" hint="constructor script to setup resources and dependencies for unit test functions to run">
		<cfscript>
			variables.cfc = request.app;
			//debug(variables.cfc);
    </cfscript>
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public" hint="destructor script to realloc resources and destroy objects after unit test functions run">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>

</cfcomponent>