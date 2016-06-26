$ ->
	$block = $(".overview")
	return unless $block.length
	$block.each ->
		$this = $ @
		$toggle = $this.find('.overview__toggle')
		$content = $this.find('.overview__list-text')

		$toggle.on 'click', ->
			$content.slideToggle()
			$(@).toggleClass('active')