Template.post_score_body.events
  "keyup .course-yardage": (evt) ->
    $(".create-new-course .course-yardage").attr("data-user-input", "t")

  "click .add-detailed-information": (evt) ->
    Session.set("post_score_add_detailed_information", true)

  "click .hide-detailed-information": (evt) ->
    Session.set("post_score_add_detailed_information", false)

Template.post_score_detailed_information.events
  "keyup .hole-yardage input": (evt) ->
    callback = parValueGenerator(".hole-yardage input", ".hole-par input", evt)
    maximumLengthFocuser(3, evt, callback)
    totalYardageAdder(".create-new-course .course-yardage")

  "keyup .hole-par input": (evt) ->
    maximumLengthFocuser(1, evt)

  "keyup .hole-handicap input": (evt) ->
    maximumLengthFocuser(2, evt)

Template.post_score_information.show_detailed_information = ->
  "hide" unless Session.get("post_score_add_detailed_information")

Template.post_score_information.show_non_detailed_information = ->
  "hide" if Session.get("post_score_add_detailed_information")

Template.post_score_body.add_detailed_information = ->
  Session.get("post_score_add_detailed_information")

totalYardageAdder = (totalYardageSelector, evt) ->
  if $(totalYardageSelector).val() == "" or $(totalYardageSelector).attr("data-user-input") == "f"
    yardages = $(".hole-yardage input").map( -> $(@).val() ).get()
    totalYardage = 0
    for yardage in yardages
      if yardage != ""
        totalYardage += parseInt(yardage, 10)

    $(totalYardageSelector).val(totalYardage)
    $(totalYardageSelector).attr("data-user-input", "f")

parValueGenerator = (yardageInputsSelector, parValueSelector, evt) ->
  callback = ->
    yardageInputs = $(yardageInputsSelector)
    yardageIndex = yardageInputs.index($(evt.currentTarget))
    yardage = parseInt($(evt.currentTarget).val(), 10)
    if yardage < 250
      parValue = 3
    else if yardage < 450
      parValue = 4
    else
      parValue = 5
    $(parValueSelector).eq(yardageIndex).val(parValue)
  callback

maximumLengthFocuser = (maximumLength, evt, cb) ->
  target = $(evt.currentTarget)
  if /[0-9]/.test(String.fromCharCode(evt.which)) and target.val().length >= maximumLength
    inputs = $("input")
    inputs.eq(inputs.index(target) + 1).focus()
    cb() if cb
