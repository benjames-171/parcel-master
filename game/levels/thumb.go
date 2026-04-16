components {
  id: "script"
  component: "/game/levels/thumb.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"thumb-up\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/game/core/game.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 0.5
  }
}
