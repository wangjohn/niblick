if Meteor.isClient
  Router.configure
    layoutTemplate: "main_layout"
    notFoundTemplate: "fourohfour_page"
    loadingTemplate: "loading_page"

  Router.map ->
    @route "home",
      path: "/"
      template: "landing_page"

  Router.map ->
    @route "post_score",
      path: "/post_score"
      template: "post_score_page"
