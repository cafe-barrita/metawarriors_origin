# Metawarriors: Origin

Metawarriors: Origin is a project for a Godot implementation of a turn based RPG based on the ATB system mixing in elements from SRPGs such as positioning and MMORPGS such as casting time and cooldown. 

## Setting

The Phoebus empire is an interstellar civilization that has colonized dozens of worlds.

They found large quantities of the mineral mithrium in the planet Gemalba, but the planet was too cold and the soil too hard for standard terraforming procedures. The Seekers of Light, main source of technological innovation on the empire, had given up on the planet. But the young Genoma Institute came up with an idea.

They inoculated the plants and animals sent to terraform the planet with a retrovirus known as "mutagen". The mutagen allowed the infected beings to change their dna at abnormal speed to adapt to the harsh environment.

At first the terraforming process seemed to work, but the first settlers observed with horror that predators absorved mutagen from its prey and evolved faster. Soon creating a world full of superpredators.

Far away from civilization and with barely any weapons, the settlers eventually resorted to infect themselves with controlled dosis of the mutagen to develop powers to combat the ravenous creatures.

The militia of mutated humans that hunted the beasts came to be known as the cleansers.

### Geography

The world of Gemalba is divided in 5 continental plates, two of those are connected by a thick ice bridge.

The central continent covers most of the surface of the center slightly north-west of the planet. It's the most densely populated area in the world (which isn't saying much). It is a very mountanous region divided into four by geographical accidents:
* The original landing site covers most terrain of the regions at the center and north of the continet. It limits with the White System to the west and the Red Lake and Saurus River to the South. It contains farmlands, the Cleanser Academy and the capital city of Leukopolis.
* The southwest covers the surface between the Red Lake, Saurus River and the oceans coast. It is the warmest location of the world and contains the port city of Neaporte.
* The south of the western peninsula at the other side of the white system is where most of the mining facilities and mithril refinement factories are located. There are very few rural areas and the remaining mutated predators do not dare attack the cities.
* The northernmost part of the western peninsula is an uncharted land with no human settlers and full of mutated creatures yet to be discovered.

The Wildlands is the easternmost continent. It is a dangerous place with a few human settlers to the south and mostly uncharted territory infested with mutated creatures. It is widely considered the most dangerous part of the world. There is a continental fall to the west of the continent and a variety of volcanic islands.

The southern pole consists of two continental plates bridged together by ice. The harsh enviroment means that not many creatures live here but there are some forests and human settlements in the northwest where the cold is still bearable. There are geysers that randomly erupt in the ice bridge between plates.

The north pole is considered a cursed land. Human settlements are limited to a Cleansers Headquarter and a research center. Barely any animals live here and those that do aren't as aggresive as their counterparts from warmer environments.

### Politics

The world governance is divided in 5 sectors: Central, Western Eastern, Southern and Northern.

The Central Sector is ruled by the Viceroy and an elected parlamentary chamber. Perception of the cleansers in this sector is mixed, they are appreciated in rural areas but mostly looked down in big cities that haven't seen an attack of mutated beasts in decades.

The Western, Eastern and Southern Sectors are ruled by a governor and mancommunities composed of town representatives. The Western Sector is where Cleansers are most denosted, while the Eastern Sector (commonly refered to as the Wildlands, where attacks are a daily occurence) considers the members of the militia heroes. Perception in the Southern Sector is mostly positive.

The Northern Sector has no citizens and no form of government body. THe commanerd of the Cleansers' Northern Headquarter is the closest thing to a figure of authority.

Imperial officials struggle to meet quotas of mithril shipments to the empire. This creates a dependency of the cleansers to remove dangerous creatures from mining sites that they hate. Wherever they can afford it, they start smearment campaigns against the militians. Viceroys have kept a special unit of mutated soldiers known as the Varangian Guard in fear of a Cleanser Revolt.

Seekers of Light are the main source of scientist, engineers and preachers of the world. They detest this world and consider its terraforming something akin to a sin, but they would do everything in their hands to help the average citizen. They despise the Genoma Institute but have lost track of them and believe them extinct.

The Genoma Institute hid under the Cleanser umbrella to avoid the lashback against the erraforming fiasco. Their knowledge allowed the Cleansers to collect and inject mutagen without imperial supervision. Unlucky for them, they were sent in bulk to the research center of the Northern Sector.

The Cleansers have low survival rates but those who come back from multiple hunting campaigns, become inhumanly strong due to mutagen absortion and mutation. THis scared the Viceroy of the time, who forced the creation of an organization of a headquarter and a commander per sector, as well as an academy where the most experienced Cleansers teach the new recruits. This mantains the most dangerous militians from absorving more mutagen and becoming even stronger. The Cleanser chain of command walks a fine line between cooperating with imperial officials and eliminating mutated creatures at their own discretion.

## Graphics

### Animation

## Sound

### Soundtrack

The game will make use of versions of existing music without active intellectual property (mostly classical music).

### Voices (WIP)

I would like to have voice over, but it would require a lot of effort. A more simple option would be to use blips that change between characters and tone in a Golden Sun fashion.

## Playability

The game will play like a classic turn-based RPG (world map, dungeons, cities, etc.) with some elements of cRPGs and SRPGs added to combat and NPC interaction, and a little bit fo platforming.

### Exploration

The game will follow a hybrid approach between linear and open world, where big areas will become available as the story progresses until the whole world can be freely explored.

Puzzles will be a big part of exploration. Mostly moving objects around the scene to have a platform to jump and reach certain areas. Chests with supplies and weapons left by Cleansers will act as rewards for completing these puzzles. To solve puzzles the posibility of shooting heat to melt ice or create explotions, as well as freeze running water will be acquired with certain characters.

To avoid players getting stuck, a ssytem of hints will be implemented. These hints will not solve the puzzle but provide (hopefully) useful information to do so. The hints will not appear inmediatly,but randomly if the player spends too much time near puzzle solving elements.

Enemy mobs will be pseudo-randomly generated on scene load and will roam freely. If you enter their field of vision, they will randomly become scared or attack. If you sneak them from behind, they may randomly hear you and try to turn around. Upon collision, combat will start. If you sneak on them you will perform a surpirse attack, if they sneak or catch you from behind you will get ambushed.

Party stats will affect exploration. The total amount of power of the party will affect the strength applied when pushing objects (some will require a minimum to even move) and will increase the posibility of mobs becoming scared of you. Mind will increase the posibility of sneaking on enemies and will reduce the time to display hints.

### Combat

### Interaction with NPCs

## Playable characters

Lucio is the main character and the Point of View for the player. He will be the one exploring and interacting with NPCs. The rest of the playable characters will join the party as the story progresses. Up to 4 characters can fight during combat, and they can be switched around in the menu at any point outside of combat. Those characters will also determine the power and mind used during exploration and interacting with NPCs.

All characters have a character progression graph made of hexagonal nodes conected to each other. Upon leveling up, the character will gain mutagen that can be used to activate a node as long as at least one adyacent node is already active. Each character will start with four active nodes, using a nanite charge can reset the progression to those four nodes and gain all the mutagen used to activate the rest. Each node provides a different effect it may be:
* An stat percentual increase.
* A regular skill that consumes energy.
* A passive skill that is always active or triggers under conditions outside of the player control (such as counterattacks).
* The posibility to equip additional types of weapons or armor.

Besides their regular skills, all characters have an special ability in combat. These abilities may grant an aditional resource and a different set of skills that consume said resources. Some abilities also give aditional skills that consume energy like the regular ones. All of the previously mentioned skills will be aquired through story progression or exploration instead of customizable character progression like regular skills.

All characters also have alternative outfits that are re-skins of their original one. This means that clothes will change colour but hair and skin reamin exactly the same (only the colour of the clothes will change, the shape will be exactly the same). These alternative outfits can be found through exploration.

### Lucio "Brightblade"

A young cleanser coming from the Wildlands. He lost both of his parents to mutated creatures as a baby and grew in an orphanage. The lost of his parents and growing up in the most dangerous part of the world is what caused him to look up to the cleansers and becoming one himself. He is moody and prone to anger, but has a sense of community and takes care of those closest to him. Brightblade is not his actual name, but a nickname given by those who saw how his power worked.

He starts with mastery of light swords and can gain the ability to wield heavy swords as well as dual wielding of his starting weapons through character progression. Light swords allow him to attack faster, heavy swords hit harder with higher cooldown, and dual wielding duplicate the weapon buffs. He can equip medium armor at the begining and heavy armor through character progression.

His mutation allows him to charge bioelectrical energy into objects, mostly his weapons. This combines his physical attacks with mind-based electrical and psychic power. He also has the power to increase the resistance of the team, drive attention of enemies to himself and heal allies.

Lucio is weel suited to be a tank, a hybrid physical-ranged DPS or a healer. Character progression will determine his strongest points.

His special skills allow him to absorb ambient energy to deliver devastating attacks. In combat it will be reperesented as an icon to the right of his health and energy bars with a circular atb-like bar that starts empty every battle and increases whenever a character uses energy. It will fill with 5 times the maximum energy of Lucio. Enviroment skills will consume a percentage of the ambient energy bar and can use casting time to consume even more and increase their power output. These outputs will be tied to the amount of energy required to fill the percentage of the bar and not the percentage itself.

His mutation manifests in red eyes and three red lines that go from right below his eyes to the side of his head. The lines make a right angle turn and the more to the side of the head they are the lower they get (so they all have the same length), this causes the lines to form "squares" on Lucio's cheeks.

Besides the red eyes and pigment lines on his cheeks, he has messy light brown hair, somewhat fair skin and his standard outfits consists on: a red turtleneck, dark green fingerless gloves, dark green long trousers, brown boots with burgundy shoelaces and a long grey overcoat with a big, white symbol of the cleansers on the back.

Alternative outfits:
* Reversed: grey gloves and trouser, green turtleneck, dark green shoelaces and red overcoat with a grey symbol of the cleansers.
* Dark Avenger: burgundy gloves, burgundy boots with black shoelaces, red turtleneck and trousers, and a black overcoat with a white cleanser symbol.
* Crimson Avenger: black gloves, black boots with burgundy shoelaces, black turtleneck and trousers, and red overcoat with a black symbol of the cleansers.
* Green Guardian: red turtleneck, burgundy gloves and boots, brown trousers and shoelaces and a green overcoat with a white cleanser symbol.
* Ocre Guardian: red turtleneck, dark green gloves and trousers, ocre boots with dark green sholaces and an ocre overcoat with a white symbol of the cleansers.
* Crimson Guardian: green turtleneck, ocre gloves and trousers,  brown boots with burgundy sholaces and a red overcoat with an ocre cleanser symbol.
* Green Defender
* Ocre Defender
* Crimson Defender

### Bianca Foresta

A young cleanser from the Southern sector. Heir to the biggest Woodsteel production chain, she always felt ashamed and ostracized because of her wealthy background. In an attempt to "give back to the people", she joins the cleansers. But she is marginalized but the in-training recruits at the academy as well and gets lost on a forest after running away. After being rescued by Lucio, she develops a strong attachment to him, and eventually, to the rest of the party.

She starts with mastery of staffs (that are usually injectors of some chemical substance) and can use tranquilizer guns through character progression. These ones are slower but allow her to safely attack from a distance. She can equip light armor.

Her mutation allows to generate chemical substances. These substances can either be beneficial for her allies or harmful for her enemies.

Bianca can either be a healer, a ranged DPS that makes use of the variety of damage types she has available, or a debuffer that applies altered status and reduces enemy power.Character progression will determine her strongest points.

Her special skill consists of using residues of chemicals generated by previous abilities to power a different set of skills. IT will visually manifest as four colour-specific counters to the right of her health and energy bars. Each battle the counters start at 0 and normal skills increase certain colour counters, then her second set of skills consume an specific amount of each colour/residue counter.

Her mutation physically manifests in deep green hair and lighter green marks between her eyes and her nose that make her look a little bit reptilian.

She has green eyes, green hair and fair skin. In her standard outfit she has her hair pulled by a silver hairband with a small white symbol of the cleansers, she also wears a long cream-colored coat, dark green tight trousers, brown elegant gloves and  brown women's ankle boots.

Alternative outfits:
* Reversed
* Widow
* Pink flower
* White flower

### TODO thief

### TODO wizard

Veteran cleanser that currently works teaching cadets at the Central sector Academy.

TODO

Alternative outfits:
* Reversed
* Sorcerer
* Druid
* Cleric
* Warlock
* Necromancer

### Thaddeus "Thad" Dragosi

An experienced cleanser from the Western sector. Second son of a wealthy family owners of a mithril refinement factory, he craved adventure from a very young age. Something that eventually led him to join the cleansers. TODO

TODO

His special skill is "rage". The more enraged Thad becomes, the more damage he inflicts but the damage he takes also increases. Ideally, one would reduce its rage before oponents turn to reduce the amount of damage taken and release the accumulated rage to maximize Thad's damage output. It will be visually represented by an icon an atb-like circular bar. The rage bar will start at 50% every battle and that will be the neutral reference for the damage boost (at 50%, Thad deals and receives normal damage, below that there will be a damage penalty, above, a boost). The rage bar will increase through receiving damage and using special abilities and can be reduced by inflicting damage or using other special abilities that will consume rage instead of energy.

TODO

### Wayne Westwood

An old guide and hunter of the Wildlands.

### TODO druid/kirin

## Hoverbike Jousts

### Customization

### Tournaments

### Special models
