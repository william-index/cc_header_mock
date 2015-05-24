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

) jQuery
