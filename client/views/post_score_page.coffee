Template.course_selection_buttons.events
  "click button.add-course": (evt) ->
    Session.set("course_selection_adding_course", true)

Template.post_score_page.adding_course = ->
  Session.get("course_selection_adding_course")

Template.create_new_course.events
  "click .submit-new-course": (evt) ->
    htmlWrapper = $(".create-new-course")

    courseSpecifications =
      name: htmlWrapper.find(".course-name")
      tees: htmlWrapper.find(".course-tees")
      rating: htmlWrapper.find(".course-rating")
      slope: htmlWrapper.find(".course-slope")
      yardage: htmlWrapper.find(".course-yardage")

    Session.set("course_selection_adding_course", false)

  "click .add-detailed-information": (evt) ->
    Session.set("course_selection_add_detailed_information", true)

  "click .hide-detailed-information": (evt) ->
    Session.set("course_selection_add_detailed_information", false)

Template.create_new_course.add_detailed_information = ->
  Session.get("course_selection_add_detailed_information")

Template.create_new_course_detailed_information.events
  "keyup .hole-yardage input": (evt) ->
    callback = parValueGenerator(".hole-yardage input", ".hole-par input", evt)
    maximumLengthFocuser(3, evt, callback)

  "keyup .hole-par input": (evt) ->
    maximumLengthFocuser(1, evt)

  "keyup .hole-handicap input": (evt) ->
    maximumLengthFocuser(2, evt)

Template.create_new_course_detailed_information.show_detailed_information = ->
  "hide" unless Session.get("course_selection_add_detailed_information")

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
