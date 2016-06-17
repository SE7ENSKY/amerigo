$ ->
	$input = $('.intl-tel-input')

	keyupTimeout = undefined
	$input.intlTelInput
		allowExtensions: true
		autoHideDialCode: false
		nationalMode: false

	$input.on 'keyup', ->
		keyupTimeout = setTimeout (->
			if not $input.intlTelInput('isValidNumber')
				if $input.val().length is 0
					$input.removeClass 'content-form__erorr-input'

				else
					$input.addClass 'content-form__erorr-input'

			else
				$input.removeClass 'content-form__erorr-input'

			clearTimeout(keyupTimeout)
		), 2000

	$input.on 'blur', ->
		if not $input.intlTelInput('isValidNumber')
			if $input.val().length is 0
				$input.removeClass 'content-form__erorr-input'
				$error.fadeOut()
				clearTimeout(keyupTimeout)
			else
				$input.addClass 'content-form__erorr-input'

				clearTimeout(keyupTimeout)
		else
			$input.removeClass 'content-form__erorr-input'

		clearTimeout(keyupTimeout)

	$input.on 'keydown focus', ->
		$input.removeClass 'content-form__erorr-input'

		clearTimeout(keyupTimeout)