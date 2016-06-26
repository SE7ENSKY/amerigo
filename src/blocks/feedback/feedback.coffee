$ ->
	tuneUpGravity = ->

		initIntlTelInput $(".phone-input input")

		$('.gfield').find('input, textarea').each ->
			$this = $(@)
			value = $this.val()
			$this.closest(".gfield").addClass('has-value') if value

		$('.gfield').find('input, textarea').on 'focus', (e) ->
			$this = $(e.target)
			$this.closest(".gfield").addClass('has-value')

		$('.gfield').find('input, textarea').on 'blur', (e) ->
			$this = $(e.target)
			value = $this.val()
			$this.closest(".gfield").removeClass('has-value') unless value

		$(".gfield_select, .form-group select").each ->
			$select = $(@)
			$parent = $select.closest('.gfield')
			$label = $parent.find('label')
			placeholder = $label.text()
			$label.detach()
			# $select.attr('placeholder', placeholder)
			# $select.find('option').each ->
			# 	$option = $(@)
			# 	unless $option.text()
			# 		$select.prepend('<option></option>')
			# 		$option.detach()
			# $select.addClass("select7_native_dropdown")
			# setTimeout ->
			# 	$select.select7()
			# , 10

			$select.select2()
			closeBehavior = ->
				$(document).on 'resize-debounce', ->
					$select.select2("close")

				scroller?.on 'scroll', ->
					$select.select2("close")

			if window.loaded
				closeBehavior()
			else 
				$(window).load ->
					closeBehavior()

		$('.gform_footer').each ->
			$this = $(@)
			$oldBtn = $this.find("input[type='submit']")
			value = $oldBtn.val()
			$oldBtn.detach()
			$this.prepend "<button type='submit' class='gform_button button'>#{value}</button>"

		scroller?.refresh()

	$(document).on 'click', "[type='submit']", (e) ->
		e.preventDefault()
		$this = $(e.currentTarget)
		$this.closest('.gform_wrapper form').addClass('submitting').submit()

	$(document).on 'gform.success', (e) ->
		$('#success-modal').modal('show')
		scroller?.refresh()

	$(window).load ->
		tuneUpGravity()

		$(document).on 'gform_post_render', (e) ->
			tuneUpGravity()