# Modded Potions & Effects — Art Targets

Pack format: 84 (MC 26.1.2)

---

## Farmer's Delight Drinks (texture overrides)

These placeholder textures exist at `assets/farmersdelight/textures/item/`.
FD already uses `minecraft:item/generated` models, so replacing the PNG
is all that's needed — no model override required.

| File              | Item ID                     | Style goal                           |
|-------------------|-----------------------------|--------------------------------------|
| apple_cider.png   | farmersdelight:apple_cider  | Amber/orange Xali bottle, apple motif|
| melon_juice.png   | farmersdelight:melon_juice  | Green Xali bottle, melon slice motif |
| bone_broth.png    | farmersdelight:bone_broth   | Tan/beige Xali bottle, swirl motif   |

All three should follow Xali's style:
- 16×16 pixels
- Rounded bottle shape, not a bowl
- Distinct liquid colour visible through glass
- Single-pixel highlight on the upper-left of the bottle

---

## Modded Effect Glyphs

Glyph sheet: `assets/blockheads/textures/tooltip/magic/effects_modded.png`
Sheet size: **80×10 px** — 8 cells of 10×10 each (cells 2–7 reserved)

| Cell index | Codepoint (JSON)     | Effect key                       | Assigned |
|------------|----------------------|----------------------------------|----------|
| 0          | `󸠀`       | effect.farmersdelight.nourishment | ✓ TODO  |
| 1          | `󸠁`       | effect.farmersdelight.comfort     | ✓ TODO  |
| 2–7        | `󸠂`–`07`  | (reserved for future mods)        | empty   |

Lang overrides are in `assets/minecraft/lang/en_us.json` — already wired up.
Just replace the placeholder PNG with real 10×10 per-cell art.

Reference: match the pixel density and colour-coding style of
`Icons - Effects v.1.2 → assets/icons/textures/tooltip/magic/effect.png`

---

## Enchantment Books Still Needed

| Book       | Mod key                      | Texture path                                        | Status  |
|------------|------------------------------|-----------------------------------------------------|---------|
| Fireproof  | netherited:fireproof         | assets/blockheads/textures/item/enchantment_books/  | TODO    |
| Timber     | timber_enchantment:timber    | assets/blockheads/textures/item/enchantment_books/  | TODO    |

Both model JSON files exist and are wired into enchanted_book.json.
Only the 16×16 texture PNG needs painting.

Design notes:
- **Fireproof**: Fire Protection style base + dark netherite/charcoal core;
  charcoal pages, orange flame outline, purple netherite highlight
- **Timber**: Sweeping Edge / Efficiency base + axe + log cross-section rings;
  bark brown pages, tan rings, steel-grey axe edge

---

## AI Pixel Art — see parent _docs/ folder for the AI workflow guide
