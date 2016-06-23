# unless touch device
unless 'ontouchstart' in window or window.DocumentTouch and document instanceof DocumentTouch
	# replace tel: links to callto:
	$("a[href^='tel:']").each ->
		$(@).attr 'href', $(@).attr('href').replace('tel:', 'callto:')

window.debounce = debounce = (fn, delay) ->
	timer = null
	->
		context = this
		args = arguments
		clearTimeout timer
		timer = setTimeout(->
			fn.apply context, args
		, delay)

$ ->
	$window = $(window)
	$window.on 'resize', debounce($window.trigger.bind($window, 'resize-debounce'), 200)
	$window.on 'scroll', debounce($window.trigger.bind($window, 'scroll-debounce'), 200)



		$(window).load ->
		window.loaded = true
		
	$('.front-page, .tiles-page, .campuses-page, .default-page').find('.main').fullpage
		lockAnchors: true
		# responsiveWidth: 768
		# responsiveHeight: 650
		autoScrolling: false
		scrollOverflow: false
		fitToSection: false

	$(".select7").select7()

	$(document).on 'click', '[data-menuanchor]', (e) ->
		$this = $ e.currentTarget
		anchor = $this.data('menuanchor')
		$.fn.fullpage.moveTo(anchor)

	fixFooterFn = ->
		$(".root").css paddingBottom: "#{$(".footer").outerHeight()}px"

	fixFooterFn()
	$(window).on 'resize-debounce', ->
		fixFooterFn()

	$(".animsition").animsition
		inClass: 'fade-in'
		outClass: 'fade-out'
		inDuration: 500
		outDuration: 500
		linkElement: '.main-menu__link'
		# // e.g. linkElement: 'a:not([target="_blank"]):not([href^="#"])
		loading: true
		loadingParentElement: 'body'
		loadingClass: 'animsition-loading'
		loadingInner: '' # e.g '<img src="loading.svg" />
		timeout: false
		timeoutCountdown: 5000
		onLoadEvent: true
		browser: [ 'animation-duration', '-webkit-animation-duration']
		overlay : false
		overlayClass : 'animsition-overlay-slide'
		overlayParentElement : 'body'