"use strict"

class __.Entity.Video extends Atoms.Class.Entity

  @fields "id", "title", "description", "image", "embed", "duration",
          "author", "language", "tags", "type", "level", "views",
          "created_at"

  parse: ->
    image       : @image
    text        : @title
    description : @tags[0] or ""
