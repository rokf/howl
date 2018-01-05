-- Copyright 2012-2015 The Howl Developers
-- License: MIT (see LICENSE.md at the top-level directory of the distribution)

import style, ListWidget, Popup from howl.ui

class MenuPopup extends Popup
  new: (@items, @callback) =>
    error('Missing argument #1: items', 3) if not @items
    error('Missing argument #2: callback', 3) if not @callback

    @list = ListWidget (-> @items),
      default_style: style.popup and 'popup'
      top_border: 0
      auto_fit_width: true
    @highlight_matches_for = ''
    super @list\to_gobject!
    with @child
      .margin_top = 2
      .margin_left = 2

    @list\show!

  refresh: =>
    @list\update @highlight_matches_for

  show: (...) =>
    @refresh!
    super ...
    @resize!

  resize: =>
    h_margin = @child.margin_left + @child.margin_right
    v_margin = @child.margin_top + @child.margin_bottom
    super @list.width + h_margin, @list.height + v_margin

  choose: =>
    if self.callback @list.selection
      @close!

  keymap: {
    down: => @list\select_next!
    ctrl_n: => @list\select_next!
    up: => @list\select_prev!
    ctrl_p: => @list\select_prev!
    page_down: => @list\next_page!
    page_up: => @list\prev_page!

    on_unhandled: (event, source, translations, self) ->
      unless event.character
        self\close!

    return: => @choose!
  }

return MenuPopup
