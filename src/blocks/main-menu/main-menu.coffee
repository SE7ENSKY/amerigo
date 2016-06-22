$ ->
  $body = $('body')
  $header = $('.header')
  $menu = $('.header__menu')
  $mobileMenu = $('.header__menu-toggle')
  $mobileSubmenu = $('.mobile-menu')
  $menuItem = $('.main-menu__item')
  $firstMenuItem = $menuItem.first()
  $firstSubMenu = $firstMenuItem.find('.main-sub-menu')
  selected = undefined

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
    $mobileMenu.toggleClass('active')
    if $mobileSubmenu.toggleClass('active').hasClass('active')
      $body.addClass('menu-open')
      $mobileSubmenu.animation.play()
    else
      $body.removeClass('menu-open')
      $mobileSubmenu.animation.reverse()

  $(window).on 'resize-debounce', ->
    if window.innerWidth > 999 and $mobileSubmenu.hasClass('active')
      $mobileMenu.removeClass('active')
      $mobileSubmenu.removeClass('active')
      $body.removeClass('menu-open')
      $mobileSubmenu.animation.reverse()