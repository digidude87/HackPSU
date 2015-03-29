<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Voice.com</title>
<meta name="description"
	content="meSpeak.js (modulary enhanced speak.js) is a 100% client-side JavaScript text-to-speech library based on the speak.js project." />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="mespeak.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/vision.css" rel="stylesheet">
<link href="css/formstyle.css" rel="stylesheet">

<script type="text/javascript">
	function nosubmit(action) {
		document.forms['noform'].action = action;
		document.forms['noform'].submit();
	}
</script>


</head>
<body>
	<form id="noform"></form>
	<div id="bg">
		<img src="images/vision_bg.jpg" alt="">
	</div>
	<div class="navbar-wrapper ">
		<div class="container">

			<div class="navbar navbar-inverse navbar-fixed-top" id="top-nav">
				<div class="container">
					<div class="navbar-header">
						<!-- Logo Starts -->
						<div class="navbar-brand">VISION.com</div>
						<!-- #Logo Ends -->


					</div>


					<!-- Nav Starts -->
					<div class="navbar-collapse  collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="nosubmit('loadVisual')">Visually
									Impaired Candidates</a>
							</li>
							<li><a href="#" onclick="nosubmit('loadDyslexic')">Dyslexic
									Candidates</a></li>
							<!-- <li><a href="#contactus">Contact Us</a></li> -->
						</ul>
					</div>
					<!-- #Nav Ends -->

				</div>
			</div>

		</div>
	</div>

	<!-- Navbar ends -->

	<div class="container overlay">


		<!-- home banner starts -->

		<div class="row">
			<div class="col-sm-7">
				<div class="row" style="height: 350px">
					<div class="col-sm-12">
						<div style="padding: 100px 0 20px 0">
							<div class="fronttext">
								<h2 class="bgcolor">
									<span class="glyphicon glyphicon-eye-close"></span> VISION.com
									....
								</h2>
								<br>
								<p>
									A website dedicated developed with the VISION of assisting
									students with disabilities like blindness and dyslexia in their
									academics by providing a platform to convert readable text into
									voice media. <br> <br> Let's being about a change ...
									LET'S MAKE SOME LIVES BETTER
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="textContainer" >"Thirteen-year-old Eli, has a
							dyslexic friend who studies by making a Power Point presentation on her
							computer of the material she'll be tested on. She listens to it
							several times and takes notes. And if I did this on a Mac, I
							could even use the computer's voice feature to read the material
							to me.".....<br><br>VISION.com aims to BRIDGE this dependency on MAC's</div>
					</div>
				</div>
			</div>
			<div class="col-sm-5 col-sm-7">
				<div id="home" class="homeinfo">
					<form>
						<%-- <h1>Student Login</h1>
						<div class="inset">
							<p>
								<label for="email">EMAIL ADDRESS</label> <input type="text"
									name="email" id="email">
							</p>
							<p>
								<label for="password">PASSWORD</label> <input type="password"
									name="password" id="password">
							</p>
						</div>
						<p class="p-container">
							<span><a href="#" onclick="nosubmit('underconstruction')">Forgot
									password ?</a> </span> <input type="submit" name="go" id="go"
								value="Log in" disabled="disabled">
						</p> --%>
						<h1>Dyslexic Students</h1>
						<h1>Tech Tips :</h1>
						<i><a href="http://dyslexia.yale.edu/DYS_Student2Student.html"
							target="_blank">http://dyslexia.yale.edu/DYS_Student2Student.html</a>
						</i>
						<div class="inset" style="height: 350px; overflow: auto">
							<p>
							<ul>
								<li>After you complete a writing assignment, whether it's a
									paragraph or a longer paper, record yourself or someone in your
									family reading it aloud. Being able to listen to it as you read
									it over several times can help you to spot errors and things
									you'd like to change, and to understand and remember what
									you've learned.</li>
								<br>
								<li>Listen to assigned books on tape or CD, reading along
									in your written copy. Bonus? You'll feel much better prepared
									if you know you're going to be called upon to read out loud in
									class the next day.</li>
								<br>
								<li>Ask your parents or a teacher to help you sign up for
									access to recorded books and other written materials.</li>
							</ul>
							</p>
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="row" align="center" style="height: 5%">
			<div class="col-lg-12">
				<div class="copyright" style="width: 100%; text-align: center;">Copyright&copy;Abhi@HackPSU</div>
			</div>
		</div>
	</div>

	<!-- <form action="chooseFile" method="post" enctype="multipart/form-data">
			<label>Choose a text file : </label><input type="file" name="inpFile"
				id="uploadFile" onchange="CheckFileName()"><br> <input
				type="submit" value="Upload" id="submit" disabled="disabled">
		</form>
		<div id="renderTxt"></div>


		<input type="button" value="Play" onclick="play()" />
		<div style="display: none">
			<audio id="audioPlayer" src="" autoplay="autoplay"></audio>
		</div> -->
</body>
</html>