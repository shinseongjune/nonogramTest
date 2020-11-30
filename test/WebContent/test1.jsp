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
	margin: 20px;
	border-collapse: collapse;
}
.game_cell {
	width: 40px;
	height: 40px;
	border: 1px solid black;
}
.top_hint {
	width: 40px;
	min-height: 40px;
	border: 1px solid black;
	border-bottom: 3px solid black;
	border-top: 0px;
}
.left_hint {
	min-width: 40px;
	height: 40px;
	border: 1px solid black;
	border-right: 3px solid black;
	border-left: 0px;
}
.top_hint.left_hint {
	min-width: 40px;
	min-height: 40px;
	border-top: 0px;
	border-left: 0px;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
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
				$("#map").append("<tr class='row" + i + "'></tr>");				
			}
			for(var i = 0; i <= b; i++) {
				$("#map").children("tr").append("<td class='game_cell col" + i + "'></td>");				
			}
			$("#map tr:first-child>td").addClass("top_hint").removeClass("game_cell");
			$("#map tr td:first-child").addClass("left_hint").removeClass("game_cell");
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

	row : <input type="number" id="rowNum" min="0" max="20" />
	col : <input type="number" id="colNum" min="0" max="20" />
	<input type="button" id="getTable" value="표 만들기" />
	
	<table id="map">
	</table>
</body>
</html>