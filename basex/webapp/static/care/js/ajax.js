/* ====================================================================
 * alf-bootstrap-ajax.js v0.68.51
 * ====================================================================
 * Copyright (c) 2013, Sebastian Wiemer
 * All rights reserved.
 * 
 * ==================================================================== */
var restxq_prefix = "/";

!function ($) {

  'use strict'; // jshint ;_;
  
  

  var Ajax = function () {}
/*	Alle Elemente die ein click-event auslösen und die Klasse ajax besitzen
	werden hier abgefangen um die Inhalte des results dynamisch nachladen zu können */
	
  Ajax.prototype.click = function (e) {
    var $this = $(this)
      , url = $this.attr('href')
      , method = $this.data('method')
      , content = $($this.data('content')).val()
	  , message = $this.data('message');

    $this.addClass("disabled")

    if (!method) {
      method = content ? 'post' : 'get'
    }
    
    e.preventDefault()

    $.ajax({
      url: url+'?random='+Math.random(),
      type: method,
      dataType: 'html',
      data : content,
      statusCode: {
        200: function(data) {
			if(message){$.pnotify({
			  title: "Erfolg",
			  text: message,
			  type: "success"
			});}
				
		processData(data, $this)
        $this.removeClass("disabled")
        },
        500: function() {
          $this.trigger('bootstrap-ajax:error', [$this, 500])
        },
		400: function(data) {
		$.pnotify({
					title: data.status,
					text: data.statusText,
					type: 'error',
					hide: false
                });
          $this.trigger('bootstrap-ajax:error', [$this, 500])
        },
        404: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 404])
        },
        403: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 403])
        window.open(restxq_prefix+'logout','Login','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=100,width=320,height=480'); 
        }
      }
    })
  }
  
  
/*	Alle Elemente die ein Submit auslösen und die Klasse ajax besitzen
	werden in dieser Funktion abgefangen um das result vom POST-CALL
	dynamisch nachzuladen */
  Ajax.prototype.submit = function (e) {
    var $this = $(this)
      , url = $this.attr('action')
      , method = $this.attr('method')
      , data = serializeObject($this)
      , button = $this.find('input[type=submit],button[type=submit]')
	  , message = $this.data('message');
    button.attr('disabled', 'disabled')

	console.log($this)
	console.log(data)
    e.preventDefault()

    $.ajax({
      url: url+'?random='+Math.random(),
      type: method,
      data: data,
	  dataType: 'html',
      cache: false,
      contentType: false,
      processData: false,
      statusCode: {
        200: function(data) {
			if(message){$.pnotify({
			  title: "Erfolg",
			  text: message,
			  type: "success"
			});}
			processData(data, $this)
        },
        500: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 500])
        },
        404: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 404])
        },
        403: function() {
        $this.trigger('bootstrap-ajax:error', [$this, 403])
        window.open(restxq_prefix+'logout','Login','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=100,width=320,height=480'); 

        }
      },
      complete: function() {
        button.removeAttr('disabled')
      }
    })
  }
  
  Ajax.prototype.cancel = function(e) {
    var $this = $(this)
      , selector = $this.attr('data-cancel-closest')
    
    e.preventDefault()
    
    $this.closest(selector).remove()
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

function processData(data, $el) {
    if (data.responseText) data=data.responseText;
    if (data.firstChild) data = data.firstChild;
      var replace_selector = $el.attr('data-replace')
        , replace_closest_selector = $el.attr('data-replace-closest')
        , replace_inner_selector = $el.attr('data-replace-inner')
        , replace_closest_inner_selector = $el.attr('data-replace-closest-inner')
        , append_selector = $el.attr('data-append')
        , prepend_selector = $el.attr('data-prepend')
        , refresh_selector = $el.attr('data-refresh')
        , refresh_closest_selector = $el.attr('data-refresh-closest')
        , clear_selector = $el.attr('data-clear')
        , remove_selector = $el.attr('data-remove')
        , clear_closest_selector = $el.attr('data-clear-closest')
        , remove_closest_selector = $el.attr('data-remove-closest')
      
      if (replace_selector) {
        $(replace_selector).replaceWith(data)
      }
      if (replace_closest_selector) {
        $el.closest(replace_closest_selector).replaceWith(data)
      }
      if (replace_inner_selector) {
        $(replace_inner_selector).html(data)
      }
      if (replace_closest_inner_selector) {
        $el.closest(replace_closest_inner_selector).html(data)
      }
      if (append_selector) {
        $(append_selector).append(data)
      }
      if (prepend_selector) {
        $(prepend_selector).prepend(data)
      }
      if (clear_selector) {
        $(clear_selector).html('')
      }
      if (remove_selector) {
        $(remove_selector).remove()
      }
      if (clear_closest_selector) {
        $el.closest(clear_closest_selector).html('')
      }
      if (remove_closest_selector) {
        $el.closest(remove_closest_selector).remove()
      }
    
    $el.trigger('bootstrap-ajax:success', [data, $el]);
  }

  $(function () {
    $('body').on('click', 'a.ajax', Ajax.prototype.click)
    $('body').on('submit', 'form.ajax', Ajax.prototype.submit)
    $('body').on('click', 'a[data-cancel-closest]', Ajax.prototype.cancel)
  })
}(window.jQuery);

    var restxq=function(url,css){$.ajax({
      url: restxq_prefix+''+url+'?random='+Math.random(),
      type: 'get',
      dataType: 'html',
      statusCode: {
        200: function(data) {
          $(css).html(data)
        },
        403: function() {
        window.open(restxq_prefix+'logout','Login','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=100,width=320,height=480'); 
      $this.trigger('bootstrap-ajax:error', [$this, 403])
        },
        500: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 500])
        },
        404: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 404])
        }
      }
    })};
	
	var restxqPost=function(url,content,message,css,option){
	  console.log(url)
	  console.log(content)
	  console.log(message)
	  console.log(css)
	  console.log(option)
	  $.ajax({
      url: url+'?random='+Math.random(),
      type: "post",
      data: content,
	  dataType: 'html',
      cache: false,
      contentType: false,
      processData: false,
      statusCode: {
        200: function(data) {
			if(message){$.pnotify({
			  title: "Erfolg",
			  text: message,
			  type: "success"
			});}
			if(option=="replace-inner") 
				$(css).html(data);
			else if(option=="replace") 
				$(css).replaceWith(data);
			else if(option=="append") 
				$(css).append(data);
        },
        500: function() {
			$.pnotify({
					title: "Error",
					text: "500",
					type: 'error',
					hide: false
                });
			//$this.trigger('bootstrap-ajax:error', [$this, 500])
        },
        404: function() {
			$.pnotify({
					title: "Error",
					text: "404",
					type: 'error',
					hide: false
                });
			//$this.trigger('bootstrap-ajax:error', [$this, 404])
        },
        403: function() {
			//$this.trigger('bootstrap-ajax:error', [$this, 403])
			window.open(restxq_prefix+'logout','Login','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=100,width=320,height=480'); 

        }
      }
    })};
	
	var restxqReplace=function(url,css){$.ajax({
      url: restxq_prefix+''+url+'?random='+Math.random(),
      type: 'get',
      dataType: 'html',
      statusCode: {
        200: function(data) {
          $(css).replaceWith(data)
        },
        403: function() {
        window.open(restxq_prefix+'logout','Login','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=100,width=320,height=480'); 
      $this.trigger('bootstrap-ajax:error', [$this, 403])
        },
        500: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 500])
        },
        404: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 404])
        }
      }
    })};
	
	var restxq2=function(url,css,option){
	$.ajax({
      url: restxq_prefix+''+url+'?random='+Math.random(),
      type: 'get',
      dataType: 'html',
      statusCode: {
        200: function(data) {
			if(option=="replace-inner") 
				$(css).html(data);
			else if(option=="replace") 
				$(css).replaceWith(data);
			else if(option=="append") 
				$(css).append(data);
        },
        403: function() {
        window.open(restxq_prefix+'logout','Login','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=100,top=100,width=320,height=480'); 
      $this.trigger('bootstrap-ajax:error', [$this, 403])
        },
        500: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 500])
        },
        404: function() {
      $this.trigger('bootstrap-ajax:error', [$this, 404])
        }
      }
    })};