class Atoms.Organism.Main extends Atoms.Organism.Article

  @scaffold "assets/scaffold/main.json"

  render: ->
    super
    do @fetch

  # ============================================================================
  # Instance events
  # ============================================================================
  fetch: (context = "index")->
    __.proxy("GET", context).then (error, response) ->
      unless response.videos.length is 0
        __.Entity.Video.create video for video in response.videos

  # ============================================================================
  # Children bubble events
  # ============================================================================
  onSearchChange: (event, dispatcher, hierarchy...) ->
    console.log "onSearchChange", dispatcher.value()

  onVideo: (event, dispatcher, hierarchy...) ->
    __.Article.Video.show event.entity

  # ============================================================================
  # Private methods
  # ============================================================================

new Atoms.Organism.Main()
