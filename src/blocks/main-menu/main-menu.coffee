$ ->
  $header = $('.header')
  $menu = $('.header__menu')
  $menuItem = $('.main-menu__item')
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

  activateSubMenu = (event) ->
    $target = $(event.currentTarget)
    $currentSubMenu = $target.find('.main-sub-menu')
    if $currentSubMenu.length
      switchClass($target)
      $header.addClass('active')
      checkOffset($currentSubMenu)

  deactivateSubMenu = ->
    $header.removeClass('active')
    selected.removeClass('active')


  $menuItem.on('mouseover touchstart', activateSubMenu)
  $menuItem.on('mouseleave touchend', deactivateSubMenu)

  $('.mobile-menu').on "click", ->
    $('.mobile-menu__block').toggleClass('active')