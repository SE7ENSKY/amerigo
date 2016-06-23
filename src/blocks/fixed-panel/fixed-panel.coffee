$ ->
	$window = $(window)
	$fixedPanel = $('.fixed-panel')
	$window.on 'scroll-debounce', ->
		return unless $fixedPanel.length
		if $window.scrollTop() >= 220
			$fixedPanel.addClass('active')
		else
			$fixedPanel.removeClass('active')
		if $window.scrollTop() >= $('.feedback').offset().top
			$fixedPanel.removeClass('active')