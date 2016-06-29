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
		TweenMax.to('.preloader__spinner', .6, { autoAlpha: 0, ease: Power2.easeOut, delay: .5 })
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
			TweenMax.set($badge, { transformOrigin: '50% 0' })
			
			new TimelineLite()
				.to($badge, 1, { paddingTop: 109, y: -24, scale: 0.3, ease: Power2.easeOut }, 0)
				.to($logo, 1, { top: 0, marginTop: 16, scale: 0.27, ease: Power2.easeOut }, 0)
				.to($text, .6, { autoAlpha: 0, ease: Power2.easeOut }, 0)
				.to($preloader, .7, { autoAlpha: 0, ease: Power2.easeOut }, 1 )
				
			$("html").removeClass 'preloading'
			$(document).trigger 'preloaded'
			sessionStorage.setItem('preloaded', 'true')
		, 1000

	siteLoad()
	$(document).on 'preloader.hide', hidePreloader