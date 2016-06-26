$ ->
	window.initIntlTelInput = ($input) ->
		keyupTimeout = undefined
		$input.intlTelInput
			allowExtensions: true
			autoHideDialCode: false
			nationalMode: false
			dropdownContainer: 'body'

		if window.loaded
				closeBehavior()
		else 
			$(window).load ->
				closeBehavior()

		$input.on 'keyup change', ->
			clearTimeout(keyupTimeout)
			value = $input.val()
			if value && value.substr(0,1) != '+' 
				$input.val "+" + value
				$input.change().trigger 'keyup'

			keyupTimeout = setTimeout (->
				if not $input.intlTelInput('isValidNumber')
					if $input.val().length is 0
						$input.removeClass 'erorr-input'
					else
						$input.addClass 'erorr-input'
				else
					$input.removeClass 'erorr-input'
			), 2000

		$input.on 'blur', ->
			clearTimeout(keyupTimeout)
			if not $input.intlTelInput('isValidNumber')
				if $input.val().length is 0
					$input.removeClass 'erorr-input'
					$error.fadeOut()
				else
					$input.addClass 'erorr-input'
			else
				$input.removeClass 'erorr-input'


		$input.on 'keydown focus', ->
			$input.removeClass 'erorr-input'

			clearTimeout(keyupTimeout)

	initIntlTelInput $('.intl-tel-input')
