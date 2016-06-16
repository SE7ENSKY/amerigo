$ ->
	$block = $(".feedback")
	return unless $block.length
	$form = $(".feedback").find("form")
	
	$form.find('input').on 'blur change', (e) ->
		_this = e.target
		fieldVal = $(_this).val()
		$(_this).addClass 'has-value' if fieldVal
		$(_this).removeClass 'has-value' unless fieldVal