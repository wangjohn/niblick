Template.post_score_fancy_page.helpers
  holes: ->
    holes = []
    for i in [1..18]
      holes.push({
        hole_number: i,
        par: 4,
      })
    holes

Template.post_score_fancy_page.events
  "mouseenter .individual-hole": (evt) ->
    selectHole(evt)

  "mouseleave .individual-hole": (evt) ->
    clearHoleSelection(evt)

  "focus .individual-hole input.hole-attribute": (evt) ->
    selectHole(evt)

  "click .btn-increase": (evt) ->
    changeInput(1, evt)

  "click .btn-decrease": (evt) ->
    changeInput(-1, evt)

  "change input.hole-attribute": (evt) ->
    $input = $(evt.target)
    setScoreType($input.val(), $input.closest(".individual-hole"))

  "click .hole-par-label": (evt) ->
    $tar = $(evt.currentTarget)
    $tar.addClass("hidden")
    $input = $tar.closest(".hole-par-display").find(".hole-par-input")
    $input.removeClass("hidden")
    $input.focus()

  "blur .hole-par-input": (evt) ->
    $input = $(evt.currentTarget)
    closeParInput($input)

  "keypress .hole-par-input": (evt) ->
    char = String.fromCharCode(evt.which)
    if !char.match(/[0-9]/)
      return evt.preventDefault()
    $input = $(evt.currentTarget)
    closeParInput($input, char)

closeParInput = ($input, value) ->
  $input.addClass("hidden")
  $label = $input.closest(".hole-par-display").find(".hole-par-label")
  $label.find(".hole-par").text(value) if value
  $label.removeClass("hidden")

changeInput = (delta, evt) ->
  $hole = $(evt.target).closest(".individual-hole")
  $input = $hole.find("input.hole-attribute")
  newVal = (parseInt($input.val(), 10) || 0) + delta
  setScoreType(newVal, $hole)
  $input.val(newVal)

setScoreType = (score, $hole) ->
  $well = $hole.find(".well")
  $well.removeClass((index, css) ->
    (css.match(/(^|\s)score-type-\S+/g) || []).join(' ')
  )
  $well.addClass(scoreType(4, score))

scoreType = (par, score) ->
  differential = score - par
  if differential > 2
    "score-type-bogey-other"
  else if differential == 2
    "score-type-double-bogey"
  else if differential == 1
    "score-type-bogey"
  else if differential == 0
    "score-type-par"
  else if differential == -1
    "score-type-birdie"
  else if differential == -2
    "score-type-eagle"
  else
    "score-type-albatross"

clearHoleSelection = (evt) ->
  $(".post_score_fancy_page .individual-hole").removeClass("selected")

selectHole = (evt) ->
  clearHoleSelection(evt)
  $tar = $(evt.target).closest(".individual-hole")
  $tar.addClass("selected")

