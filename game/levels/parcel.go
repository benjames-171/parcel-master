components {
  id: "script"
  component: "/game/levels/parcel.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"parcel-red\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/game/core/game.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 0.1
  }
}
