// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


Event.observe(window, 'load', function(){
	$A(document.getElementsByClassName('notice')).each(function(o) {
		o.opacity = 100.0
		Effect.Fade(o, {duration: 3.0})
	});
});




Ajax.Responders.register({
  onCreate: function() {
    if($('busy') && Ajax.activeRequestCount>0)
      Effect.Appear('busy',{duration:0.5,queue:'end'});
  },
  onComplete: function() {
    if($('busy') && Ajax.activeRequestCount==0)
      Effect.Fade('busy',{duration:0.5,queue:'end'});
  }
});
