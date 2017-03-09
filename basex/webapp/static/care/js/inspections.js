function switchChoosenModule(mId) {
	var url = "/switchChoosenModule/"+mId;
	$.ajax({
      url: url+'?random='+Math.random(),
      type: 'get',
      dataType: 'html',
      cache: false,
      contentType: true,
      processData: false,
      statusCode: {
        200: function() {
			 
			}
		}
	})
}

function chooseAllModules() {
var cbs = $(".checkbox input");
	for(var i=0;i<cbs.size();i++) {
		if(!cbs[i].checked) cbs[i].click()
	}
}

function chooseNoModules() {
var cbs = $(".checkbox input");
	for(var i=0;i<cbs.size();i++) {
		if(cbs[i].checked) cbs[i].click()
	}
}