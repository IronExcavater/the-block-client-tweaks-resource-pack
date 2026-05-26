# AI Pixel Art Workflow

Goal: generate new 16x16 modded enchantment book textures and 9x9 tooltip
glyphs that match Re-covered enchantment books and Icons-Enchantments, using
the installed packs as style anchors.

---

## 1. Extract Reference Images

Run these commands to pull the key reference PNGs from their zips:

```powershell
# Re-covered enchantment book base textures
unzip -p "resourcepacks/Re-covered.zip" `
  "assets/carl/textures/item/fire_aspect.png" > refs/rc_fire_aspect.png
unzip -p "resourcepacks/Re-covered.zip" `
  "assets/carl/textures/item/efficiency.png" > refs/rc_efficiency.png

# Icons-Enchantments glyph sheet
unzip -p "resourcepacks/Icons - Enchantments v.1.2.zip" `
  "assets/icons/textures/tooltip/magic/enchantment.png" > refs/icons_enchantment_sheet.png
```

---

## 2. Prompt Strategy for Enchantment Books

Upload 2-3 Re-covered book textures and describe the target.

### Template prompt

```text
These are Minecraft pixel art enchanted book textures at 16x16 pixels from
the Re-covered resource pack. I need a NEW book for [ENCHANTMENT NAME] in the
same style:

- 16x16 pixels, transparent background
- same book silhouette, dark outline, page shading, and palette discipline
- low detail, readable at inventory scale
- unique center symbol: [DESCRIBE SYMBOL]
- no extra particles, no high-resolution detail, no vanilla enchantment copy

Output: a single PNG with transparent background, no upscaling, no anti-aliasing.
```

---

## 3. Prompt Strategy for Enchantment Glyphs

Upload the Icons-Enchantments sheet and zoom in on cells with similar shapes.

### Template prompt

```text
This is a Minecraft font/icon glyph sheet. Each cell is 9x9 pixels.
I need NEW 9x9 glyphs at the SAME scale and pixel density for these modded
enchantments:

Cell 0 - Veinminer: connected ore cluster.
Cell 1 - Fireproof: shielded flame or netherite ingot.
Cell 2 - Magnetic: horseshoe magnet.
Cell 3 - Smelting: ingot over flame.
Cell 4 - Chopper/Timber: axe and log rings.

Deliver as one PNG with transparent background. Match the anti-aliasing level
and colour depth of the reference sheet exactly.
```

---

## 4. Recommended AI Tools

| Tool              | Best for                         | Notes                              |
|-------------------|----------------------------------|------------------------------------|
| ChatGPT web       | Img2img style matching           | Upload references and final paths  |
| Claude/Codex      | Describing style, wiring files   | Use for JSON/model validation      |
| Stable Diffusion  | Img2img with reference           | Use pixel art LoRA + low CFG       |
| Aseprite          | Final pixel cleanup              | Required for exact readability     |

Best workflow for exact size control:

1. Generate large with the AI tool.
2. Import into Aseprite and scale down with nearest neighbour to 16x16 or 9x9.
3. Touch up manually; AI art always needs pixel cleanup.

---

## 5. Validating Output In-Game

1. Drop the PNG into the correct `assets/...textures/item/` or font path.
2. In-game: press F3+T to reload resource packs.
3. Check the item in inventory and tooltip hover.
4. For glyph cells: hover an enchanted item and check that the enchantment
   name includes the icon.

---

## 6. Reference File Inventory

| Pack                   | Key reference files                                   |
|------------------------|-------------------------------------------------------|
| Icons-Enchantments 1.2 | `assets/icons/textures/tooltip/magic/enchantment.png` |
| Re-covered             | `assets/carl/textures/item/*.png`                     |
| Blockheads             | `assets/blockheads/textures/item/enchantment_books/*.png` |
