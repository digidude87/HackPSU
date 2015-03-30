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
	var txt;
	$(document).ready(function() {
		txt = "${fileTxt}";
		if (txt != "") {
			$("#renderDysTxt").append(txt);
			//alert(document.getElementById("renderTxt").innerHTML);
		}

		$('#renderDysTxt').mouseup(function(e) {
			play(getSelectionText());
		});

	});

	function getSelectionText() {
		var text = "";
		if (window.getSelection) {
			text = window.getSelection().toString();
		} else if (document.selection && document.selection.type != "Control") {
			text = document.selection.createRange().text;
		}
		return text;
	}
	/* function speak() {
		key = "878f97919c1e4270a30df915983505fd";
		hl = "en-in";
		src = "hello world";
		c = "WAV";
		requrl = "https://api.voicerss.org/?key=" + key + "&src=" + src
				+ "&hl=" + hl + "&c=" + c;
		$.get(requrl, function(data) {
			$(".result").html(data);
			alert("Load was performed.");
		});
	} */

	function play(_text) {
		if (_text == "")
			return;
		key = "878f97919c1e4270a30df915983505fd";
		hl = "en-us";
		//_text = document.getElementById("renderDysTxt").innerHTML;
		result = _text.replace(/(<P[\s\S]+?>|<\/>P)/g, "");
		var $temp = $("<div>").html(_text);
		$temp.find("p").each(function() {
			$(this).replaceWith(this.childNodes);
		});
		src = "";
		src += $temp.html();
		if (document.getElementById("audioPlayerDys") != null) {
			if (document.getElementById("audioPlayerDys").canPlayType(
					'audio/mpeg') != "")
				_codec = "mp3";
			else
				_codec = "wav";

			requrl = "https://api.voicerss.org/?key=" + key + "&src=" + src
					+ "&hl=" + hl + "&c=" + _codec;

			document.getElementById("audioPlayerDys").src = requrl + "&rnd="
					+ Math.random();
		}
	}

	function playAll() {
		key = "878f97919c1e4270a30df915983505fd";
		hl = "en-us";
		_text = document.getElementById("renderDysTxt").innerHTML;
		result = _text.replace(/(<P[\s\S]+?>|<\/>P)/g, "");
		var $temp = $("<div>").html(_text);
		$temp.find("p").each(function() {
			$(this).replaceWith(this.childNodes);
		});
		src = "";
		src += $temp.html();
		if (document.getElementById("audioPlayerDys") != null) {
			if (document.getElementById("audioPlayerDys").canPlayType(
					'audio/mpeg') != "")
				_codec = "mp3";
			else
				_codec = "wav";

			requrl = "https://api.voicerss.org/?key=" + key + "&src=" + src
					+ "&hl=" + hl + "&c=" + _codec;

			document.getElementById("audioPlayerDys").src = requrl + "&rnd="
					+ Math.random();
		}
	}
	function CheckFileName() {
		var fileName = document.getElementById("uploadFile").value;
		if (fileName == "") {
			alert("Browse to upload a valid File with txt extension");
			document.getElementById('submit').disabled = 'disabled';
		} else if (fileName.split(".")[1].toUpperCase() == "TXT") {
			document.getElementById('submit').disabled = false;
		} else {
			alert("File with " + fileName.split(".")[1]
					+ " is invalid. Upload a validfile with txt extensions");
			document.getElementById('submit').disabled = 'disabled';

		}
	}

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
						<a href="#" class="navbar-brand" onclick="nosubmit('gohome')">VOICE.com</a>
						<!-- #Logo Ends -->


					</div>


					<!-- Nav Starts -->
					<div class="navbar-collapse  collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="nosubmit('loadVisual')">Visually
									Impaired Candidates</a></li>
							<li class="active"><a href="#"
								onclick="nosubmit('loadDyslexic')">Dyslexic Candidates</a></li>
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

		<div style="padding: 60px">
			<div id="about" class="spacer">
				<div class="row" align="center" style="height: 5%">
					<div class="col-lg-12">
						<h1>DYSLEXIC CANDIDATES</h1>
						<br>
					</div>
				</div>

				<div class="row" align="center" style="height: 40%;">
					<div class="col-lg-8">
						<form action="chooseFileDys" method="post"
							enctype="multipart/form-data">
							<div class="input-group">
								<input type="file" class="form-control"
									placeholder=" Select a file to upload ...." name="inpFile"
									id="uploadFile" onchange="CheckFileName()"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-search" id="submit"
										disabled="disabled">Upload</button> </span>
							</div>
						</form>
					</div>
				</div>
				<div class="row" align="center" style="height: 40%;">
					<div class="col-lg-8">
						<div class="textContainer" style="height: 340px;"
							id="renderDysTxt"></div>
					</div>
					<div class="col-lg-4 col-lg-4">
						<div class="textContainer" style="height: 340px;">
							<h3>Instructions</h3>
							<hr>
							<ul>
								<li>Use the play button below to play audio for entire
									text.</li>
								<br>
								<li>Select text to listen to its audio. (Tip: select full
									words)</li>
								<br>
								<li>Use controls below to pause/play the audio.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row" align="center" style="height: 5%">
					<div class="col-lg-12">
						<div class="textContainer" style="text-align: center">
							<input type="button" onclick="playAll()" class="textContainer"
								value="Play"><a><span
								class="glyphicon glyphicon-play"></span> </a>
							<audio id="audioPlayerDys" src="" autoplay="autoplay" loop="loop"
								controls="controls"></audio>
						</div>
					</div>
				</div>
				<div class="row" align="center" style="height: 5%">
					<div class="col-lg-12">
						<div class="copyright" style="width: 100%; text-align: center;">Copyright&copy;Abhi@HackPSU</div>
					</div>
				</div>
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