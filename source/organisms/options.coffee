class Atoms.Organism.Options extends Atoms.Organism.Aside

  @scaffold "assets/scaffold/options.json"

  # Bubble children events
  onContext: (event, link, hierarchy...) ->
    __.Article.Main.fetch link.attributes.explore, link.attributes.channel
    __.Article.Main.aside @attributes.id

new Atoms.Organism.Options()
