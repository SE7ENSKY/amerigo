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

window.locationHash = location.hash.replace(/(\=|\?|\+|\.|\,|\!|\@|\$|\%|\^|\&|\*|\(|\)|\;|\\|\/|\||\<|\>|\"|\').*/g, '')
history.pushState("", document.title, window.location.pathname + window.location.search) if locationHash

$ ->
	FastClick.attach($('.header').get(0))

	$window = $(window)
	$window.on 'resize', debounce($window.trigger.bind($window, 'resize-debounce'), 200)
	$window.on 'scroll', debounce($window.trigger.bind($window, 'scroll-debounce'), 200)

	$(".select7").select7()

	$('a[href*="#"]').each ->
		anchor = @hash.slice(1)
		$(@).attr('data-menuanchor', anchor) if anchor

	$('.visual__title').each ->
		$this = $(@)
		html = $this.html()
		newHtml = html.replace('|', '<br>')
		$this.html newHtml

	window.scrollTo = ($target) ->
		return unless $target.length
		$header = $('.header')
		headerHeight = if $header.length then $header.outerHeight() else 0
		y = $target.offset().top
		y -= headerHeight unless $target.hasClass('visual')
		y -= 30 if window.innerWidth > 999
		scroller?.scrollBy(0, -y, 666,)

	$('#main').fullpage
		lockAnchors: false
		autoScrolling: false
		scrollOverflow: false
		fitToSection: false
		afterResize: ->
			scroller?.refresh()

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

	$(window).load ->
		window.loaded = true
		window.scroller = new IScroll('.root',
			# preventDefault: false
			preventDefaultException: { tagName: /^(INPUT|TEXTAREA|BUTTON|SELECT|UL)$/i }
			interactiveScrollbars: true
			scrollbars: true
			resizeScrollbars: false
			mouseWheel: true
			click: true
			scrollX: false
			scrollY: true
			# deactivating -webkit-transform because pin wouldn't work because of a webkit bug: https://code.google.com/p/chromium/issues/detail?id=20574
			# if you dont use pinning, keep "useTransform" set to true, as it is far better in terms of performance.
			useTransform: false
			# deativate css-transition to force requestAnimationFrame (implicit with probeType 3)
			useTransition: false
			# set to highest probing level to get scroll events even during momentum and bounce
			# requires inclusion of iscroll-probe.js
			probeType: 3
		)
		$(document).trigger 'animation.start'
		# window.controller.scrollPos ->
		# 	-scroller.y


		# SCROLL TO ON LOAD		
		if window.locationHash
			anchor = locationHash.slice(1)
			$target = $("[data-anchor='#{anchor}']").first()
			unless $target.length
				$target = $("##{anchor}").first()
			return unless $target.length
			scrollTo $target

		# SCROLL TO ON CLICK
		$(document).on 'click touchstart', '[data-menuanchor], a[href^="#"]', (e) ->
			$this = $ e.currentTarget

			anchor = $this.data('menuanchor')
			unless anchor
				anchor = $this.get(0).hash.slice(1)

			$target = $("[data-anchor='#{anchor}']").first()
			unless $target.length
				$target = $("##{anchor}").first()

			return unless $target.length
			e.preventDefault()
			scrollTo $target
