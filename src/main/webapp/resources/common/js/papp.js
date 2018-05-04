function showCalendar(isShow) {
	if(isShow == 1){
		document.getElementById("divID").style.display = "block";
		isShow = 0;
	} else {
		document.getElementById("divID").style.display = "none";
		isShow = 1;
	}
}

//Search news index
function SearchPitchByNameOrAddress() {
	var input = document.getElementById('keyword').value;
	var xhttp;
	// var url = "api/search?keyword=" + input;
	var url = "san-bong?keyword=" + input;
	if (window.XMLHttpRequest) {
		// code for chrome, firefox, IE7+, Opera, Safari
		xhttp = new XMLHttpRequest();
	} else {
		// Code for IE6--
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	// Mở kết nối và send yêu cầu đến server do 
	//	ajax engine đảm nhiệm. true asyn
	xhttp.open("GET", url, true);
	xhttp.send();

	xhttp.onreadystatechange = function() {
		// Hoàn thành xử lý và đợi gửi lại từ phía client
		if (xhttp.readyState == 4) {
			var data = xhttp.responseText;
			document.getElementById("stadium-list").innerHTML = data;
		}
	}
	// or put it here
}

