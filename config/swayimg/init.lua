local bg = 0x00000000

swayimg.enable_overlay(true)
swayimg.enable_antialiasing(true)

swayimg.imagelist.set_order("none")
swayimg.imagelist.enable_recursive(true)
swayimg.imagelist.enable_adjacent(true)

swayimg.viewer.set_window_background(bg)
swayimg.viewer.set_drag_button("MouseLeft")
swayimg.viewer.on_key("q", function() swayimg.exit() end)
swayimg.viewer.on_key("Delete", function()
  local image = swayimg.viewer.get_image()
  if image ~= nil then os.remove(image.path) end
end)
swayimg.viewer.on_key("Left", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("Right", function() swayimg.viewer.switch_image("next") end)

swayimg.gallery.set_window_color(bg)
swayimg.gallery.on_key("q", function() swayimg.exit() end)
