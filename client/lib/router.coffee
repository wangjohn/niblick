if Meteor.isClient
  Router.configure
    layoutTemplate: "main_layout"
    notFoundTemplate: "fourohfour_page"
    loadingTemplate: "loading_page"

  Router.map ->
    @route "home",
      path: "/"
      template: "landing_page"
