$ ->
	$block = $('.language-box')
	return unless $block.length

	$button = $block.find('.language-box__form-button')

	$button.on 'click', (e) ->
		e.preventDefault()

		$input = $block.find('input:checked').not('.active')
		if $input.length
			val = $input.val()
			if val
				sessionStorage.setItem('langSelected', 'true')
				window.location = val

		$block.closest('.modal').modal 'hide'
		$(document).trigger 'preloader.hide'