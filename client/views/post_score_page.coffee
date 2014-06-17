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
