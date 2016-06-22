$ ->
  $header = $('.header')
  $menu = $('.header__menu')
  $mobileMenu = $('.mobile-menu')
  $mobileSubmenu = $('.mobile-submenu')
  $menuItem = $('.main-menu__item')
  $firstMenuItem = $menuItem.first()
  $firstSubMenu = $firstMenuItem.find('.main-sub-menu')
  selected = undefined
  resetMobileMenu = false

  TweenMax.set($mobileSubmenu, { autoAlpha: 0, scaleY: 0 })
  $mobileSubmenu.animation = new TimelineLite({ paused: true } ).to($mobileSubmenu, 0.1, { autoAlpha: 1, scaleY: 1, ease: Power1.easeOut })

  switchClass = ($element, className = 'active') ->
    if selected
      selected.removeClass(className)

    selected = $element
    selected.addClass(className)

  checkOffset = ($element) ->
    headerOffsetRight = $menu.offset().left + $menu.outerWidth()
    subMenuOffsetRight = $element.offset().left + $element.outerWidth()

    if subMenuOffsetRight > headerOffsetRight and not parseInt($element.css('marginLeft'))
      $element.css('marginLeft', (headerOffsetRight - subMenuOffsetRight) + 'px')

  setMenuState = ($activeElement, $offsetElement) ->
    switchClass($activeElement)
    $header.addClass('active')
    checkOffset($offsetElement)

  activateSubMenu = (event) ->
    $target = $(event.currentTarget)
    $currentSubMenu = $target.find('.main-sub-menu')
    if $currentSubMenu.length
      setMenuState($target, $currentSubMenu)
    else
      $header.removeClass('active')
      switchClass($target)

  deactivateSubMenu = ->
      $header.removeClass('active')
      selected.removeClass('active')
      setMenuState($firstMenuItem, $firstSubMenu)

  setMenuState($firstMenuItem, $firstSubMenu)

  $menuItem.on('mouseover touchstart', activateSubMenu)
  $menuItem.on('mouseleave touchend', deactivateSubMenu)

  $mobileMenu.on 'click', ->
    $mobileMenu.find('.mobile-menu__block').toggleClass('active')
    if $mobileSubmenu.toggleClass('active').hasClass('active')
      $mobileSubmenu.animation.play()
    else
      $mobileSubmenu.animation.reverse()

  $(window).on 'resize', ->
    if $(window).width() > 999 and not resetMobileMenu
      $mobileMenu.remove('active')
      $mobileSubmenu.remove('active')
      $mobileSubmenu.animation.reverse()
      resetMobileMenu = true