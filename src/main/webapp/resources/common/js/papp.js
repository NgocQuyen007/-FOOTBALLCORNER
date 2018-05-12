$(document).ready(function(){
	
	$("#btn-pitchb-index-search").click(function(){
		var input = $("#keyword").val();
		$.ajax({
			url : "san-bong",
			type: "GET",
			
			data: {
				keyword: input
			},
			success: function(value) {
				$("#stadium-list").html(value);
			},
			
			error: function(value) {
				alert("appear error !");
			}
		})
	});
	
	$("#btn-pitchb-district-search-all").click(function(){
		
		var stype = getCheckedBoxes("fo-type");
		var sprice = getCheckedBoxes("fo-price");
		var skeyword = $("#keyword").val();
		
		var sdname = $("#id-district-name").val();
		var sdid = $("#id-district-id").val();
		
		$.ajax({
			url : "san-bong-tai"+sdname+"-"+sdid,
			type: "GET", 
			data: {
				type: stype,
				price: sprice,
				keyword: skeyword
			},
				
			success: function(value) {
				$("#stadium-list").html(value);
			},
			
			error: function() {
				alert("error !");
			}
		})
	});
	
	$("#btn-pitchb-index-search-all").click(function(){
		
		var stype = getCheckedBoxes("fo-type");
		var sprice = getCheckedBoxes("fo-price");
		var skeyword = $("#keyword").val();
		
		$.ajax({
			url : "san-bong",
			type: "GET", 
			data: {
				type: stype,
				price: sprice,
				keyword: skeyword
			},
				
			success: function(value) {
				$("#stadium-list").html(value);
			},
			
			error: function() {
				alert("error !");
			}
		})
	});
	
	$("#btn-compf-teams-search-all").click(function(){
		
		var slevel = getCheckedBoxes("fo-level");
		var skeyword = $("#keyword").val();
		
		if (slevel != null) {
			$.ajax({
				url : "doi-bong-tai-da-nang",
				type: "GET", 
				data: {
					level: slevel,
					keyword: skeyword
				},
					
				success: function(value) {
					$("#team-list").html(value);
				},
				
				error: function() {
					alert("error !");
				}
			})
		}
	});
	
})

/** HANDLE LOGIN FOR SYSTEM */ 
$(document).ready(function(){
	
	$("#btnSignIn").click(function(){
		
		var semail = $("#Email").val();
		var spassword = $("#Password").val();
		
		$.ajax({
			url : "ModalLogin",
			type: "POST", 
			data: {
				email: semail,
				password: spassword
			},
				
			success: function(response) {
				if(response == 'fail') {
					// showFormError(response.errorMessageList);
					$("#loginresponse").text(" Lỗi! Mật khẩu không đúng !");
					$(".login-error").show();
				} else {
					$("#loginresponse").text(" Đăng nhập thành công !");
					$(".login-error").show();
					$('#loginModal').modal('hide');
 						window.location.reload();
					}
			},
			
			error: function(ex) {
				console.log(ex);
			}
			
		})
	})
})

function sleep(delay) {
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}

function getCheckedBoxes(chkboxName) {
  var checkboxes = document.getElementsByName(chkboxName);
  var checkboxesChecked = [];
  // loop over them all
  for (var i=0; i<checkboxes.length; i++) {
     // And stick the checked ones onto an array...
     if (checkboxes[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
     }
  }
  // Return the array if it is non-empty, or null
  return checkboxesChecked.length > 0 ? checkboxesChecked.toString() : null;
}

/**
 * 
 * @returns list pitches
 */
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


