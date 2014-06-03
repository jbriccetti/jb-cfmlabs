<!DOCTYPE html>
<html class="no-js"><!-- InstanceBegin template="/Templates/main.dwt.cfm" codeOutsideHTMLIsLocked="false" -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!-- InstanceBeginEditable name="doctitle" -->
		<title>&lt;cfmlabs&gt;</title>
		<!-- InstanceEndEditable -->
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" href="../../css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="../../css/main.css">
	<script src="../../js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- InstanceBeginEditable name="head" -->
		<!-- InstanceEndEditable -->
	<!-- InstanceParam name="description" type="text" value="" -->
</head>
<body>
	<cfinclude template="../../lib/includes/header.cfm" />

	<div class="container-fluid">
		<!-- InstanceBeginEditable name="content" -->
			<div class="row-fluid">
				<div class="span12">

				<cfscript>
					request["cache"] = {}; // in the normal world this would be a more persistent scope than request
					try{
						test={"dataservice"=createobject("component", "cfmlabs.lib.cfcs.service.SpreadsheetReader").init(),"examples"={},"cache"={}};
					}catch(any e){
						test={"dataservice"=createobject("component", "briccetti.lib.cfcs.service.SpreadsheetReader").init(),"examples"={},"cache"={}};
					}
					test.dataService.setDataDir(expandPath('.'));
					
					test.examples["counties"] = {"data"=test.dataservice.getData("counties"),"display"="CNTY_NAME","value"="CNTY_CODE"};
					test.examples["states"] = {"data"=test.dataservice.getData("states")};
					test.examples["countries"] = {"data"=test.dataservice.getData("countries"),"display"="COUNTRY","value"="COUNTRY_ID"};
					test.examples["control"] = {"data"=test.dataservice.getData("idontexists")};
					
					request.cache["html"] = {};
					for(i in test.examples){
						//writedump(var=test.examples[i].data,label=i);
						if(isDefined("test.examples.#i#.data.body") 
							&& isQuery(test.examples[i].data.body) 
							&& test.examples[i].data.body.recordcount GT 0
							&& isDefined("test.examples.#i#.display")
							&& isDefined("test.examples.#i#.value")){
							request.cache.html[i] = test.dataService.queryToHTMLOptions(test.examples[i].data.body,test.examples[i].value,test.examples[i].display);
						}
					}
				</cfscript>
				<cfif isDefined("request.cache.html.countries")>
				<form>
					<select>
						<cfoutput>#request.cache.html.countries#</cfoutput>
					</select>
				</form>
				</cfif>

				<cfif isDefined("test.examples.counties.data.body") && isQuery(test.examples.counties.data.body)>
					<ul>
						<cfoutput query="test.examples.counties.data.body">
							<li>#cnty_name#</li>
						</cfoutput>
					</ul>
				</cfif>
				</div>
			</div>
		<!-- InstanceEndEditable -->
		<hr>
	</div>

	<cfinclude template="../../lib/includes/footer.cfm" />

	<script src="../../js/vendor/jquery-1.10.1.min.js"></script>
	<script src="../../js/vendor/bootstrap.min.js"></script>
	<script src="../../js/main.js"></script>
	<!-- InstanceBeginEditable name="js" -->
	<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
