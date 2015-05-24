###*
* Definition for behavior of all dropdown menu items
* @class Menu_dropdown
* @author @william-index
###
class window.Menu_dropdown


  ###*
  * @constructs Menu_dropdown
  * @param {jquery object} menu - drop down menu dom item
  * @author @william-index
  ###
  constructor: (@$menu) ->
    @note_count = @$menu.find(".menu_dropdown__note").length
    @menu_name = @$menu.attr("data-menu")
    @set_event_listeners()

    false


  ###*
  * Opens Dropdown
  * @method open
  * @memberof Menu_dropdown
  * @author @william-index
  * @public
  ###
  open: ->
    @$menu.addClass "menu_dropdown--open"

  ###*
  * Closes Dropdown
  * @method close
  * @memberof Menu_dropdown
  * @author @william-index
  * @public
  ###
  close: ->
    @$menu.removeClass "menu_dropdown--open"

  ###*
  * Toggles open/close for Dropdown
  * @method toggle
  * @memberof Menu_dropdown
  * @author @william-index
  * @public
  ###
  toggle: ->
    @$menu.toggleClass "menu_dropdown--open"

  ###*
  * Sets listeners for all menu actions
  * (This is pretty bad to put here actually)
  * @method set_event_listeners
  * @memberof Menu_dropdown
  * @author @william-index
  * @private
  ###
  set_event_listeners: ->
    @$menu.find(".check_button").click (e) =>
      _note_index = $(e.target).closest(".menu_dropdown__note").index()
      @remove_note _note_index

  ###*
  * Removes a notification visually from the list
  *   NOTE: The DOM object persists, until user refresh
  * This would actually make an ajax call as well, in
  *   the full featured application to note the user removed
  *   the item from the list.
  *   Clicking on the call-to-action link would also
  *   update the DB, but it doesnt here for obvious reasons
  * @method remove_note
  * @memberof Menu_dropdown
  * @param {int} index - index of note, starting at Zero (0)
  * @author @william-index
  * @private
  ###
  remove_note: (index) ->
    @note_count--
    @check_menu_remove()
    $note = @$menu.find(".menu_dropdown__note").eq(index)
    $note.addClass "menu_dropdown__note--checked"

  ###*
  * For menus with a checklist, checks if that was the last item
  *   and if so, silences the list and the notification button.
  * The button to silence is given via a data attr in the DOM
  * @method check_menu_remove
  * @memberof Menu_dropdown
  * @author @william-index
  * @private
  ###
  check_menu_remove: ->
    if @note_count <= 0
      _btn_str = "site_header__acct_head__menu_btn"
      _sel_str = "."+_btn_str+'[data-menu="'+@$menu.attr("data-menu")+'"]'

      @$menu.addClass "menu_dropdown--done"
      $(_sel_str).addClass _btn_str+"--off"
