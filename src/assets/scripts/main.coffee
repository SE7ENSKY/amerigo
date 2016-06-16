# unless touch device
unless 'ontouchstart' in window or window.DocumentTouch and document instanceof DocumentTouch
	# replace tel: links to callto:
	$("a[href^='tel:']").each ->
		$(@).attr 'href', $(@).attr('href').replace('tel:', 'callto:')

$ ->
	$('#site').fullpage
		lockAnchors: true
		responsiveWidth: 768
		responsiveHeight: 650
		scrollBar: true
		autoScrolling: false
		fitToSection: false
		navigation: true
		navigationPosition: 'right'
		anchors: ['welcome', 'about', 'overview']