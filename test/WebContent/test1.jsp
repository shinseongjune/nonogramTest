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
	text-align: center;
}
.game_cell {
	width: 40px;
	height: 40px;
	border: 1px solid black;
}
.top_hint {
	width: 40px;
	height: 180px;
	border: 1px solid black;
	border-bottom: 3px solid black;
	border-top: 0px;
}
.left_hint {
	width: 180px;
	height: 40px;
	border: 1px solid black;
	border-right: 3px solid black;
	border-left: 0px;
}
.top_hint.left_hint {
	width: 180px;
	height: 180px;
	border-top: 0px;
	border-left: 0px;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}
.invisible {
	border: 0px;
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
			var a = Math.min($('#rowNum').val(), 20);
			var b = Math.min($('#colNum').val(), 20);
			$("#map").empty();
			for(var i = 0; i <= a + 1; i++) {
				$("#map").append("<tr class='row" + i + "'></tr>");				
			}
			for(var i = 0; i <= b + 1; i++) {
				$("#map").children("tr").append("<td class='game_cell col" + i + "'></td>");				
			}
			for(var i = 0; i <= a; i++) {
				$(".row" + i).children("td").addClass("row" + i);
			}
			$("#map tr:first-child>td").addClass("top_hint").removeClass("game_cell");
			$("#map tr td:first-child").addClass("left_hint").removeClass("game_cell");
			$("#map tr:last-child>td").removeClass("game_cell").addClass("invisible");
			$("#map tr td:last-child").removeClass("game_cell").addClass("invisible");
		});
		$(document).on("mousedown", ".game_cell", function(e) {
		    switch (e.which) {
		        case 1:
		            if($(this).hasClass("on")) {
		            	$(this).removeClass("on");
		            } else {
		            	$(this).removeClass("marked").addClass("on");
		            }
		            break;
		        case 3:
		        	if($(this).hasClass("marked")) {
		        		$(this).removeClass("marked");
		        	} else {
		        		$(this).removeClass("on").addClass("marked");
		        	}
		            break;
		        default:
		            break;
		    }
		    for(var i = 1; i < $("tr").length; i++) {
    			var arr = [];
    			var j = 0;
    			$.each($(".row" + i).children(), function(){
    				if($(this).hasClass("on")) {
    					j++;
    				} else {
	    				arr.push(j);
	    				j = 0;
    				}
    			});
    			$(".left_hint.row" + i).empty();
    			for(var k = 0; k < arr.length; k++) {
    				if(arr[k] != 0)
    					$(".left_hint.row" + i).append("<span>" + arr[k] + "</span>");
    			}
    		}
		    for(var i = 1; i < $(".row0").children().length; i++) {
		    	var arr = [];
		    	var j = 0;
		    	$.each($(".col" + i), function(){
		    		if($(this).hasClass("on")) {
		    			j++;
		    		} else {
			    		arr.push(j);
			    		j = 0;
		    		}
		    	});
		    	$(".top_hint.col" + i).empty();
		    	for(var k = 0; k < arr.length; k++) {
		    		if(arr[k] != 0)
		    			$(".top_hint.col" + i).append("<p>" + arr[k] + "</p>");
		    	}
		    }
		});
		
	});
</script>
<body>

	row : <input type="number" id="rowNum" min="5" max="20" />
	col : <input type="number" id="colNum" min="5" max="20" />
	<input type="button" id="getTable" value="표 만들기" />
	
	<table id="map">
	</table>
</body>
</html>