components {
  id: "script"
  component: "/game/levels/junction.script"
}
embedded_components {
  id: "co"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"control\"\n"
  "mask: \"player\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "  }\n"
  "  data: 8.0\n"
  "  data: 8.0\n"
  "  data: 10.0\n"
  "}\n"
  "event_collision: false\n"
  "event_contact: false\n"
  ""
}
embedded_components {
  id: "outline"
  type: "sprite"
  data: "default_animation: \"cursor\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "slice9 {\n"
  "  x: 6.0\n"
  "  y: 6.0\n"
  "  z: 6.0\n"
  "  w: 6.0\n"
  "}\n"
  "size {\n"
  "  x: 24.0\n"
  "  y: 24.0\n"
  "}\n"
  "size_mode: SIZE_MODE_MANUAL\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/game/core/game.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 0.1
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"up\"\n"
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
