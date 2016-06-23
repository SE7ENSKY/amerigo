 $ ->
 	$preloader = $('.preloader')

 	return unless $preloader.length

	siteLoad = ->
		if window.loaded
			$(document).trigger 'site.init'
			hidePreloader()
		else
			$(window).load ->
				$(document).trigger 'site.init'
				hidePreloader()
	
	hidePreloader = ->
		setTimeout ->
			$('.preloader').fadeOut 500
			$("html").removeClass 'preloading'
			$(document).trigger 'preloaded'
			sessionStorage.setItem('preloaded', 'true')
		, 1000

	siteLoad()