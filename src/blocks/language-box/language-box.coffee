$ ->
	$modal = $('#language-modal')
	if $modal.length
		$button = $modal.find('.language-box__form-button')
		$button.on 'click', (e) ->
			e.preventDefault()
			$input = $modal.find('input:checked').not('.active')
			if $input.length
				val = $input.val()
				if val
					sessionStorage.setItem('langSelected', 'true')
					window.location = val
			else
				$modal.modal 'hide'
				$(document).trigger 'preloader.hide'
	else
		$(document).trigger 'preloader.hide'
		return
