$ ->
	tuneUpGravity = ->

		initIntlTelInput $(".ginput_container_phone")
		$(".ginput_container_phone").closest(".gfield").addClass('gfield_phone')

		$('.gfield').find('input, textarea').on 'focus', (e) ->
			$this = $(e.target)
			$this.closest(".gfield").addClass('has-value')

		$('.gfield').find('input, textarea').on 'blur', (e) ->
			$this = $(e.target)
			value = $this.val()
			$this.closest(".gfield").removeClass('has-value') unless value

		$select = $(".gfield_select")
		$select.addClass("select7_remove_current")
		setTimeout ->
			$select.select7()
		, 10

		$('.gform_footer').each ->
			$this = $(@)
			$oldBtn = $this.find("input[type='submit']")
			value = $oldBtn.val()
			$oldBtn.detach()
			$this.prepend "<button type='submit' class='gform_button button'>#{value}</button>"


	$(document).on 'click', "[type='submit']", (e) ->
		e.preventDefault()
		$this = $(e.currentTarget)
		$this.closest('.gform_wrapper form').submit()
	$(window).load ->
		tuneUpGravity()