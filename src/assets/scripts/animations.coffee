initAnimation = ->
	wh = window.innerHeight
	controller = new (ScrollMagic.Controller)
	scene = (el, tween, duration = 0, offset = 0, hook = 0.75) ->
		return unless $(el).length
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

	scene '.visual', new TimelineMax()
		.fromTo('.visual__text', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)

	scene '.about', new TimelineMax()
		.fromTo('.about__image', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.about__title', 1, {autoAlpha: 0, y: 30}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.about__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.4)

	scene '.overview', new TimelineMax()
		.fromTo('.overview__title', 1, {autoAlpha: 0, y: 20}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0)
		.fromTo('.overview__text', 1, {autoAlpha: 0, y: 40}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)

	scene '.feedback', new TimelineMax()
		.fromTo('.feedback__stamp', 1, {autoAlpha: 0, scale: 2}, {autoAlpha: 1, scale: 1, ease: Power2.easeOut}, 0.8)

	scene '.info-card[data-anchor="program-baccalaureate"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="program-baccalaureate"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="program-baccalaureate"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="program-baccalaureate"] .info-card__image', 1, {autoAlpha: 0, x: -50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)


	scene '.info-card[data-anchor="program-english-language"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="program-english-language"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="program-english-language"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="program-english-language"] .info-card__image', 1, {autoAlpha: 0, x: 50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)


	scene '.info-card[data-anchor="program-university-preparation"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="program-university-preparation"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="program-university-preparation"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="program-university-preparation"] .info-card__image', 1, {autoAlpha: 0, x: -50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)

	scene '.info-card[data-anchor="residential-life"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="residential-life"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="residential-life"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="residential-life"] .info-card__image', 1, {autoAlpha: 0, x: -50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)

	scene '.info-card[data-anchor="cultural-immersion"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="cultural-immersion"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="cultural-immersion"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="cultural-immersion"] .info-card__image', 1, {autoAlpha: 0, x: 50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)

	scene '.info-card[data-anchor="technology"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="technology"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="technology"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="technology"] .info-card__image', 1, {autoAlpha: 0, x: -50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)

	scene '.info-card[data-anchor="activities"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="activities"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="activities"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="activities"] .info-card__image', 1, {autoAlpha: 0, x: 50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)

	scene '.info-card[data-anchor="campus-tours-travel"]', new TimelineMax()
		.fromTo('.info-card[data-anchor="campus-tours-travel"] .info-card__text', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="campus-tours-travel"] .info-card__subtitle', 1, {autoAlpha: 0, y: 50}, {autoAlpha: 1, y: 0, ease: Power2.easeOut}, 0.2)
		.fromTo('.info-card[data-anchor="campus-tours-travel"] .info-card__image', 1, {autoAlpha: 0, x: -50}, {autoAlpha: 1, x: 0, ease: Power2.easeOut}, 0.2)

	##

$ ->
	initAnimation() if window.innerWidth >= 768 and !Modernizr?.touchevents