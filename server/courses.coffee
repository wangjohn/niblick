Meteor.methods
  addCourse: (course) ->
    Courses.insert(course)
