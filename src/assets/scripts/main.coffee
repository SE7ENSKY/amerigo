# unless touch device
unless 'ontouchstart' in window or window.DocumentTouch and document instanceof DocumentTouch
	# replace tel: links to callto:
	$("a[href^='tel:']").each ->
		$(@).attr 'href', $(@).attr('href').replace('tel:', 'callto:')

$ ->
	$('.front-page .main').fullpage
		lockAnchors: true
		responsiveWidth: 768
		responsiveHeight: 650
		scrollBar: true
		fitToSection: false
		normalScrollElements: '.overview, .footer'
		navigation: true
		navigationPosition: 'right'
		anchors: ['welcome', 'about', 'overview']
		normalScrollElements: '.intl-tel-input'

	$(".select7").select7()