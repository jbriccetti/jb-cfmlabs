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
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="../css/main.css">
	<script src="../js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- InstanceBeginEditable name="head" -->
		<!-- InstanceEndEditable -->
	<!-- InstanceParam name="description" type="text" value="" -->
</head>
<body>
	<cfinclude template="../lib/includes/header.cfm" />

	<div class="container-fluid">
		<!-- InstanceBeginEditable name="content" -->
			<div class="row-fluid">
				<div class="span12">
					<cfoutput>#request.app.browseDirectory(dir="#expandpath('.')#",title="Misc. Tests")#</cfoutput>
				</div>
			</div>
			<!-- InstanceEndEditable -->
		<hr>
	</div>

	<cfinclude template="../lib/includes/footer.cfm" />

	<script src="../js/vendor/jquery-1.10.1.min.js"></script>
	<script src="../js/vendor/bootstrap.min.js"></script>
	<script src="../js/main.js"></script>
	<!-- InstanceBeginEditable name="js" -->
	<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
