class Atoms.Organism.Main extends Atoms.Organism.Article

  @scaffold "assets/scaffold/main.json"

  page:
    index : 0
    search: 0

  render: ->
    super
    do @fetch

  # Instance events
  fetch: (explore, channel) ->
    context = if @query then "search" else "index"
    background = true
    if explore isnt @explore or channel isnt @channel
      @explore = explore
      @channel = channel
      @page[context] = 0
      __.Entity.Video.destroyAll()
      background = false

    unless isNaN @page[context]
      @page[context]++
      @fetching = true
      parameters = page: @page[context], query: @query
      parameters.explore = explore if explore?
      parameters.channel = channel if channel?
      __.proxy("GET", context, parameters, background).then (error, response) =>
        unless response.videos.length is 0
          __.Entity.Video.create video for video in response.videos
        else
          @page[context] = undefined
        @fetching = false

  # Children bubble events
  onSearchChange: (event, dispatcher, hierarchy...) ->
    console.log "onSearchChange", dispatcher.value()

  onSectionScroll: (event) ->
    super
    @fetch @explore, @channel if event.percent > 90 and not @fetching

  onVideo: (event, dispatcher, hierarchy...) ->
    __.Article.Video.show event.entity

new Atoms.Organism.Main()
