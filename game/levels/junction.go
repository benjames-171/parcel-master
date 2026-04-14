components {
  id: "script"
  component: "/game/levels/junction.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"cursor\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/game/core/game.tilesource\"\n"
  "}\n"
  ""
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
  "event_collision: false\n"
  "event_contact: false\n"
  ""
}
