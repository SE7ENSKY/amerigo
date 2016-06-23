 $ ->
 	$preloader = $('.preloader')

 	return unless $preloader.length


	siteLoad = ->
		if window.loaded
			$(document).trigger 'site.init'
			showLangModal()
		else
			$(window).load ->
				$(document).trigger 'site.init'
				showLangModal()
	
	showLangModal = ->
		return if sessionStorage.getItem('preloaded') == 'true'
		if sessionStorage.getItem('langSelected') == 'true'
			hidePreloader()
		else
			setTimeout ->
				$langModal = $('#language-modal')
				if $langModal.length
					$langModal.modal 'show'
				else
					hidePreloader()
			, 1000

	hidePreloader = ->
		setTimeout ->
			
			# ANIMATIONS HERE 
			$('.preloader').fadeOut 500
			# /ANIMATIONS

			$("html").removeClass 'preloading'
			$(document).trigger 'preloaded'
			sessionStorage.setItem('preloaded', 'true')
		, 1000

	siteLoad()
	$(document).on 'preloader.hide', hidePreloader