$ ->
	window.initIntlTelInput = ($input) ->
		keyupTimeout = undefined
		$input.intlTelInput
			allowExtensions: true
			autoHideDialCode: false
			nationalMode: false

		$input.on 'keyup', ->
			keyupTimeout = setTimeout (->
				if not $input.intlTelInput('isValidNumber')
					if $input.val().length is 0
						$input.removeClass 'erorr-input'

					else
						$input.addClass 'erorr-input'

				else
					$input.removeClass 'erorr-input'

				clearTimeout(keyupTimeout)
			), 2000

		$input.on 'blur', ->
			if not $input.intlTelInput('isValidNumber')
				if $input.val().length is 0
					$input.removeClass 'erorr-input'
					$error.fadeOut()
					clearTimeout(keyupTimeout)
				else
					$input.addClass 'erorr-input'

					clearTimeout(keyupTimeout)
			else
				$input.removeClass 'erorr-input'

			clearTimeout(keyupTimeout)

		$input.on 'keydown focus', ->
			$input.removeClass 'erorr-input'

			clearTimeout(keyupTimeout)