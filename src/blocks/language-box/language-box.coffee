$ ->
	$block = $('.language-box')
	return unless $block.length

	$button = $block.find('.language-box__form-button')

	$button.on 'click', (e) ->
		e.preventDefault()

		$block.closest('.modal').modal 'hide'
		$(document).trigger 'preloader.hide'