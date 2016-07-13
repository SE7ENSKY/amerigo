$ ->
	$block = $(".overview")
	return unless $block.length

	$toggle = $block.find('.overview__toggle')
	$toggle.on 'click', ->
		$(@).closest('.overview__list-item').toggleClass 'active'
		$(@).toggleClass 'active'
		scroller?.refresh()

	$items = $block.find '.overview__list-item'
	initCollapse = ->
		$items.each ->
			$this = $ @
			$this.removeClass 'collapsed'
			$image = $this.find '.overview__list-image'
			$content = $this.find '.overview__list-content'
			$this.toggleClass 'collapsed', $image.height() < $content.height() - 20
		scroller?.refresh()

	initCollapse()

	$(window).load ->
		initCollapse()

	$(window).resize ->
		initCollapse()