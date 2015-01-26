Template.post_score_fancy_page.holes = ->
  holes = []
  for i in [1..18]
    holes.push({
      hole_number: i,
    })
  holes
