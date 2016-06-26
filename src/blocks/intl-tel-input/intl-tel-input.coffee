$ ->
	window.initIntlTelInput = ($input) ->
		keyupTimeout = undefined
		wrongKeyTimeout = undefined
		$input.intlTelInput
			autoHideDialCode: true
			nationalMode: false
			dropdownContainer: 'body'

		$input.on 'keyup change', ->
			clearTimeout keyupTimeout
			clearTimeout wrongKeyTimeout
			value = $input.val()
			if value && value.substr(0,1) != '+' 
				$input.val "+" + value
				$input.change().trigger 'keyup'
			else
				if value.match(/[^+\-\ 0-9]/g)
					$input.val value.replace(/[^+\-\ 0-9]/g, '')
					$input.addClass 'erorr-input'
					wrongKeyTimeout = setTimeout ->
						$input.removeClass 'erorr-input'
					, 500

			keyupTimeout = setTimeout (->
				clearTimeout wrongKeyTimeout
				if not $input.intlTelInput('isValidNumber')
					if $input.val().length is 0
						$input.removeClass 'erorr-input'
					else
						$input.addClass 'erorr-input'
				else
					$input.removeClass 'erorr-input'
			), 2000

		$input.on 'blur', ->
			clearTimeout keyupTimeout
			clearTimeout wrongKeyTimeout

			if not $input.intlTelInput('isValidNumber')
				if $input.val().length is 0
					$input.removeClass 'erorr-input'
				else
					$input.addClass 'erorr-input'
			else
				$input.removeClass 'erorr-input'


		$input.on 'keydown focus', ->
			$input.removeClass 'erorr-input'
			clearTimeout(keyupTimeout)

	initIntlTelInput $('.intl-tel-input')
