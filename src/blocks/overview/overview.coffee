$ ->
	$block = $(".overview")
	return unless $block.length

	$window = $ window

	$toggle = $block.find '.overview__toggle'
	$items = $block.find '.overview__list-item'
	$text = $items.find '.overview__list-text'

	$toggle.on 'click', ->
		$this = $(@)
		$item = $this.closest('.overview__list-item')
		if $this.hasClass 'active'
			$this.removeClass 'active'
			$item.removeClass 'active'
			$text.dotdotdot()
		else
			$this.addClass 'active'
			$item.addClass 'active'
			$text.trigger 'destroy'
		
		scroller?.refresh()

	initCollapse = ->
		$text.trigger 'destroy'
		$items.each ->
			$this = $ @
			$this.removeClass 'collapsed'
			$image = $this.find '.overview__list-image'
			$content = $this.find '.overview__list-content'
			$this.toggleClass 'collapsed', $image.height() < $content.height() - 20
		scroller?.refresh()
		$text.dotdotdot() if $window.width() > 767 


	initCollapse()

	$window.load ->
		initCollapse()

	$window.resize ->
		initCollapse()