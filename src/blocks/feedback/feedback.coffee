$ ->
	$block = $(".feedback")
	return unless $block.length
	$form = $(".feedback").find("form")
	$select = $block.find(".gfield_select")
	$input = $block.find(".ginput_container input")
	$phoneWrap = $block.find(".ginput_container_phone")

	$form.find('input, textarea').on 'focus', (e) ->
		$this = $(e.target)
		$this.closest(".gfield").addClass('has-value')

	$form.find('input, textarea').on 'blur', (e) ->
		$this = $(e.target)
		value = $this.val()
		$this.closest(".gfield").removeClass('has-value') unless value

	$phoneWrap.closest(".gfield").addClass('gfield_phone')

	$select.addClass("select7_remove_current")
	setTimeout ->
		$select.select7()
	, 10