$ ->
	$body = $("body")
	$menuToggle = $(".header__menu-toggle")
	$mobileMenu = $(".mobile-menu")
	$menuItem = $(".main-menu__item")
	breakpoint = 999


	TweenMax.set($mobileMenu, { autoAlpha: 0, display: "none", scaleY: 0 })
	$mobileMenu.animation = new TimelineLite({ paused: true } ).to($mobileMenu, 0.1, { autoAlpha: 1, display: "block", scaleY: 1, ease: Power1.easeOut })
	$menuItem.filter(".active").addClass("current")

	checkOffset = ($element) ->
		$subMenu = $element.find(".main-sub-menu")
		return unless $subMenu.length

		$subMenu.css("marginLeft",  "0px")
		$menu = $element.closest(".main-menu")
		headerOffsetRight = parseInt $menu.offset().left + $menu.width()
		subMenuOffsetRight = parseInt $element.offset().left + $element.innerWidth() / 2 + $subMenu.width() / 2
		marginLeft = headerOffsetRight - subMenuOffsetRight + 10

		if subMenuOffsetRight > headerOffsetRight
			$subMenu.css("marginLeft", marginLeft + "px")

	activateMenu = (event) ->
		$target = $(event.currentTarget)
		$menuItem.removeClass("active").filter($target).addClass("active").end()
		checkOffset $target

	deactivateMenu = ->
		$menuItem.removeClass("active").filter(".current").addClass "active"

	openMenu = ->
		$menuToggle.addClass("active")
		$body.addClass("menu-open")
		$mobileMenu.animation.play()

	closeMenu = ->
		$menuToggle.removeClass("active")
		$body.removeClass("menu-open")
		$mobileMenu.animation.reverse()

	$menuToggle.on "click", ->
		if not $menuToggle.hasClass("active")
			$menuToggle.trigger("menu-open")
		else
			$menuToggle.trigger("menu-close")

	$menuToggle.on "menu-open", openMenu
	$menuToggle.on "menu-close", closeMenu

	$(window).load ->
		checkOffset $menuItem.filter(".active")
		$menuItem.hover(activateMenu, deactivateMenu)

	$(window).on "resize", ->
		if window.innerWidth > breakpoint and $menuToggle.hasClass("active")
			$mobileMenu.animation.reverse()
			$body.removeClass("menu-open")
			$menuToggle.removeClass("active")
