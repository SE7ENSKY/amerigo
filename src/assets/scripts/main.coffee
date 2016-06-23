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

window.scroller = null

$ ->
	$window = $(window)
	$window.on 'resize', debounce($window.trigger.bind($window, 'resize-debounce'), 200)
	$window.on 'scroll', debounce($window.trigger.bind($window, 'scroll-debounce'), 200)

	$(window).load ->
		window.loaded = true
		window.scroller = new IScroll('.root',
			scrollbars: true
			mouseWheel: true
			click: true
			# don't scroll horizontal
			scrollX: false
			# but do scroll vertical
			scrollY: true
			# show scrollbars
			scrollbars: true
			# deactivating -webkit-transform because pin wouldn't work because of a webkit bug: https://code.google.com/p/chromium/issues/detail?id=20574
			# if you dont use pinning, keep "useTransform" set to true, as it is far better in terms of performance.
			useTransform: false
			# deativate css-transition to force requestAnimationFrame (implicit with probeType 3)
			useTransition: false
			# set to highest probing level to get scroll events even during momentum and bounce
			# requires inclusion of iscroll-probe.js
			probeType: 3
		)
		window.controller.scrollPos ->
			-scroller.y

	$(".select7").select7()

	$(document).on 'click', '[data-menuanchor]', (e) ->
		$this = $ e.currentTarget
		anchor = $this.data('menuanchor')
		$.fn.fullpage.moveTo(anchor)

	$('#main').fullpage
		lockAnchors: true
		# responsiveWidth: 768
		# responsiveHeight: 650
		autoScrolling: false
		scrollOverflow: false
		fitToSection: false
		afterResize: ->
			scroller.refresh()

	$(".animsition").animsition
		inClass: 'fade-in'
		outClass: 'fade-out'
		inDuration: 500
		outDuration: 500
		linkElement: '.main-menu__item-link'
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