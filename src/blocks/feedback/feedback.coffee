$ ->
	tuneUpGravity = ->
		initIntlTelInput $(".phone-input input")

		$('.gfield').find('input, textarea, select').each ->
			$this = $(@)
			value = $this.val()
			$this.closest(".gfield, .form-group").addClass('has-value') if value

		$('.gfield').find('input, textarea, select').on 'focus', (e) ->
			$this = $(e.target)
			$this.closest(".gfield, .form-group").addClass('has-value')

		$('.gfield').find('input, textarea, select').on 'blur', (e) ->
			$this = $(e.target)
			value = $this.val()
			$this.closest(".gfield, .form-group").removeClass('has-value') unless value

		$(".gfield_select, .form-group select").each ->
			$select = $(@)
			$parent = $select.closest('.gfield, .form-group')

			$select.select2
				minimumResultsForSearch: -1
				width: '100%'

			$select.on 'select2:select', (e) ->
				$parent.addClass('has-value') if $select.val()

			$select.on 'select2:unselect', (e) ->
				$parent.removeClass('has-value') unless $select.val()

			$(document).on 'touchstart', 'form .select2.select2-container:not(.select2-container--open)', (e) ->
				$(e.currentTarget).parent().find('select.select2-hidden-accessible').select2("open")

			$(document).on 'touchstart', 'form .select2.select2-container.select2-container--open', (e) ->
				$(e.currentTarget).parent().find('select.select2-hidden-accessible').select2("close")


			closeBehavior = ->
				$(document).on 'resize-debounce', ->
					$select.select2("close") if $select.length

				scroller?.on 'scroll', ->
					$select.select2("close") if $select.length

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
		$form = $(e.currentTarget).closest('.gform_wrapper form')
		return unless $form.length
		
		e.preventDefault()
		window.$lastSendingForm = $form.closest('.gform_wrapper').clone(true, true)
		window.$lastSendingFormParent = $(e.currentTarget).closest('.gform_wrapper').parent()
		
		$form.addClass('submitting').submit()

	$(document).on 'gform.success', (e) ->
		if $lastSendingFormParent.length and $lastSendingForm.length
			$lastSendingForm.addClass('disabled').css('pointerEvents', 'none')
				.find('.gfield_error').removeClass('gfield_error').end()
				.find('.erorr-input').removeClass('erorr-input').end()
				
			$lastSendingFormParent.prepend($lastSendingForm)
		$('#success-modal').modal('show')
		scroller?.refresh()

	$(window).load ->
		tuneUpGravity()

		$(document).on 'gform_post_render', (e) ->
			tuneUpGravity()