$ ->
	$block = $(".overview")
	return unless $block.length
	$list = $block.find('.gallery__list')
	$toggle = $('.overview__toggle')
	$content = ('.overview__list-text')

	$toggle.on 'click', ->
		$(this).parent().children($content).slideToggle()
		$(this).toggleClass('active')
		$(this).text (i, text) ->
			if text == 'collapse bio' then 'read bio' else 'collapse bio'
