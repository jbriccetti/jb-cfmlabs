<!DOCTYPE html>
<html class="no-js"><!-- InstanceBegin template="/Templates/tier-1.dwt.cfm" codeOutsideHTMLIsLocked="false" -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!-- InstanceBeginEditable name="doctitle" -->
		<title>&lt;cfmlabs&gt;</title>
	<!-- InstanceEndEditable -->
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="../../../css/bootstrap.min.css">
	<link rel="stylesheet" href="../../../css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="../../../css/main.css">
	<script src="../../../js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	
	<!-- InstanceBeginEditable name="head" -->
	<!-- InstanceEndEditable -->
	
	
	<!-- InstanceParam name="section" type="text" value="Products" -->
	<!-- InstanceParam name="sectionURL" type="URL" value="index.cfm" -->
</head>
<body>
	<cfinclude template="../../../lib/includes/header.cfm" />

	<div class="container-fluid">
		
			<div class="row-fluid">
				<nav class="span3">
					<ul id="page-nav" class="nav nav-tabs nav-stacked">
						<!--  empty by default -->
					</ul>
				</nav>
				<div class="span9">
					<h2>Products</h2>
					<!-- InstanceBeginEditable name="content" -->
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis ligula lorem, consequat eget, tristique nec, auctor quis, purus. Vivamus ut sem. Fusce aliquam nunc vitae purus. Aenean viverra malesuada libero. Fusce ac quam. Donec neque. Nunc venenatis enim nec quam. Cras faucibus, justo vel accumsan aliquam, tellus dui fringilla quam, in condimentum augue lorem non tellus. Pellentesque id arcu non sem placerat iaculis. Curabitur posuere, pede vitae lacinia accumsan, enim nibh elementum orci, ut volutpat eros sapien nec sapien. Suspendisse neque arcu, ultrices commodo, pellentesque sit amet, ultricies ut, ipsum. Mauris et eros eget erat dapibus mollis. Mauris laoreet posuere odio. Nam ipsum ligula, ullamcorper eu, fringilla at, lacinia ut, augue. Nullam nunc.</p>
						<p>Sed et lectus in massa imperdiet tincidunt. Praesent neque tortor, sollicitudin non, euismod a, adipiscing a, est. Mauris diam metus, varius nec, faucibus at, faucibus sollicitudin, lectus. Nam posuere felis ac urna. Vestibulum tempor vestibulum urna. Nullam metus. Vivamus ac purus. Nullam interdum ullamcorper libero. Morbi vehicula imperdiet justo. Etiam mollis fringilla ante. Donec et dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam mi libero, luctus nec, blandit ac, rutrum ac, lectus.</p>
						<p>Morbi consequat felis vitae enim. Nunc nec lacus. Vestibulum odio. Morbi egestas, urna et mollis bibendum, enim tellus posuere justo, eget elementum purus urna nec lacus. Nullam in nulla. Praesent ac lorem. Donec metus risus, accumsan ut, mollis non, porttitor eget, mi. Aliquam aliquet, tortor a elementum aliquam, erat odio sodales eros, suscipit blandit lectus dolor sit amet elit. In eros wisi, mollis vitae, tincidunt in, suscipit id, nibh. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Phasellus ornare. Suspendisse potenti. Mauris convallis. Vestibulum nec mauris in augue porta mollis. Proin ut nunc. Mauris aliquam dui eget purus.</p>
					<!-- InstanceEndEditable -->
				</div>
			</div>
		
		<hr>
	</div>

	<cfinclude template="../../../lib/includes/footer.cfm" />

	<script src="../../../js/vendor/jquery-1.10.1.min.js"></script>
	<script src="../../../js/vendor/bootstrap.min.js"></script>
	<script src="../../../js/main.js"></script>
	
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function () {
			// we would really call a url that would fetch this info and return it - like a remove include
			// we would call a remote url that used the parameter "section" fromt eh template properties to get the data
			console.log('call a url like: /api.cfc?method=getnav&section=Products&format=html');
			$("ul.nav","nav").html('<li><a href="../tests/dw-templates/section-1/index.cfm">Section 1 Home</a></li><li><a href="../tests/dw-templates/section-1/page1.cfm">Section 1 Page 1</a></li><li><a href="../tests/dw-templates/section-1/page2.cfm">Section 1 Page 2</a></li>');
		});
	</script>
	<!-- InstanceBeginEditable name="js" -->
	<!-- InstanceEndEditable -->
	
</body>
<!-- InstanceEnd --></html>
