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
			<p>&nbsp;</p>
			<div class="row-fluid">
				<div class="span12">
				<h2>AIRBRAKE ERROR SERVICE</h2>
				<ul class="unstyled">
          	<li><a href="err.cfm?err=1">throw a basic error</a></li>
          	<li><a href="err.cfm?err=2">a native cfquery error</a></li>
          	<li><a href="err.cfm?err=3">undefined variable error</a></li>
          	<li><a href="err.cfm?err=4">cant find component</a></li>
          	<li><a href="err.cfm?err=5">missing include</a></li>

         	</ul>
					<h3>References / Resources</h3>
					<ul class="unstyled">
          	<li><a href="https://github.com/shayne/coldfusion-airbrake-notifier" target="_blank">airbrake notifier cfc on github</a></li>
          	<li><a href="http://help.airbrake.io/kb/integrations/adding-assembla-integration" target="_blank">airbrake integration with assembla</a></li>
          	<li><a href="https://labs.airbrake.io/account/new/free" target="_blank">airbrake free account signup (hack)</a></li>
          	<li></li>
         	</ul>
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
