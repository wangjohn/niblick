Template.post_score_fancy_page.helpers
  holes: ->
    holes = []
    for i in [1..18]
      holes.push({
        hole_number: i,
      })
    holes

Template.post_score_fancy_page.events
  "focus .individual-hole input": (evt) ->
    $(".post_score_fancy_page .individual-hole").removeClass("selected")
    $tar = $(evt.target).closest(".individual-hole")
    $tar.addClass("selected")
