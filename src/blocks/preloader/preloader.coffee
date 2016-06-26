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
			$badge = $('.preloader__badge')
			$logo = $('.preloader__logo')
			$preloader = $('.preloader')
			$text = $('.preloader__logo-text')
			new TimelineLite()
				.to($badge, 1, { height: 0, paddingTop: 102, y: 0, scale: 0.3, ease: Power2.easeOut }, 0)
				.to($logo, 1, { top: 0, marginTop: 14, scale: 0.25, ease: Power2.easeOut }, 0)
				.to($preloader, .7, { autoAlpha: 0, ease: Power2.easeOut }, 1 )
				.to($text, .6, { autoAlpha: 0, ease: Power2.easeOut }, 0)

			$("html").removeClass 'preloading'
			$(document).trigger 'preloaded'
			sessionStorage.setItem('preloaded', 'true')
		, 1000

	siteLoad()
	$(document).on 'preloader.hide', hidePreloader