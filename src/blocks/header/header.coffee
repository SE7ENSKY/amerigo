$ ->
	$window = $(window)
	$header = $('.header')
	$window.load ->
		if scroller?
			scroller.on 'scroll', ->
				$header.toggleClass "header_submenu", scroller.y < 0
		else
			$window.scroll ->
				$header.toggleClass "header_submenu", $window.scrollTop() > 0