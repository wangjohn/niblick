Template.post_score_body.events
  "click #post-score-submit": (evt) ->
    htmlWrapper = $(".create-new-course")

    courseSpecifications =
      name: htmlWrapper.find(".course-name").val()
      tees: htmlWrapper.find(".course-tees").val()
      rating: htmlWrapper.find(".course-rating").val()
      slope: htmlWrapper.find(".course-slope").val()
      total_yardage: htmlWrapper.find(".course-yardage").val()
      yardages: htmlWrapper.find(".detailed-course-information .hole-yardage input").map( -> $(@).val() ).get()
      handicaps: htmlWrapper.find(".detailed-course-information .hole-handicap input").map( -> $(@).val() ).get()
      pars: htmlWrapper.find(".detailed-course-information .hole-par input").map( -> $(@).val() ).get()

    console.log(courseSpecifications)
    courseId = Courses.insert(courseSpecifications)

submitCourseInformation = ->
  console.log "do some course stuff"

submitRoundInformation = ->
  console.log "do some round stuff"
