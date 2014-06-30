class Atoms.Organism.Main extends Atoms.Organism.Article

  @scaffold "assets/scaffold/main.json"

  constructor: ->
    super
    @bind "show", @onShow


  # Instance events
  onShow: ->
    # Your code...


  # Children bubble events
  onButtonTouch: (event, dispatcher, hierarchy...) ->
    # Your code...

  onNavigationSelect: (event, dispatcher, hierarchy...) ->
    # Your code...

  onSearchChange: (event, dispatcher, hierarchy...) ->
    # Your code...

  onVideo: (event, dispatcher, hierarchy...) ->
    # Your code...

new Atoms.Organism.Main()
