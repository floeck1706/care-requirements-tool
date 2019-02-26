var showPopover = function () {
    $(this).popover('show');
}
, hidePopover = function () {
    $(this).popover('hide');
};

function switchSystemAndObject() {
	var liability = $(".re-input#liability"), system = $(".re-input#system"), inputs = $(".re-input");
	if(inputs.index(liability)<inputs.index(system)) {
		system.after(liability).removeClass("margin-left-5px").attr("tabindex","2")
		liability.addClass("margin-left-5px").attr("tabindex","3")
	} else {
		liability.after(system).removeClass("margin-left-5px").attr("tabindex","2")
		system.addClass("margin-left-5px").attr("tabindex","3")
	}
}

function showEventCondition() {
	$('#span-condition').show()
	$('#span-condition-event').show()
	switchSystemAndObject()
	$('.re-input#subject').focus().click().val('')
	$('.re-input#type').val('event')
	console.log("ereignis-master on")
}

function hideEventCondition() {
  $('#span-condition').hide()
	$('#span-condition-event').hide()
  switchSystemAndObject()
  $('.re-input#system').focus().click()
  $('.re-input#type').val('')
  console.log("ereignis-master off")
}

function showLogicCondition() {
  $('#span-condition').show()
	$('.re-input#system').focus().click()
	$('#span-condition-logic').show()
  switchSystemAndObject()
	$('.re-input#comparisonItem').focus().click().val('')
	$('.re-input#value').val('')
	$('.re-input#type').val('logic')
	console.log("logic-master on")
}

function hideLogicCondition() {
  $('#span-condition').hide()
	$('#span-condition-logic').hide()
	switchSystemAndObject()
	$('.re-input#system').focus().click()
	$('.re-input#type').val('')
	console.log("logic-master off")
}

function showTimespanCondition() {
  $('#span-condition').show()
	$('.re-input#system').focus().click()
	$('#span-condition-timespan').show()
  switchSystemAndObject()
	$('.re-input#type').val('timespan')
	console.log("timespan-master on")
}

function hideTimespanCondition() {
  $('#span-condition').hide()
	$('#span-condition-timespan').hide()
	switchSystemAndObject()
	$('.re-input#system').focus().click()
	$('.re-input#type').val('')
	console.log("timespan-master off")
}

  /*	Inhalt vom Formelement wird in ein FormData Objekt gepackt um es via POST
	übergeben zu können */
function serializeObject($form)
{
    var o = new FormData();
    var a = $form.serializeArray();
    $.each(a, function() {
        o.append(this.name, this.value); 
	});
    return o;
};

function validateStencil() {
	if($.trim($("#system").val()) 
			&& $.trim($("#liability").val()) 
			&& $.trim($("#actor").val()) 
			&& $.trim($("#functionality").val())
			&& $.trim($("#functionality").val())=="die Möglichkeit bieten" 
			&& $.trim($("#object").val()) 
			&& $.trim($("#processverb").val())) return true 
	else if($.trim($("#system").val()) 
			&& $.trim($("#liability").val())
			&& !($.trim($("#actor").val()))
			&& ($.trim($("#functionality").val())=="" || $.trim($("#functionality").val())=="fähig sein")
			&& $.trim($("#object").val())
			&& $.trim($("#processverb").val())) return true
	else return false
}