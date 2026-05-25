# AI Pixel Art Workflow

Goal: generate new 16×16 textures and 10×10 effect glyphs that match the
style of Xali's Potions + Icons-Effects using AI image generation, with
reference art from the installed packs as style anchors.

---

## 1. Extract Reference Images

Run these commands to pull the key reference PNGs from their zips:

```powershell
# Xali's Potions — sample bottles for style reference
unzip -p "resourcepacks/xali's potion v1.2.0.zip" `
  "assets/minecraft/textures/item/healing_potion.png" > refs/xali_healing.png
unzip -p "resourcepacks/xali's potion v1.2.0.zip" `
  "assets/minecraft/textures/item/regeneration_potion.png" > refs/xali_regen.png

# Icons-Effects — the 80x50 glyph sheet
unzip -p "resourcepacks/Icons - Effects v.1.2.zip" `
  "assets/icons/textures/tooltip/magic/effect.png" > refs/icons_effect_sheet.png

# Re-covered — enchantment book base textures
unzip -p "resourcepacks/Re-covered.zip" `
  "assets/carl/textures/item/fire_aspect.png" > refs/rc_fire_aspect.png
unzip -p "resourcepacks/Re-covered.zip" `
  "assets/carl/textures/item/efficiency.png" > refs/rc_efficiency.png
```

---

## 2. Prompt Strategy for Potion Bottles (16×16)

Upload 2-3 Xali sample bottles and describe the target.

### Template prompt
```
These are Minecraft pixel art potion bottle textures at 16×16 pixels from
the "Xali's Potions" resource pack (shown in images). I need a NEW bottle
for [EFFECT NAME] in the exact same style:

- 16×16 pixels, transparent background
- Rounded glass bottle silhouette, 2-pixel rim at top, cork or stopper
- Liquid fills roughly 60% of the bottle interior, colour = [HEX or name]
- 1-pixel specular highlight on upper-left of the glass
- Same muted, low-saturation palette as the reference
- Distinctive particle or motif floating in the liquid: [DESCRIBE MOTIF]

Output: a single PNG with transparent background, no upscaling, no anti-aliasing
```

Fill in:
| Drink         | Liquid colour | Motif description                        |
|---------------|---------------|------------------------------------------|
| apple_cider   | #C87020       | Small apple silhouette or foam bubbles   |
| melon_juice   | #30C850       | Melon triangle slice or seed dots        |
| bone_broth    | #C8A060       | Spiral steam wisp or bone fragment       |

---

## 3. Prompt Strategy for Effect Glyphs (10×10 per cell)

Upload the full Icons-Effects glyph sheet and zoom in on 2 known cells
(e.g. Absorption U+F0189, Regeneration U+F01A2).

### Template prompt
```
This is a Minecraft font/icon glyph sheet. Each cell is 10×10 pixels.
I need NEW 10×10 glyphs at the SAME scale and pixel density for these
Farmer's Delight mod effects, to fill cells 0 and 1 of a new 80×10 sheet:

Cell 0 — Nourishment: prevents hunger drain. Visual idea: wheat stalk or
  bread loaf silhouette, warm golden tones, matches the sheet's icon style.

Cell 1 — Comfort: natural regeneration when not full. Visual idea: heart
  with small leaf or soup bowl, soft green/red, matches the sheet's style.

Deliver as a single 80×10 PNG with cells 2-7 left transparent/empty.
Match the anti-aliasing level and colour depth of the reference sheet exactly.
```

---

## 4. Recommended AI Tools

| Tool              | Best for                         | Notes                              |
|-------------------|----------------------------------|------------------------------------|
| Claude (this chat)| Describing style, writing prompts| Can analyse reference images        |
| GPT-4o            | Img2img style matching           | Upload references, get close match |
| DALL-E 3          | Clean pixel art generation       | "pixel art, 16x16, no upscaling"   |
| Stable Diffusion  | img2img with reference           | Use pixel art LoRA + low CFG       |
| Midjourney        | Style ref via --sref             | `--sref [xali ref url] --ar 1:1`   |

**Best workflow for exact size control:**
1. Generate at 512×512 with any tool
2. Import into Aseprite → Image → Scale → 16×16, algorithm = Nearest Neighbour
3. Touch up manually — AI art always needs 5-10 minute pixel cleanup

---

## 5. Validating Output In-Game

1. Drop the new PNG into the correct `assets/...textures/item/` path
2. In-game: press F3+T to reload resource packs (no restart needed)
3. Check the item in inventory + tooltip hover
4. For glyph cells: hover any item that grants the modded effect and check
   the effect name in the tooltip includes the icon

---

## 6. Reference File Inventory

| Pack                   | Key reference files                                |
|------------------------|----------------------------------------------------|
| Xali's Potions 1.2.0   | `assets/minecraft/textures/item/*_potion.png`      |
| Icons-Effects 1.2      | `assets/icons/textures/tooltip/magic/effect.png`   |
| Icons-Enchantments 1.2 | `assets/icons/textures/tooltip/magic/enchantment.png` |
| Re-covered             | `assets/carl/textures/item/*.png`                  |
| Blockheads (this pack) | `assets/blockheads/textures/item/enchantment_books/*.png` |
