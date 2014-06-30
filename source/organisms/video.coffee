class Atoms.Organism.Video extends Atoms.Organism.Article

  @scaffold "assets/scaffold/video.json"

  # Instance events
  show: (@entity) ->
    console.log @entity
    Atoms.Url.path "video/info"

new Atoms.Organism.Video()
