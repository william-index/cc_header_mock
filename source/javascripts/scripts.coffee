(($) ->

  # Creates all menus
  menus = {}
  $(".menu_dropdown").each ->
    _menu = $(this).attr("data-menu")
    menus[_menu] = new window.Menu_dropdown($(this))
    true

  # Click Listeners for menu buttons
  #   toggles clicked menu, and closes all others
  $(".site_header__acct_head__menu_btn").click ->
    _menu = $(this).attr("data-menu")
    menus[_menu].toggle()

    for menu of menus
      if menu != _menu
        menus[menu].close()
    true

  # Closes menus when clicking outside of them
  $(document).mouseup (e) ->
    menu_doms = $(".menu_dropdown");
    # This conditional is from http://stackoverflow.com/questions/1403615/use-jquery-to-hide-a-div-when-the-user-clicks-outside-of-it
    #   But Adopted to coffeescript
    if (!container.is(e.target) && container.has(e.target).length == 0)
      for menu of menus
        menus[menu].close()

) jQuery
