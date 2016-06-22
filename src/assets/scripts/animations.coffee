initAnimation = ->
	wh = window.innerHeight
	controller = new (ScrollMagic.Controller)
	scene = (el, tween, duration = 0, offset = 0, hook = 0.75) ->
		new ScrollMagic.Scene(
			offset: offset
			duration: duration
			triggerElement: el
			triggerHook: hook
		)
			.setTween(tween)
			.addIndicators({name: '#' + $(el).get(0).id + ' ' + $(el).get(0).className})
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

	# scene '.visual', new TimelineMax()
	# 	.fromTo('.visual__text', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)

	scene '.about', new TimelineMax()
		.fromTo('.about__image', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.about__title', 1, {autoAlpha: 0, y: 30}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.about__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.4)

	scene '.overview', new TimelineMax()
		.fromTo('.overview__title', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.overview__text', 1, {autoAlpha: 0, y: 40}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)

	scene '.feedback', new TimelineMax()
		.fromTo('.feedback__stamp', 1, {autoAlpha: 0, scale: 2}, {autoAlpha: 1, scale: 1, ease: Power2.easeOut}, 0.8)

	##

$ ->
	initAnimation() if window.innerWidth >= 768 and !Modernizr?.touchevents