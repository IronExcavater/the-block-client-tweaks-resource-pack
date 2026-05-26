# Modded Texture Inventory

## Enchantment Books

| Game ID | File stem | Display | Meaning | Required resource-pack work |
| --- | --- | --- | --- | --- |
| veinminer_enchantment:veinminer | veinminer | Veinminer | Mines connected ore veins at once | ore cluster/cyan crack book + glyph + .desc |
| magnetic_enchantment:magnetic | magnetic | Magnetic | Collects nearby drops | red/blue U magnet book + glyph + .desc |
| smelting_enchantment:smelting | smelting | Smelting | Auto-smelts mined drops | pickaxe + hot ingot/flame book + glyph + .desc |
| netherited:fireproof | fireproof | Fireproof | Dropped item survives fire/lava | dark ingot/shield against flame book + glyph + .desc |
| fallingtree:chopper + variants | chopper | Chopper | Axes fell whole trees | axe + log book + glyph + .desc for each variant |
| timber_enchantment:timber | timber | Timber | Axes chop whole trees | axe + log/tree book + model/texture |
| nova_structures:aerials_bane | aerials_bane | Aerial's Bane | More damage to flying/airborne targets | wing/updraft target book + glyph + .desc |
| nova_structures:antidote | antidote | Antidote | Poison/Wither redirected into chestplate durability | protected chestplate + green cross book + glyph + .desc |
| nova_structures:conductivity_curse | conductivity_curse | Curse of Conductivity | Can attract lightning in storms | lightning rod/cursed bolt book + glyph + .desc |
| nova_structures:ghasted | ghasted | Ghasted | Crossbow bolts become ghast fireballs | ghast face/fireball book + glyph + .desc |
| nova_structures:gravity | gravity | Gravity | Bolts pull mobs to impact point | down arrow/gravity well book + glyph + .desc |
| nova_structures:hydro_veil | hydro_veil | Hydro Veil | Happy Ghast fire/explosion protection and healing | water droplet veil book + glyph + .desc |
| nova_structures:illagers_bane | illagers_bane | Illager's Bane | More damage to illagers/ravagers/vexes/witches | long-nosed illager head book + glyph + .desc |
| nova_structures:multishot | tri_shot | Tri-Shot | Fires three arrows | three-arrow book + glyph + .desc |
| nova_structures:outreach | outreach | Outreach | Longer block interaction reach | extended hand/arrow book + glyph + .desc |
| nova_structures:photosynthesis | photosynthesis | Photosynthesis | Repairs durability in light | sprout/sun book + glyph + .desc |
| nova_structures:piercing | blowthrough | Blowthrough | Arrows pass through targets | piercing arrow book + glyph + .desc |
| nova_structures:power | might | Might | More crossbow bolt damage | power chevron/bolt book + glyph + .desc |
| nova_structures:spiteful | spiteful | Spiteful | Low-health retaliation / Strength on hit | red anger/retaliation mark book + glyph + .desc |
| nova_structures:swift_soar | swift_soar | Swift Soar | Happy Ghast flies faster while rider sprints | swift wing book + glyph + .desc |
| nova_structures:traveler | traveler | Traveler | Sprint speed and step height for boot durability | boot/step book + glyph + .desc |
| nova_structures:wax_wings | wax_wings | Wax Wings | Elytra durability protection, higher boost drain | wax wing book + glyph + .desc |
| nova_structures:wither_coated | wither_coated | Wither Coated | Applies Wither to targets | dark coated blade book + glyph + .desc |

## Modded Potions And Effects

| Potion IDs | File stem | Effect display | Required resource-pack work |
| --- | --- | --- | --- |
| illagerinvasion:berserking / long_berserking / strong_berserking | berserking | Berserking | normal/splash/lingering textures and models, strength-like red Xali bottle, effect glyph, .desc |
| rusticdelight:haste / long_haste / strong_haste | haste | Haste | normal/splash/lingering textures and models, gold speed/spark Xali bottle, effect glyph, .desc |
| friendsandfoes:reaching / long_reaching / strong_reaching | reaching | Reach/Reaching | normal/splash/lingering textures and models, green reach Xali bottle, effect glyph, .desc |
| glow_up:revealing / revealing_long / revealing_strong | revealing | Revealing | normal/splash/lingering textures and models, blue eye Xali bottle, effect glyph, .desc |

## Shared Text/Font Requirements

- `assets/minecraft/items/enchanted_book.json` must select every modded enchantment level and point to `blockheads:item/enchantment_books/<file stem>`.
- `assets/minecraft/items/potion.json`, `splash_potion.json`, and `lingering_potion.json` must contain only modded potion cases; vanilla potions must fall back to Minecraft/Xali handling.
- `assets/minecraft/font/default.json` should include `blockheads:include/enchantments_modded` and `blockheads:include/effects_modded`.
- Enchantment Insights reads `enchantment.<id>.desc`; Effect Insights reads `effect.<id>.desc`, so every supported entry needs a concise `.desc` key.
- The real game IDs can still include `nova_structures:`; only local model/texture filenames should omit the old `nova_` prefix.
