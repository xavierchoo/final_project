let determine = false
let n = 0;
let comment = function(event){	
	const { id } = event.target
	$(".comment_display").css("display", "none");
    document.getElementById(`comment-${id}`).style.display = "block";
}