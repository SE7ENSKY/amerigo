initAnimation = ->
	wh = window.innerHeight
	window.controller = new (ScrollMagic.Controller)

	scene = (el, tween, duration = 0, offset = 0, hook = 0.75) ->
		return unless $(el).length
		new ScrollMagic.Scene(
			offset: offset
			duration: duration
			triggerElement: el
			triggerHook: hook
		)
			.setTween(tween)
			# .addIndicators({name: '#' + $(el).get(0).id + ' ' + $(el).get(0).className})
			.addTo controller

	pinOneWhenTwo = (el1, el2, hook = 1) ->
		if $(el1).height() < wh
			el2 = el1
			hook = 0

		new ScrollMagic.Scene({
			duration: 0
			offset: 0
			triggerElement: el2
			triggerHook: hook
		})
		.setPin(el1)
		.addTo(controller);

	$(".visual_mobile").each ->
		$this = $(@)
		$img = $this.find('.visual__img')

		tween = new TimelineMax()
			.fromTo($img, 1, autoAlpha: 1, {autoAlpha: 0 })

		new ScrollMagic.Scene(
				triggerElement: @
				triggerHook: 0
				duration: '200%'
			)
			.setTween(tween)
			.addTo(controller)

	scene '.visual', new TimelineMax()
		.fromTo('.visual__text', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)

	scene '.about', new TimelineMax()
		.fromTo('.about__image', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.about__title', 1, {autoAlpha: 0, y: 30}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.about__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.4)

	scene '.overview', new TimelineMax()
		.fromTo('.overview__title', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.overview__title', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.overview__text', 1, {autoAlpha: 0, y: 40}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.1)
	
	scene '.overview__subtitle', new TimelineMax()
		.fromTo('.overview__subtitle', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)

	unless Modernizr?.touchevents
		$('.overview__list-item').each ->
			$item = $(@)
			$image = $item.find('.overview__list-image')
			$content = $item.find('.overview__list-content')
			$name = $item.find('.overview__list-name')
			$position = $item.find('.overview__list-position')
			scene @, new TimelineMax()
				.fromTo($image, 1, {autoAlpha: 0, y: -20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
				.fromTo($content, 1, {autoAlpha: 0, y: 10}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
				.fromTo($name, 1, {autoAlpha: 0, y: 10}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
				.fromTo($position, 1, {autoAlpha: 0, y: 10}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.1)

	scene '.feedback button[type="submit"], .feedback .gform_footer', new TimelineMax()
		.fromTo('.feedback__stamp', .2, {autoAlpha: 0, scale: 2}, {autoAlpha: 1, scale: 1, ease: Power2.easeIn}, 0)
	, 0, 100, 1

	unless Modernizr?.touchevents
		scene '.footer__inner', new TimelineMax()
			.fromTo('.footer__inner', 0.5, {autoAlpha: 0}, {autoAlpha: 1, ease: Power2.easeIn})
		, 0, 0, 1

	unless Modernizr?.touchevents
		$('.info-card').each ->
			$item = $(@)
			$image = $item.find('.info-card__image')
			$mask = $item.find('.info-card__body-mask, .info-card__image-mask')

			$title = $item.find('.info-card__title')
			$subtitle = $item.find('.info-card__subtitle')
			$text = $item.find('.info-card__text')

			scene @, new TimelineMax()
				.fromTo($mask, .7, {scaleY: 1}, {scaleY: 0, ease: Power1.easeInOut}, 0)
				.fromTo($image, 1, {y: -50, autoAlpha: 0}, {y: 0, autoAlpha: 1, ease: Power2.easeOut}, 0.1)
				.fromTo($title, 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
				.fromTo($subtitle, 1, {autoAlpha: 0, y: 30}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
				.fromTo($text, 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.4)
			, 0, -45, 0.5
	
	unless Modernizr?.touchevents
		$('.campus').each ->
			$item = $(@)
			scene @, new TimelineMax()
				.fromTo(@, 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.1)


	scene '.page-content', new TimelineMax()
		.fromTo('.page-content .container', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)

	unless Modernizr?.touchevents
		scene '.history', new TimelineMax()
			.fromTo('.history__title', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
			.fromTo('.history__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
			.fromTo('.history__image', 1, {autoAlpha: 0, x: 50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)


	contactsTL = new TimelineMax()
	contactsTL.fromTo('.page_contacts .page__sidebar', 1, {autoAlpha: 0, y: -50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, .2)
	if Modernizr?.touchevents
		contactsTL.fromTo('.page_contacts .page__content', 1, {autoAlpha: 0}, {autoAlpha: 1, ease: Power2.easeOut}, .3)
	else
		contactsTL.fromTo('.page_contacts .page__content', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, .3)
	
	scene '.page_contacts', contactsTL, 0, 0, 0

	scene '.campuses', new TimelineMax()
		.fromTo('.fixed-panel', .1, {autoAlpha: 0}, {autoAlpha: 1, ease: Power2.easeOut})

	scene '.feedback', new TimelineMax()
		.to('.fixed-panel', .2, {autoAlpha: 0, ease: Power2.easeIn})
	, 0, 0, 1


	# $("[data-anchor], [id]").each ->
	$("[data-anchor]").each ->
		$this = $(@)
		{ anchor } = $this.data()
		# anchor = $this.attr('id') unless anchor
		$menuAnchors = $('[data-menuanchor]')
		$menuAnchorTarget = $menuAnchors.filter("[data-menuanchor='#{anchor}']")
		$menuAnchorTargetParent = $menuAnchorTarget.parent()

		thisHeight = $this.outerHeight()
		
		getThisHeight = ->
			return thisHeight

		thisScene = new ScrollMagic.Scene({triggerElement: @, triggerHook: 0.5, duration: getThisHeight})
			.addTo(controller)
			.on("enter leave", (e) ->
				if e.type == "enter"
					$menuAnchorTarget.addClass('active')
					$menuAnchorTargetParent.addClass('active')
				else
					$menuAnchorTarget.removeClass('active')
					$menuAnchorTargetParent.removeClass('active')
			)
			.on("start end", (e) ->
				thisHeight = $this.outerHeight()
			)
			# .on("update", (e) ->
			# 	console.log('update')
			# )
			# .on("progress", (e) ->
			# 	console.log('progress')
			# )

$(document).on 'animation.start', initAnimation

# $ ->
# 	initAnimation()