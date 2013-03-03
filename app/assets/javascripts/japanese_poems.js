
$(document).ready(function(){
	$('#helper').jrumble({
		x: 3,
		y: 3,
		rotation:2,
		speed:80 
	});
	$('#hint').hide();
	
	
	
	var demoTimeout;	
	$('#helper').click(function(){
		$this = $(this);
		clearTimeout(demoTimeout);
		$this.trigger('startRumble');
		demoTimeout = setTimeout(function(){$this.trigger('stopRumble');}, 500)

			$('#hint').hide();
			$('#hint-poet').hide();
			$('#hint-place').hide();
			$('#hint-translation').hide();

		var r = Math.random();
		if(r<0.25){
			$('#hint').fadeIn("slow");
			$('#hint-poet').fadeIn();
		}
		else if(r<0.5){
			$('#hint').fadeIn("slow");
			$('#hint-place').fadeIn();
		}
		else if(r<0.75){
			$('#hint').fadeIn("slow");
			$('#hint-translation').fadeIn();
		}

	});
	
});
