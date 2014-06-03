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
			<cfparam name="url.test" default="0" />
			<cfset sep =createObject("java", "java.lang.System").getProperty("file.separator") />
			<cfdirectory action="list" name="images" directory="#getDirectoryFromPath(getCurrentTemplatePath())#" filter="*.jpg"/>
			<cfquery name="images" dbtype="query">
				SELECT * FROM images 
				<cfif listlen(url.test,"-") EQ 2>
					WHERE NAME = '#listRest(url.test,"-")#.jpg'
				</cfif>
				ORDER BY SIZE DESC
			</cfquery>

			<div class="row-fluid">
				<div class="span12">
					<h3> be sure to clear your browser cache in between tests to ensure a proper load time</h3>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							standard image rendering
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="index.cfm?test=1-xs">x-small</a></li>
							<li><a href="index.cfm?test=1-s">small</a></li>
							<li><a href="index.cfm?test=1-m">medium</a></li>
							<li><a href="index.cfm?test=1-l">large</a></li>
							<li><a href="index.cfm?test=1-xl">x-large</a></li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							base64 embedded image rendering
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="index.cfm?test=2-xs">x-small</a></li>
							<li><a href="index.cfm?test=2-s">small</a></li>
							<li><a href="index.cfm?test=2-m">medium</a></li>
							<li><a href="index.cfm?test=2-l">large</a></li>
							<li><a href="index.cfm?test=2-xl">x-large</a></li>
						</ul>
					</div>
				</div>
			</div>
			<cfswitch expression="#listFirst(url.test,'-')#">
				<cfcase value="1">
					<cfloop query="images">
						<figure>
							<figcaption><cfoutput>#byteConvert(size)#</cfoutput></figcaption>
							<cfoutput><img src="#name#"></cfoutput>
						</figure>
					</cfloop>
				</cfcase>
				<cfcase value="2">
					<cfloop query="images">
						<figure>
							<figcaption><cfoutput>#byteConvert(size)#</cfoutput></figcaption>
							<cfscript>
								img = imageRead(listAppend(directory,name,sep));
								//imageWriteBase64(img,listAppend(getDirectoryFromPath(getCurrentTemplatePath()),"temp.txt",sep),"jpg","yes");
							</cfscript>
							<cfoutput><img src="data:image/*;base64,#toBase64(img)#" /></cfoutput>
						</figure>
					</cfloop>
				</cfcase>
			</cfswitch>

<cfscript>
/**
 * Pass in a value in bytes, and this function converts it to a human-readable format of bytes, KB, MB, or GB.
 * Updated from Nat Papovich's version.
 * 01/2002 - Optional Units added by Sierra Bufe (&#115;&#105;&#101;&#114;&#114;&#97;&#64;&#98;&#114;&#105;&#103;&#104;&#116;&#101;&#114;&#102;&#117;&#115;&#105;&#111;&#110;&#46;&#99;&#111;&#109;)
 * 
 * @param size 	 Size to convert. 
 * @param unit 	 Unit to return results in.  Valid options are bytes,KB,MB,GB. 
 * @return Returns a string. 
 * @author Paul Mone (&#115;&#105;&#101;&#114;&#114;&#97;&#64;&#98;&#114;&#105;&#103;&#104;&#116;&#101;&#114;&#102;&#117;&#115;&#105;&#111;&#110;&#46;&#99;&#111;&#109;&#112;&#97;&#117;&#108;&#64;&#110;&#105;&#110;&#116;&#104;&#108;&#105;&#110;&#107;&#46;&#99;&#111;&#109;) 
 * @version 2.1, January 7, 2002 
 */
function byteConvert(num) {
	var result = 0;
	var unit = "";
	
	// Set unit variables for convenience
	var bytes = 1;
	var kb = 1024;
	var mb = 1048576;
	var gb = 1073741824;

	// Check for non-numeric or negative num argument
	if (not isNumeric(num) OR num LT 0)
		return "Invalid size argument";
	
	// Check to see if unit was passed in, and if it is valid
	if ((ArrayLen(Arguments) GT 1)
		AND ("bytes,KB,MB,GB" contains Arguments[2]))
	{
		unit = Arguments[2];
	// If not, set unit depending on the size of num
	} else {
		  if      (num lt kb) {	unit ="bytes";
		} else if (num lt mb) {	unit ="KB";
		} else if (num lt gb) {	unit ="MB";
		} else                {	unit ="GB";
		}		
	}
	
	// Find the result by dividing num by the number represented by the unit
	result = num / Evaluate(unit);
	
	// Format the result
	if (result lt 10)
	{
		result = NumberFormat(Round(result * 100) / 100,"0.00");
	} else if (result lt 100) {
		result = NumberFormat(Round(result * 10) / 10,"90.0");
	} else {
		result = Round(result);
	}
	// Concatenate result and unit together for the return value
	return (result & " " & unit);
}
</cfscript>

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
