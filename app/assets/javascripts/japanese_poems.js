
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
		if(Math.random()<0.5){
			$('#hint').fadeIn("slow");
		}
	});
	
});
