$ ->
	$window = $(window)
	$header = $('.header')
	$window.load ->
		scroller.on 'scroll', ->
			$header.toggleClass "header_submenu", scroller.y < 0