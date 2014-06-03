<!--- 
NOTE BECAUSE THIS FILE IS BEING PULLED INTO PAGES AS AN INCLUDE, YOU CANNOT USE RELATIVE PATHING IN ANY LINKS

THE SOLUTION IS TO USE ABSOLUTE LINKS BY WORKING OFF THE TOP LEVEL URL, WHICH IS SETUP by accessing the global variable #request.vars.baseurl#

 --->

<!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
				</a>
				<a class="brand" href="<cfoutput>#request.vars.baseurl#</cfoutput>">&lt;cfmlabs&gt;</a>
				<div class="nav-collapse collapse">
						<ul class="nav">
								<!--- <li class="active"><a href="<cfoutput>#request.vars.baseurl#</cfoutput>">Home</a></li> --->
								<!--- <li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
										<ul class="dropdown-menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li class="nav-header">Nav header</li>
												<li><a href="#">Separated link</a></li>
												<li><a href="#">One more separated link</a></li>
										</ul>
								</li> --->
						</ul>
				</div><!--/.nav-collapse -->
		</div>
	</div>
</div>