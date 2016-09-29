
function popup() {
	$("#join").css({display:true});
	$("#join").dialog({
		// closeOnEscape : false,
		// open : function(event, ui) {
		// $(".ui-dialog-titlebar-close", $(this).parent()).hide();
		// },
		position : {
			my : "center",
			at : "top+205",
//			of : 
		},
		draggable : false,
		autoOpen : true,
		resizable : false,
		height : 500,
		width : 400,
		modal : true,
		show : {
			effect : "blind",
			duration : 300
		},
		hide : {
			effect : "blind",
			duration : 300
		},

	});
	$(".ui-dialog-titlebar").css({
		height : '35px'
	});
	$(".ui-dialog-titlebar-close").css({
		float : 'right',
		width : '45px',
		height : '30px',
		fontSize : '13px',
		color : 'white',
		textAlign : 'center',
		textShadow : '0 1px 2px rgba(0, 0, 0, 0.25)',
		background : '#79ABFF',
		border : 0,
		borderBottom : '2px solid #5587ED',
		borderRadius : '5px',
		cursor : 'pointer',
		boxShadow : 'inset 0 -2px #5587ED',
	});
}
