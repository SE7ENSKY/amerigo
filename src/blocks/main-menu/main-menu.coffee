$ ->
  $header = $('.header')
  $menu = $('.header__menu')
  $menuItem = $('.main-menu__item')
  $firstMenuItem = $menuItem.first()
  $firstSubMenu = $firstMenuItem.find('.main-sub-menu')
  selected = undefined

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

  $('.mobile-menu').on "click", ->
    $('.mobile-menu__block').toggleClass('active')