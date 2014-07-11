class Atoms.Organism.Video extends Atoms.Organism.Article

  @scaffold "assets/scaffold/video.json"

  constructor: ->
    super
    @bind "hide", @onHide

  # Instance events
  show: (@entity) =>
    do @render unless @el
    @info.video.refresh url: @entity.embed
    @info.field.title.el.html @entity.title
    @info.field.description.el.html @entity.description
    @info.field.tags.destroyChildren()
    @info.field.tags.appendChild "Atom.Label", value: "#{@entity.duration} minutes", style: "theme"
    @info.field.tags.appendChild "Atom.Label", value: "#{@entity.language}", style: "accept"
    @info.field.tags.appendChild "Atom.Label", value: tag for tag in @entity.tags
    Atoms.Url.path "video/info"

  onHide: ->
    @info.video.refresh url: undefined

new Atoms.Organism.Video()
