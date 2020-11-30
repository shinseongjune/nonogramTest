<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	border-collapse: collapse;
}
td {
	width: 40px;
	height: 40px;
	border: 1px solid black;
}
.on {
	background: black;
}
.marked {
   background-image: linear-gradient(to bottom right,  transparent calc(50% - 1px), gray, transparent calc(50% + 1px)); 
}
</style>
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(document).bind("contextmenu", function(e) {
		    return false;
		});
		$("#getTable").click(function(){
			var a = $('#rowNum').val();
			var b = $('#colNum').val();
			$("#map").empty();
			for(var i = 0; i <= a; i++) {
				$("#map").append("<tr></tr>");				
			}
			for(var i = 0; i <= b; i++) {
				$("#map").children("tr").append("<td class='game_cell'></td>");				
			}
			$("#map tr:first-child>td").css({"border-bottom":"3px solid black"}).removeClass("game_cell");
			$("#map tr td:first-child").css({"border-right":"3px solid black"}).removeClass("game_cell");
			$("#map tr:first-child>td:first-child").css({"border":"1px solid black"});
		});
		$(document).on("mousedown", ".game_cell", function(event) {
		    switch (event.which) {
		        case 1:
		            if($(this).hasClass("on")) {
		            	$(this).removeClass("on");
		            } else {
		            	$(this).removeClass("marked").addClass("on");
		            }
		            break;
		        case 3:
		        	event.preventDefault();
		        	if($(this).hasClass("marked")) {
		        		$(this).removeClass("marked");
		        	} else {
		        		$(this).removeClass("on").addClass("marked");
		        	}
		            break;
		        default:
		            break;
		    }
		});
	});
</script>
<body>

	row : <input type="number" id="rowNum" />
	col : <input type="number" id="colNum" />
	<input type="button" id="getTable" value="표 만들기" />
	
	<table id="map">
	</table>
</body>
</html>