# unless touch device
unless 'ontouchstart' in window or window.DocumentTouch and document instanceof DocumentTouch
	# replace tel: links to callto:
	$("a[href^='tel:']").each ->
		$(@).attr 'href', $(@).attr('href').replace('tel:', 'callto:')

$ ->
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