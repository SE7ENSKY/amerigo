$ ->
	$block = $(".overview")
	return unless $block.length
	$toggle = $block.find('.overview__toggle')
	$toggle.on 'click', ->
		$(@).closest('.overview__list-item').find('.overview__list-text').slideToggle()
		$(@).toggleClass('active')