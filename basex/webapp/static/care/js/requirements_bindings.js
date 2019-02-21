$('.re-tooltip').popover({
	content: 'Popover content',
	trigger: 'manual'
})
.focus(showPopover)
.blur(hidePopover)

$('.re-input#system').bind({
	keypress: function(event) {
		if(event.ctrlKey && event.keyCode==32) {
			event.preventDefault()
			if(!$("#span-condition").is(':visible')) {
				$('#span-condition').toggle()
				switchSystemAndObject()
				$('.re-input#condition').focus().click().val('')
			} 
		}
	}
});

$('.re-input#object').bind({
	keypress: function(event) {
			$('#object-in-tooltip').html($('#object').val());
			if(event.ctrlKey && event.keyCode==32) {
				event.preventDefault()
				if(!$("#object-detail1").is(':visible')) {
					$("#object-detail1").toggle().focus().click().val("")
				} else if($("#object-detail1").is(':visible') && !$("#object-detail2").is(':visible')) {
					$("#object-detail2").toggle().focus().click().val("")
				} else {
					$("#object-detail2").toggle().val("")
				}
			}
		},
		click: function() {
			$('#object-in-tooltip').html($('#object').val());
		}
});

$('.re-input#object-detail1').bind({
	keypress: function(event) {
		if(event.ctrlKey && event.keyCode==32) {
			event.preventDefault()
			$("#object-detail1").toggle().val("")
			$("#object-detail2").toggle().focus().click().val("")
		}
	}
});

$('.re-input#object-detail2').bind({
	keypress: function(event) {
		if(event.ctrlKey && event.keyCode==32) {
			event.preventDefault()
			$("#object-detail2").toggle().val("")
			$("#object").focus().click()
		}
	}
});

$('.re-input#processverb').bind({
	keypress: function(event) {
			$('#processverb-in-tooltip').html($('#processverb').val());
			$('#processverb-detail-in-tooltip').html($('#processverb').val());
			if(event.ctrlKey && event.keyCode==32) {
				event.preventDefault()
				if(!$("#processverb-detail").is(':visible')) {
					$("#processverb-detail").toggle().focus().click().val("")
				} else {
					$("#processverb-detail").toggle().val("")
					$("#processverb").focus().click()
				}
			}
		},
		focus: function() {
			$('#processverb-in-tooltip').html($('#processverb').val());
		}
});

$('.re-input#processverb-detail').bind({
	keypress: function(event) {
		if(event.ctrlKey && event.keyCode==32) {
			event.preventDefault()
			$("#processverb-detail").toggle().val("")
			$("#processverb").focus().click()
		}
	},
	focus: function() {	
		//$('#processverb-detail-in-tooltip').html($('#processverb').val());
	}
});

$('#processverb-detail-link').bind({
	click: function() {
		$("#processverb-detail").toggle().focus().click().val("")
		$("#processverb-detail-in-tooltip").html($("#processverb").val())
	}
});

$('.re-input#condition').bind({
	keypress: function(event) {
		if(event.ctrlKey && event.keyCode==32) {
			event.preventDefault()
			$("#span-condition").toggle()
			$('.re-input#condition').val("").removeAttr("required")
			switchSystemAndObject()
			$('.re-input#system').focus().click()
		}
	}
});

$('.btn#nextPage').bind({
	click: function(event){
		event.preventDefault()
		window.location = this.href
	}
});

$('.btn#prevPage').bind({
	click: function(event){
		event.preventDefault()
		window.location = this.href
	}
});

$(document).bind({
	keypress: function(event){
		if(event.ctrlKey && event.keyCode==2) {
      
			event.preventDefault()
			if(!$("#span-condition-event").is(':visible') & !$("#span-condition-logic").is(':visible')) {
				showEventCondition()
			} else if($("#span-condition-event").is(':visible') & !$("#span-condition-logic").is(':visible')) {
				hideEventCondition()
        showLogicCondition()
			} else {
				hideLogicCondition()
			}
		}
		if(event.ctrlKey && event.keyCode==10) {
			event.preventDefault()
			window.location = $('.btn#nextPage').attr('href')
		}
		if(event.ctrlKey && event.keyCode==127) {
			event.preventDefault()
			window.location = $('.btn#prevPage').attr('href')
		}
		//console.log("Event: "+event.keyCode + ", "+event.ctrlKey);
	}
});

$("#validation-close").bind({
	click: function() {
		$(".validation").fadeToggle();
	}
});

$(".form#insert-form").bind({
	submit: function(event) {
		event.stopPropagation()
		event.preventDefault()
		var $this = $(this)
		//console.log($this)
		var data = serializeObject($this)
		if(validateStencil()) {
				
				restxqPost($this.attr("action"),data,$this.data("message"),$this.data("replace"),"replace")
		}
		else {
			$(".validation").show()
		}
	}
});

var submitRequirement = function() {
		event.stopPropagation()
		event.preventDefault()
		var $this = $(".form#stancil-form");
		if(validateStencil()) {
			$this.submit();
		}
		else {
			$(".validation").show()
		}
	};