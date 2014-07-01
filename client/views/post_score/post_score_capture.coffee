Template.post_score_body.events
  "click #post-score-submit": (evt) ->
    console.log(courseSpecifications)
    courseId = Courses.insert(courseSpecifications)

submitCourseInformation = ->
  htmlWrapper = $(".post-score-course-information")
  existingCourseId = htmlWrapper.find(".course-id")
  if existingCourseId
    course = Courses.findOne(existingCourseId)
    # perform necessary updates to the course
    # TODO: figure out how to handle edits to a course. We can:
    # 1. Keep the original course immutable
    # 2. Allow global edits on the real course
    # 3. Allow people to edit their own versions of the course
  else
    course =
      name: htmlWrapper.find(".course-name").val()
      tees: htmlWrapper.find(".course-tees").val()
      rating: htmlWrapper.find(".course-rating").val()
      slope: htmlWrapper.find(".course-slope").val()
      total_yardage: htmlWrapper.find(".course-yardage").val()
      yardages: htmlWrapper.find(".detailed-course-information .hole-yardage input").map( -> $(@).val() ).get()
      handicaps: htmlWrapper.find(".detailed-course-information .hole-handicap input").map( -> $(@).val() ).get()
      pars: htmlWrapper.find(".detailed-course-information .hole-par input").map( -> $(@).val() ).get()
    Courses.insert(course)

submitRoundInformation = ->
  # TODO: add the date of the round somewhere
  htmlWrapper = $(".post-score-scoring-information")

  if Session.get("post_score_add_detailed_information")
    infoWrapper = htmlWrapper.find(".detailed-course-information")
    # TODO: get all the info in here
  else
    infoWrapper = htmlWrapper.find(".non-detailed-course-information")
    courseInformation =
      front_nine_score: infoWrapper.find(".front-nine-score").val()
      back_nine_score: infoWrapper.find(".back-nine-score").val()
      total_score: infoWrapper.find(".total-score").val()
      detailed_information: false

  courseInformation["user_id"] = Meteor.userId()
  Rounds.insert(courseInformation)
