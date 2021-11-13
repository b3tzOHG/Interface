local addonName, addon = ...

local spellcache = setmetatable({}, {__index=function(t,v)
    local a = {GetSpellInfo(v)}
    if (GetSpellInfo(v)) then
        t[v] = a
    end

    return a
end})

local function GetSpellInfo(a)
    return unpack(spellcache[a])
end
    -- instance name and the instance ID,
    -- find out the instance ID by typing this in the chat "/run print(select(8, GetInstanceInfo()))"
	-- or find them on https://wow.gamepedia.com/InstanceMapID
    -- Note: Just must be in this instance, when you run the script above 
	
local L = {
	-- BfA Raids
	['Uldir'] = 1861, 
	['BFD'] = 2070, 
	['CoS'] = 2096, 
	['EP'] = 2164, 
	['Nyalotha'] = 2217, 
	
	-- BfA Dungeons
	['Atal'] = 1763, 
	['Freehold'] = 1754, 
	['Kings'] = 1762, 
	['Shrine'] = 1864, 
	['Boralus'] = 1822, 
	['Sethraliss'] = 1877, 
	['Motherlode'] = 1594, 
	['Underrot'] = 1841, 
	['Dagor'] = 1771, 
	['Waycrest'] = 1862, 
	
	-- Shadowlands Raid
	['Nathria'] = 2296,
	['SoD'] = 2450, 
	
	-- Shadowlands Dungeons
	['DeOtherSide'] = 2291,
	['HallsOfAtonement'] = 2287,
	['MistsOfTirna'] = 2290,
	['Plaguefall'] = 2289, 
	['SanguineDepths'] = 2083,
	['SpiresOfAscension'] = 2285,
	['NecroticWake'] = 2286, 
	['TheaterOfPain'] = 2293,
	
}


auras = {
	debuffs = {
		[GetSpellInfo(233375)] = false, -- Gaze of Aman'thul
		[GetSpellInfo(218888)] = true, -- Impish Flames
		[GetSpellInfo(217925)] = true, -- Icy Comet
		[GetSpellInfo(217966)] = true, --Howling Gale
		[GetSpellInfo(218012)] = true, --Arcanopulse
		[GetSpellInfo(219602)] = true, --Snow Plow
		[GetSpellInfo(223373)] = true, --Yaksam
		[GetSpellInfo(223355)] = true, --Oozing Bile
		[GetSpellInfo(216430)] = true, --Earthshake Stomp
		[GetSpellInfo(216467)] = true, --Make the Snow
		[GetSpellInfo(216822)] = true, --You Go Bang!
		[GetSpellInfo(170196)] = true, --Rending Whirl
		[GetSpellInfo(217362)] = true, --Turbulent Vortex
		[GetSpellInfo(219349)] = true, --Corroding Spray
		[GetSpellInfo(212867)] = true, --Electrical Storm
		[GetSpellInfo(212852)] = true, --Storm Breath
		[GetSpellInfo(215876)] = true, --Burning Earth
		[GetSpellInfo(216044)] = true, --Cry of the Tormented
		[GetSpellInfo(213665)] = true, --Marauding Mists
		[GetSpellInfo(209858)] = true, --necrotic
		[GetSpellInfo(221772)] = true, --
		[GetSpellInfo(58517)] = true, -- Grievous Wound
		[GetSpellInfo(6788)] = false, -- PW: Shield
		[GetSpellInfo(243237)] = true, -- Grievous Wound
		
		-- PVP DEBUFFS
		[GetSpellInfo(323673)] = true, -- Mindgames
		[GetSpellInfo(316099)] = true, -- unstable affliction
		[GetSpellInfo(8122)] = true, -- Psychic Scream
		[GetSpellInfo(118699)] = true, -- Fear
		[GetSpellInfo(5484)] = true, -- Howl of Terror
		[GetSpellInfo(122)] = true, -- Frost Nova
		[GetSpellInfo(33395)] = true, -- Freeze
		[GetSpellInfo(157997)] = true, -- Ice Nova
		[GetSpellInfo(61721)] = true, -- Rabbit (Poly)
		[GetSpellInfo(61305)] = true, -- Black Cat (Poly)
		[GetSpellInfo(28272)] = true, -- Pig (Poly)
		[GetSpellInfo(28271)] = true, -- Turtle (Poly)
		[GetSpellInfo(126819)] = true, -- Porcupine (Poly)
		[GetSpellInfo(161354)] = true, -- Monkey (Poly)
		[GetSpellInfo(161353)] = true, -- Polar bear (Poly)
		[GetSpellInfo(118)] = true, -- Polymorph
		[GetSpellInfo(339)] = true, -- Entangling Roots
		[GetSpellInfo(33786)] = true, -- Cyclone
		[GetSpellInfo(853)] = true, -- Hammer of Justice
		[GetSpellInfo(20066)] = true, -- Repentance
		[GetSpellInfo(105421)] = true, -- Blinding Light
		[GetSpellInfo(200196)] = true, -- Holy Word: Chastise
		[GetSpellInfo(200200)] = true, -- Holy Word: Chastise
		[GetSpellInfo(226943)] = true, -- Mind Bomb
		[GetSpellInfo(605)] = true, -- Mind Control
		[GetSpellInfo(408)] = true, -- Kidney Shot
		[GetSpellInfo(2094)] = true, -- Blind
		[GetSpellInfo(6770)] = true, -- Sap
		[GetSpellInfo(64695)] = true, -- Earthgrab
		[GetSpellInfo(5246)] = true, --Intimidating Shout
		[GetSpellInfo(221527)] = true, --Imprison
	},
	instances = {
	[L['SoD']] = {
		-- The Tarragrue
		[GetSpellInfo(347668)] = true,  -- Grasp of Death
		[GetSpellInfo(347269)] = true,  -- Chains of Eternity
		-- The Nine
		[GetSpellInfo(351399)] = true,  -- Fragments of Destiny
		-- Remnant of Nerzhul
		[GetSpellInfo(350388)] = true,  -- Sorrowful Procession
		-- Soulrender Dormazain
		[GetSpellInfo(353429)] = true,  -- Tormented
		-- Painsmith Raznal
		[GetSpellInfo(355506)] = true,  -- Shadowsteel Chains
		-- Guardian of the First Ones
		[GetSpellInfo(350496)] = true,  -- Threat Neutralization
		-- Fatescribe Roh-Kalo
		[GetSpellInfo(350568)] = true,  -- Call of Eternity
		-- Kel'thuzad
		[GetSpellInfo(357298)] = true,  -- Frozen Binds
		-- Sylvanas Windrunner
		[GetSpellInfo(347670)] = true,  -- Shadow Dagger
		[GetSpellInfo(351117)] = true,  -- Dispel P2 Silvi
		[GetSpellInfo(353929)] = true,  -- Dispel P3 Silvi
		353929
	},
	
	[L['Nathria']] = {
		--Shriekwing
		[GetSpellInfo(340324)] = true,  --sanguine-ichor
		[GetSpellInfo(328897)] = true,  --exsanguinated
		[GetSpellInfo(345397)] = true,  --wave-of-blood
		[GetSpellInfo(328921)] = true,  --blood-shroud
		[GetSpellInfo(341489)] = true,  --bloodlight
		[GetSpellInfo(343365)] = true,  --ravenous-horrors
		--Huntsman Altimor
		[GetSpellInfo(335114)] = true,  --sinseeker
		[GetSpellInfo(334971)] = true,  --jagged-claws
		[GetSpellInfo(334939)] = true,  --vicious-lunge
		[GetSpellInfo(334708)] = true,  --deathly-roar
		[GetSpellInfo(334852)] = true,  --petrifying-howl
		[GetSpellInfo(334893)] = true,  --stone-shards
		[GetSpellInfo(334960)] = true,  --vicious-wound
		--Sun King
		[GetSpellInfo(325442)] = true,  --vanquished
		[GetSpellInfo(341473)] = true,  --crimson-flurry
		[GetSpellInfo(333002)] = true,  --vulgar-brand
		[GetSpellInfo(325665)] = true,  --soul-infusion
		[GetSpellInfo(326456)] = true,  --burning-remnants
		[GetSpellInfo(325877)] = true,  --ember-blast
		[GetSpellInfo(339251)] = true,  --drained-soul
		[GetSpellInfo(328579)] = true,  --smoldering-remnants
		[GetSpellInfo(326430)] = true,  --lingering-embers
		[GetSpellInfo(326078)] = true,  --infusers-boon
		--Artificer Xy'mox
		[GetSpellInfo(328437)] = true,  --dimensional-tear
		[GetSpellInfo(325361)] = true,  --glyph-of-destruction
		[GetSpellInfo(340860)] = true,  --withering-touch
		[GetSpellInfo(340870)] = true,  --aura-of-dread
		[GetSpellInfo(340533)] = true,  --arcane-vulnerability
		[GetSpellInfo(327414)] = true,  --possession
		[GetSpellInfo(326271)] = true,  --stasis-trap
		--Hungering Destroyer
		[GetSpellInfo(329298)] = true,  --gluttonous-miasma
		[GetSpellInfo(332295)] = true,  --growing-hunger
		[GetSpellInfo(334266)] = true,  --volatile-ejection
		[GetSpellInfo(334522)] = true,  --consume
		[GetSpellInfo(334755)] = true,  --essence-sap
		--Lady Inerva Darkvein
		[GetSpellInfo(325184)] = false,  --loose-anima
		[GetSpellInfo(325379)] = true,  --expose-desires
		[GetSpellInfo(325382)] = true,  --warped-desires
		[GetSpellInfo(325908)] = true,  --shared-cognition
		[GetSpellInfo(63849)] = true,  --exposed-heart
		[GetSpellInfo(325769)] = true,  --bottled-anima
		[GetSpellInfo(325718)] = true,  --lingering-anima
		[GetSpellInfo(331527)] = true,  --indemnification
		[GetSpellInfo(324983)] = true,  --shared-suffering
		[GetSpellInfo(331573)] = true,  --unconscionable-guilt
		[GetSpellInfo(342321)] = true,  --concentrated-anima
		[GetSpellInfo(341746)] = true,  --rooted-in-anima
		--Council of Blood
		[GetSpellInfo(340612)] = true,  --party-foul
		[GetSpellInfo(327773)] = true,  --drain-essence
		[GetSpellInfo(346681)] = true,  --soul-spikes
		[GetSpellInfo(346690)] = true,  --duelists-riposte
		[GetSpellInfo(327619)] = true,  --waltz-of-blood
		[GetSpellInfo(330848)] = true,  --wrong-moves
		[GetSpellInfo(334909)] = false,  --oppressive-atmosphere
		[GetSpellInfo(337110)] = true,  --dreadbolt-volley
		[GetSpellInfo(327503)] = true,  --evasive-lunge
		[GetSpellInfo(346945)] = true,  --manifest-pain
		[GetSpellInfo(346932)] = true,  --two-left-feet
		[GetSpellInfo(347350)] = true,  --dancing-fever
		--Sludgefist
		[GetSpellInfo(335300)] = true,  --chain-link
		[GetSpellInfo(331209)] = true,  --hateful-gaze
		[GetSpellInfo(332572)] = true,  --falling-rubble
		[GetSpellInfo(335295)] = true,  --shattering-chain
		[GetSpellInfo(332197)] = true,  --collapsing-foundation
		[GetSpellInfo(332443)] = true,  --crumbling-foundation
		[GetSpellInfo(335354)] = true,  --chain-slam
		[GetSpellInfo(339189)] = true,  --chain-bleed
		--Stone Legion Generals
		[GetSpellInfo(343881)] = true,  --serrated-tear
		[GetSpellInfo(334771)] = true,  --heart-hemorrhage
		[GetSpellInfo(334765)] = true,  --heart-rend
		[GetSpellInfo(342425)] = true,  --stone-fist
		[GetSpellInfo(343063)] = true,  --stone-spike
		[GetSpellInfo(333913)] = true,  --wicked-laceration
		[GetSpellInfo(339693)] = true,  --crystalline-burst
		[GetSpellInfo(339690)] = true,  --crystalize
		[GetSpellInfo(343898)] = true,  --soultaint-effigy
		--Sire Denathrius
		[GetSpellInfo(327992)] = true,  --desolation
		[GetSpellInfo(326699)] = true,  --burden-of-sin
		[GetSpellInfo(328276)] = true,  --march-of-the-penitent
		[GetSpellInfo(330580)] = true,  --bloodbound
		[GetSpellInfo(329875)] = true,  --carnage
		[GetSpellInfo(329974)] = true,  --impale
		[GetSpellInfo(329181)] = true,  --wracking-pain
		[GetSpellInfo(332585)] = true,  --scorn
		[GetSpellInfo(332797)] = true,  --fatal-finesse
		[GetSpellInfo(327089)] = true,  --feeding-time
		[GetSpellInfo(327796)] = true,  --night-hunter
		[GetSpellInfo(327842)] = true,  --touch-of-the-night
		[GetSpellInfo(335873)] = true,  --rancor
		[GetSpellInfo(338683)] = true,  --nathrian-hymn-sinsear
		[GetSpellInfo(338685)] = true,  --nathrian-hymn-evershade
		[GetSpellInfo(338686)] = true,  --nathrian-hymn-duskhollow
		[GetSpellInfo(338688)] = true,  --nathrian-hymn-gloomveil
		[GetSpellInfo(341366)] = true,  --hollow-grasp	
	},
	
	[L['DeOtherSide']] = {
		--Hakkar
		[GetSpellInfo(322746)] = true,  -- Sangre corrupta
		[GetSpellInfo(323569)] = true,  -- Esencia derramada

		--Manastorms
		[GetSpellInfo(320147)] = true,  -- Sangrado
		[GetSpellInfo(320008)] = true,  -- Descarga de Escarcha
		[GetSpellInfo(320144)] = true,  -- Sierra circular

		--Dealer Xy'exa
		[GetSpellInfo(321948)] = true,  -- Artilugio explosivo localizado
		[GetSpellInfo(320232)] = true,  -- Artilugio explosivo

		--Mue'zala
		[GetSpellInfo(325725)] = true,  -- Artificio cósmico
		[GetSpellInfo(327649)] = true,  -- Alma aplastada
		[GetSpellInfo(334913)] = true,  -- Maestro de la muerte

		--Trash
		[GetSpellInfo(333250)] = true,  -- Atracador
		[GetSpellInfo(333711)] = true,  -- Mordedura decrépita
		[GetSpellInfo(331847)] = true,  -- 6U4U
		[GetSpellInfo(331379)] = true,  -- Lubricar
		[GetSpellInfo(331008)] = true,  -- Muy pegajoso
		[GetSpellInfo(1604)] = true,  -- Atontado
		[GetSpellInfo(328987)] = true,  -- Ferviente
		[GetSpellInfo(332707)] = true,  -- Palabra de las Sombras: dolor
		[GetSpellInfo(332332)] = true,  -- Esencia derramada
		[GetSpellInfo(332605)] = true,  -- Maleficio
		[GetSpellInfo(332678)] = true,  -- Herida sangrante
		[GetSpellInfo(334493)] = true,  -- Polvo de centella soporífero
		[GetSpellInfo(334535)] = true,  -- Corte de pico
	},
	[L['HallsOfAtonement']] = {
		--Halkias
		[GetSpellInfo(323001)] = true,  -- Fragmentos de cristal
		[GetSpellInfo(322977)] = true,  -- Visiones de luz de pecado

		--Echelon
		[GetSpellInfo(319703)] = true,  -- Torrente de sangre
		[GetSpellInfo(319603)] = true,  -- Maldición de piedra
		[GetSpellInfo(344874)] = true,  -- Destrozado

		--Aleez
		[GetSpellInfo(323650)] = true,  -- Fijación inquietante

		--Lord Chamberlain
		[GetSpellInfo(323437)] = true,  -- Estigma de orgullo
		[GetSpellInfo(335338)] = true,  -- Ritual de tragedia

		--Trash
		[GetSpellInfo(325876)] = true,  -- Maldición de desintegración
		[GetSpellInfo(344993)] = true,  -- Barrido serrado
		[GetSpellInfo(326632)] = true,  -- Venas pétreas
		[GetSpellInfo(326638)] = true,  -- Tirar guja
		[GetSpellInfo(326617)] = true,  -- Convertir en piedra
		[GetSpellInfo(325700)] = true,  -- Recoger pecados
		[GetSpellInfo(325701)] = true,  -- Succionar vida
		[GetSpellInfo(326891)] = true,  -- Angustia
		[GetSpellInfo(326874)] = true,  -- Mordiscos en el tobillo
	},
	[L['MistsOfTirna']] = {
		--Ingra
		[GetSpellInfo(323250)] = true,  -- Charco de ánima
		--Mistcaller
		[GetSpellInfo(321828)] = true,  -- Palmas palmitas
		--Tred'ova
		[GetSpellInfo(322648)] = true,  -- Vínculo mental
		--Trash
		[GetSpellInfo(322486)] = true,  -- Sobrecrecimiento
		[GetSpellInfo(322939)] = true,  -- Cosechar esencia
		[GetSpellInfo(323043)] = true,  -- Flebotomía
		[GetSpellInfo(322487)] = true,  -- Sobrecrecimiento
		[GetSpellInfo(322968)] = true,  -- Aliento moribundo
		[GetSpellInfo(322557)] = true,  -- División de alma
		[GetSpellInfo(321968)] = true,  -- Polen desconcertante
		[GetSpellInfo(325027)] = true,  -- Ráfaga de zarzas
		[GetSpellInfo(331721)] = true,  -- Aluvión de lanzas
		[GetSpellInfo(325021)] = true,  -- Desgarro de Velo de Niebla
		[GetSpellInfo(340208)] = true,  -- Triturar armadura
		[GetSpellInfo(340160)] = true,  -- Aliento radiante
		[GetSpellInfo(325418)] = true,  -- Ácido volátil
		[GetSpellInfo(326092)] = true,  -- Veneno debilitador
	},
	[L['Plaguefall']] = {
		--Globgrog
		[GetSpellInfo(324652)] = true,  -- Peste debilitadora
		[GetSpellInfo(326242)] = true,  -- Onda de baba
		--Doctor Ickus
		[GetSpellInfo(329110)] = true,  -- Inyección de baba
		[GetSpellInfo(322358)] = true,  -- Tensión ardiente
		--Domina Venomblade
		[GetSpellInfo(325552)] = true,  -- Tajo citotóxico
		[GetSpellInfo(331818)] = true,  -- Emboscada de las Sombras
		[GetSpellInfo(333406)] = true,  -- Asesinato
		--Margrave
		[GetSpellInfo(322232)] = true,  -- Lluvia infecciosa
		--Trash
		[GetSpellInfo(327882)] = true,  -- Picoañublo
		[GetSpellInfo(320072)] = true,  -- Charco tóxico
		[GetSpellInfo(319120)] = true,  -- Bilis pútrida
		[GetSpellInfo(334926)] = true,  -- Flema desdichada
		[GetSpellInfo(319070)] = true,  -- Mugre corrosiva
		[GetSpellInfo(328180)] = true,  -- Infección atenazante
		[GetSpellInfo(328986)] = true,  -- Detonación violenta
		[GetSpellInfo(320512)] = true,  -- Garras corroídas
		[GetSpellInfo(328409)] = true,  -- Telarañas envolventes
		[GetSpellInfo(328501)] = true,  -- Bomba de peste
		[GetSpellInfo(319898)] = true,  -- Flema vil
		[GetSpellInfo(320542)] = true,  -- Añublo extenuante
		[GetSpellInfo(328395)] = true,  -- Perforador venenoso
	},
	[L['SanguineDepths']] = {
		--Tarvold
		[GetSpellInfo(322554)] = true,  -- Reprender
		--Beryllia
		[GetSpellInfo(328593)] = true,  -- Agonizar
		[GetSpellInfo(325885)] = true,  -- Llantos angustiados
		--General Kaal
		[GetSpellInfo(323845)] = true,  -- Carga perversa
		[GetSpellInfo(322796)] = true,  -- Cuchillada perversa
		--Trash
		[GetSpellInfo(321038)] = true,  -- Torturar alma
		[GetSpellInfo(322429)] = true,  -- Tajo mutilador
		[GetSpellInfo(326827)] = true,  -- Ataduras aterradoras
		[GetSpellInfo(322212)] = true,  -- Desconfianza creciente
		[GetSpellInfo(326790)] = true,  -- Recarga radiante
		[GetSpellInfo(327814)] = true,  -- Cuchillada perversa
	},
	[L['SpiresOfAscension']] = {
		--Kin-Tara
		[GetSpellInfo(324662)] = true,  -- Plasma ionizado
		[GetSpellInfo(327481)] = true,  -- Lanza oscura
		--Ventunax
		[GetSpellInfo(324154)] = true,  -- Zancada oscura
		[GetSpellInfo(324205)] = true,  -- Destello cegador
		--Oryphrion
		[GetSpellInfo(323195)] = true,  -- Explosión purificadora
		[GetSpellInfo(323792)] = true,  -- Campo de ánima
		[GetSpellInfo(338729)] = true,  -- Ánima cargada
		--Devos
		[GetSpellInfo(322818)] = true,  -- Confianza perdida
		[GetSpellInfo(322817)] = true,  -- Duda persistente
		--Trash
		[GetSpellInfo(328331)] = true,  -- Confesión forzosa
		[GetSpellInfo(328453)] = true,  -- Opresión
		[GetSpellInfo(328434)] = true,  -- Intimidado
		[GetSpellInfo(323739)] = true,  -- Impacto residual
		[GetSpellInfo(317963)] = true,  -- Carga de conocimiento
		[GetSpellInfo(317661)] = true,  -- Veneno insidioso
		[GetSpellInfo(27638)] = true,  -- Arañazo
		[GetSpellInfo(327648)] = true,  -- Conflicto interno
	},
	[L['NecroticWake']] = {
		--Blightbone
		[GetSpellInfo(320596)] = true,  -- Arcadas fulminantes
		[GetSpellInfo(320717)] = true,  -- Hambre de sangre
		--Amarth
		[GetSpellInfo(320462)] = true,  -- Descarga necrótica
		[GetSpellInfo(333633)] = true,  -- Ecos torturados
		--Surgeon
		[GetSpellInfo(320200)] = true,  -- Coseaguja
		[GetSpellInfo(322548)] = true,  -- Gancho de carnicero
		[GetSpellInfo(320366)] = true,  -- Icor embalsamante
		--Nalthor
		[GetSpellInfo(320784)] = true,  -- Lluvia de cometas
		[GetSpellInfo(320788)] = true,  -- Ataduras congeladas
		[GetSpellInfo(322274)] = true,  -- Socavar
		--Trash
		[GetSpellInfo(320573)] = true,  -- Pozo de las Sombras
		[GetSpellInfo(324293)] = true,  -- Chillido estridente
		[GetSpellInfo(324381)] = true,  -- Guadaña gélida
		[GetSpellInfo(321807)] = true,  -- Deshuesar
		[GetSpellInfo(328664)] = true,  -- Enfriado
		[GetSpellInfo(327396)] = true,  -- Destino lúgubre
		[GetSpellInfo(338357)] = true,  -- Ablandar
		[GetSpellInfo(338353)] = true,  -- Salpicasangre
		[GetSpellInfo(334748)] = true,  -- Drenar fluidos
		[GetSpellInfo(338606)] = true,  -- Fijación mórbida
		[GetSpellInfo(333485)] = true,  -- Nube enfermiza
		[GetSpellInfo(321821)] = true,  -- Tripas asquerosas
		[GetSpellInfo(345625)] = true,  -- Ráfaga mortífera
		[GetSpellInfo(334610)] = true,  -- Fijación descerebrada
		[GetSpellInfo(333477)] = true,  -- Rebanar tripas
		[GetSpellInfo(323471)] = true,  -- Lanzar cuchilla
	}, 
	[L['TheaterOfPain']] = {
		--challengers
		[GetSpellInfo(320248)] = true,  -- Alteración genética
		[GetSpellInfo(320180)] = true,  -- Esporas nocivas
		[GetSpellInfo(333231)] = true,  -- Muerte abrasadora
		[GetSpellInfo(320069)] = true,  -- Golpe mortal
		[GetSpellInfo(326892)] = true,  -- Fijar
		--gorechomp
		[GetSpellInfo(323406)] = true,  -- jagged-gash
		[GetSpellInfo(318913)] = true,  -- Gas inmundo
		[GetSpellInfo(323130)] = true,  -- Moco coagulante
		--xav
		[GetSpellInfo(331606)] = true,  -- Estandarte opresivo
		[GetSpellInfo(320287)] = true,  -- Sangre y gloria
		--kul'tharok
		[GetSpellInfo(319626)] = true,  -- Parásito fantasmal
		[GetSpellInfo(319521)] = true,  -- Extraer alma
		[GetSpellInfo(319539)] = true,  -- Desalmado
		[GetSpellInfo(319531)] = true,  -- Extraer alma
		--mordretha
		[GetSpellInfo(324449)] = true,  -- Muerte manifiesta
		[GetSpellInfo(323825)] = true,  -- Falla enredadora
		--Trash
		[GetSpellInfo(330810)] = true,  -- Vincular alma
		[GetSpellInfo(333708)] = true,  -- Corrupción de alma
		[GetSpellInfo(330784)] = true,  -- Descarga necrótica
		[GetSpellInfo(330868)] = true,  -- Salva de descarga necrótica
		[GetSpellInfo(342675)] = true,  -- Lanza ósea
		[GetSpellInfo(333299)] = true,  -- Maldición de desolación
		[GetSpellInfo(341949)] = true,  -- Añublo marchitador
		[GetSpellInfo(330700)] = true,  -- Añublo putrefacto
		[GetSpellInfo(332836)] = true,  -- Golpe cortante
		[GetSpellInfo(330592)] = true,  -- Erupción vil
		[GetSpellInfo(332708)] = true,  -- Golpe en el suelo
		[GetSpellInfo(331288)] = true,  -- Machaque colosal
		[GetSpellInfo(330562)] = true,  -- Grito desmoralizador
		[GetSpellInfo(330532)] = true,  -- Virote dentado
		[GetSpellInfo(333845)] = true,  -- Arremetida desequilibrante
		[GetSpellInfo(320679)] = true,  -- Cargar
		[GetSpellInfo(333861)] = true,  -- Hoja rebotadora
		[GetSpellInfo(330725)] = true,  -- Vulnerabilidad a las Sombras
		[GetSpellInfo(341291)] = true,  -- Oscuridad desatada
	},
	
	[L['Nyalotha']] = {
		-- Trash
		[GetSpellInfo(315161)] = false, --Eye of Corruption
		[GetSpellInfo(316959)] = true, --Devouring Acid
		[GetSpellInfo(311019)] = true, --Weakening Blow
		[GetSpellInfo(317149)] = true, --Gastric Fluids
		[GetSpellInfo(311122)] = true, --Jagged Wound
		[GetSpellInfo(313977)] = true, --Curse of the Void
		[GetSpellInfo(314905)] = true, --Shadow Wounds
		[GetSpellInfo(311508)] = true, --Clot Blood
		[GetSpellInfo(307044)] = true, --Nightmare Antibody
		[GetSpellInfo(313951)] = true, --Reaping Wound
		[GetSpellInfo(318788)] = true, --Corrupted Touch
		[GetSpellInfo(310830)] = true, --Disorienting Strike
		[GetSpellInfo(314850)] = true, --Expanding Darkness
		[GetSpellInfo(318409)] = true, --Discordant Whispers
		[GetSpellInfo(311116)] = true, --Reverberating Slam
		[GetSpellInfo(314847)] = true, --Decapitate
		[GetSpellInfo(314430)] = true, --Lingering Blood
		[GetSpellInfo(316677)] = true, --Germinating Parasite
		[GetSpellInfo(316506)] = true, --Heartpiercer Venom
		[GetSpellInfo(281721)] = true, --Vile Bile
		[GetSpellInfo(316951)] = true, --Voracious Charge
		[GetSpellInfo(311552)] = true, --Fear the Void
		[GetSpellInfo(315932)] = true, --Brutal Smash
		[GetSpellInfo(313938)] = true, --Crush
		[GetSpellInfo(307019)] = true, --Void Corruption
		[GetSpellInfo(311041)] = true, --Drive to Madness
		[GetSpellInfo(309704)] = true, --Caustic Coating
		[GetSpellInfo(315013)] = true, --Bursting Shadows
		[GetSpellInfo(307359)] = true, --Despair
		[GetSpellInfo(311097)] = true, --Condensing Void
		[GetSpellInfo(315000)] = true, --Shadow Chisel
		[GetSpellInfo(298514)] = true, --Aqiri Mind Toxin
		[GetSpellInfo(307020)] = true, --Twilight Breath
		[GetSpellInfo(306981)] = true, --Gift of the Void
		[GetSpellInfo(315311)] = true, --Ravage
		[GetSpellInfo(314347)] = true, --Noxious Choke   
		[GetSpellInfo(314188)] = true, --Mind Flay      
		[GetSpellInfo(313672)] = true, --Acid Pool       
		[GetSpellInfo(307053)] = true, --Lava Pools     
		[GetSpellInfo(314451)] = true, --Leeching Bite   
		[GetSpellInfo(313460)] = true, --Nullification    
		[GetSpellInfo(311362)] = true, --Rising Heat     
		[GetSpellInfo(314593)] = true, --Mind Numbing Toxin
		
		-- Wrathion
		[GetSpellInfo(306015)] = true, --Searing Armor
		[GetSpellInfo(318391)] = false, --Great Worm's Foul Stench
		[GetSpellInfo(306163)] = true, --Incineration
		[GetSpellInfo(313959)] = true, --Scorching Blister
		[GetSpellInfo(307013)] = true, --Burning Madness
		-- Maut
		[GetSpellInfo(307399)] = true, --Shadow Wounds
		[GetSpellInfo(310611)] = true, --Forbidden Mana
		[GetSpellInfo(307586)] = true, --Devoured Abyss
		[GetSpellInfo(307806)] = true, --Devour Magic
		[GetSpellInfo(308158)] = true, --Consuming Shadows

		-- Prophet Skitra
		[GetSpellInfo(308059)] = true, --Shadow Shock
		[GetSpellInfo(307785)] = false, --Twisted Mind
		[GetSpellInfo(307784)] = false, --Clouded Mind
		[GetSpellInfo(309652)] = true, --Illusionary Bolt
		[GetSpellInfo(309657)] = true, --Dark Ritual
		[GetSpellInfo(307950)] = true, --Shred Psyche

		-- Shad'har the Insatiable
		[GetSpellInfo(312590)] = true, --Bitten Hand
		[GetSpellInfo(306934)] = true, --Entropic Mantle
		[GetSpellInfo(307358)] = true, --Debilitating Spit
		[GetSpellInfo(307471)] = true, --Crush
		[GetSpellInfo(307472)] = true, --Dissolve
		[GetSpellInfo(306932)] = true, --Noxious Mantle
		[GetSpellInfo(318078)] = true, --Fixate
		[GetSpellInfo(308177)] = true, --Entropic Buildup
		[GetSpellInfo(306448)] = true, --Umbral Mantle
		[GetSpellInfo(306930)] = true, --Entropic Breath
		[GetSpellInfo(309704)] = true, --Caustic Coating
		[GetSpellInfo(306928)] = true, --Umbral Breath
		[GetSpellInfo(306929)] = true, --Bubbling Breath
		[GetSpellInfo(314736)] = true, --Bubbling Overflow

		-- Dark Inquisitor Xanesh
		[GetSpellInfo(311551)] = true, --Abyssal Strike
		[GetSpellInfo(312406)] = true, --Voidwoken
		[GetSpellInfo(306311)] = true, --Soul Flay

		-- Vexiona
		[GetSpellInfo(307019)] = true, --Void Corruption
		[GetSpellInfo(307284)] = true, --Terrifying Presence
		[GetSpellInfo(307343)] = true, --Shadowy Residue
		[GetSpellInfo(306981)] = true, --Gift of the Void
		[GetSpellInfo(307359)] = true, --Despair
		[GetSpellInfo(307020)] = true, --Twilight Breath
		[GetSpellInfo(307250)] = true, --Twilight Decimator
		[GetSpellInfo(307645)] = true, --Heart of Darkness
		[GetSpellInfo(315769)] = true, --Decimation
		[GetSpellInfo(310224)] = true, --Annihilation

		-- The Hivemind
		[GetSpellInfo(313461)] = true, --Corrosion

		-- Ra-den the Despoiled
		[GetSpellInfo(306819)] = true, --Nullifying Strike
		[GetSpellInfo(310022)] = true, --Charged Bonds
		[GetSpellInfo(306184)] = true, --Unleashed Void
		[GetSpellInfo(313227)] = true, --Decaying Wound
		[GetSpellInfo(310022)] = true, --Charged Bonds
		[GetSpellInfo(306273)] = true, --Unstable Vita
		[GetSpellInfo(309777)] = true, --Void Defilement

		-- Drest'agath
		[GetSpellInfo(308377)] = true, --Void Infused Ichor
		[GetSpellInfo(310309)] = true, --Volatile Vulnerability
		[GetSpellInfo(310277)] = true, --Volatile Seed
		[GetSpellInfo(310358)] = true, --Mutterings of Insanity
		[GetSpellInfo(310361)] = true, --Unleashed Insanity
		[GetSpellInfo(310406)] = true, --Void Glare

		-- Il'gynoth, Corruption Reborn
		[GetSpellInfo(315094)] = true, --Fixate
		[GetSpellInfo(309961)] = true, --Eye of N'Zoth
		[GetSpellInfo(312486)] = true, --Recurring Nightmare
		[GetSpellInfo(310322)] = true, --Morass of Corruption
		[GetSpellInfo(311159)] = true, --Cursed Blood

		-- Carapace of N'Zoth
		[GetSpellInfo(307044)] = true, --Nightmare Antibody
		[GetSpellInfo(315954)] = true, --Black Scar
		[GetSpellInfo(313364)] = true, --Mental Decay
		[GetSpellInfo(307061)] = false, --Mycelial Growth
		[GetSpellInfo(306973)] = true, --Madness Bomb
		[GetSpellInfo(306984)] = true, --Insanity Bomb

		-- N'Zoth the Corruptor
		[GetSpellInfo(308996)] = true, --Servant of N'Zoth
		[GetSpellInfo(313400)] = true, --Corrupted Mind
		[GetSpellInfo(313609)] = true, --Gift of N'Zoth
		[GetSpellInfo(316542)] = true, --Paranoia
		[GetSpellInfo(316711)] = true, --Mindwrack
		[GetSpellInfo(309991)] = true, --Anguish
		[GetSpellInfo(313610)] = true, --Mental Decay
		[GetSpellInfo(310042)] = true, --Tumultuous Burst
		[GetSpellInfo(309698)] = true, --Void Lash
		[GetSpellInfo(302565)] = true, --Conductive Ink
		[GetSpellInfo(310073)] = true, --Mindgrasp
		[GetSpellInfo(313793)] = true, --Flames of Insanity
		[GetSpellInfo(313663)] = true, --Psyche Shredder
	},
	[L['EP']] = {
		[GetSpellInfo(298314)] = true, -- Fluid - Gorgonzola
		
		-- > Azshara 
		[GetSpellInfo(303657)] = true, -- Arcane Burst
		[GetSpellInfo(299276)] = true, -- Sanction 
	},
	[L['CoS']] = {
		[GetSpellInfo(282432)] = true, -- Crushing Doupt
		[GetSpellInfo(282561)] = true, -- dark Herald
		[GetSpellInfo(285652)] = true, -- Insatiable Torment
	},
	[L['Uldir']] = {
		[GetSpellInfo(265129)] = true, -- Omega Vector
		[GetSpellInfo(265127)] = true, -- Lingering gedöns	
		},
	[L['BFD']] = {
		-- > Champion of the Light
		[GetSpellInfo(283572)] = true, -- Sacred Blade
		[GetSpellInfo(283651)] = true, -- Blinding Faith
		[GetSpellInfo(283579)] = true, -- Consecration
		-- > Jadefire Masters
		[GetSpellInfo(286988)] = true, -- Searing Embers
		[GetSpellInfo(282037)] = true, -- Rising Flames
		[GetSpellInfo(288151)] = true, -- Tested	
		[GetSpellInfo(285632)] = true, -- Stalking
		-- > Grong
		[GetSpellInfo(285875)] = true, -- Rending Bite
		[GetSpellInfo(283069)] = true, -- Megatomic Fire (Horde)
		[GetSpellInfo(286373)] = true, -- Chill of Death (Alliance)
		[GetSpellInfo(282215)] = true, -- Megatomic Seeker Missile
		[GetSpellInfo(282471)] = true, -- Voodoo Blast
		[GetSpellInfo(285659)] = true, -- Apetagonizer Core
		[GetSpellInfo(286434)] = true, -- Necrotic Core
		[GetSpellInfo(285671)] = true, -- Crushed		
		[GetSpellInfo(282010)] = true, -- Shattered
		-- > Opulence
		[GetSpellInfo(283063)] = true, -- Flames of Punishment
		[GetSpellInfo(283507)] = true, -- Volatile Charge
		[GetSpellInfo(286501)] = true, -- Creeping Blaze
		[GetSpellInfo(287072)] = true, -- Liquid Gold
		[GetSpellInfo(284470)] = true, -- Hex of Lethargy
		-- > Conclave
		[GetSpellInfo(284663)] = true, -- Bwonsamdi's Wrath
		[GetSpellInfo(282135)] = true, -- Crawling Hex
		[GetSpellInfo(285878)] = true, -- Mind Wipe
		[GetSpellInfo(282592)] = true, -- Bleeding Wounds
		[GetSpellInfo(286060)] = true, -- Cry of the Fallen
		[GetSpellInfo(282444)] = true, -- Lacerating Claws
		[GetSpellInfo(286811)] = true, -- Akunda's Wrath
		[GetSpellInfo(282209)] = true, -- Mark of Prey
		-- > Rastakhan
		[GetSpellInfo(285195)] = true, -- Deadly Withering
		[GetSpellInfo(285044)] = true, -- Toad Toxin
		[GetSpellInfo(284831)] = true, -- Scorching Detonation		
		[GetSpellInfo(284781)] = true, -- Grevious Axe
		[GetSpellInfo(285213)] = true, -- Caress of Death
		[GetSpellInfo(288449)] = true, -- Death's Door
		[GetSpellInfo(284662)] = true, -- Seal of Purification
		[GetSpellInfo(285349)] = true, -- Plague of Fire
		-- > Mekkatorque
		[GetSpellInfo(287167)] = true, -- Discombobulation
		[GetSpellInfo(283411)] = true, -- Gigavolt Blast	
		[GetSpellInfo(286480)] = true, -- Anti Tampering Shock
		[GetSpellInfo(287757)] = true, -- Gigavolt Charge
		[GetSpellInfo(282182)] = true, -- Buster Cannon
		[GetSpellInfo(284168)] = true, -- Shrunk
		[GetSpellInfo(284214)] = true, -- Trample
		[GetSpellInfo(287891)] = true, -- Sheep Shrapnel
		[GetSpellInfo(289023)] = true, -- Enormous		
		-- > Blockade
		[GetSpellInfo(285000)] = true, -- Kelp Wrapping		
		[GetSpellInfo(284405)] = true, -- Tempting Song
		[GetSpellInfo(285350)] = true, -- Storms Wail
		[GetSpellInfo(285075)] = true, -- Freezing Tidepool
		[GetSpellInfo(285382)] = true, -- Kelp Wrapping
		-- > Jaina
		[GetSpellInfo(287626)] = true, -- Grasp of Frost
		[GetSpellInfo(287490)] = true,	-- Frozen Solid
		[GetSpellInfo(287365)] = true, -- Searing Pitch
		[GetSpellInfo(285212)] = false, -- Chilling Touch
		[GetSpellInfo(285253)] = true, -- Ice Shard
		[GetSpellInfo(287199)] = true, -- Ring of Ice		
		[GetSpellInfo(288218)] = false, -- Broadside
		[GetSpellInfo(289220)] = true, -- Heart of Frost
		[GetSpellInfo(288038)] = true, -- Marked Target
		[GetSpellInfo(287565)] = true, -- Avalanche
		[GetSpellInfo(288374)] = true, -- Siegebreaker Blast
		}, 
	[L['Atal']] = {
		[GetSpellInfo(252781)] = true, -- Unstable Hex
		[GetSpellInfo(250096)] = true, -- Wracking Pain
		[GetSpellInfo(250371)] = true, -- Lingering Nausea
		[GetSpellInfo(253562)] = true, -- Wildfire
		[GetSpellInfo(255582)] = true, -- Molten Gold
		[GetSpellInfo(255041)] = true, -- Terrifying Screech
		[GetSpellInfo(255371)] = true, -- Terrifying Visage
		[GetSpellInfo(252687)] = true, -- Venomfang Strike
		[GetSpellInfo(254959)] = true, -- Soulburn
		[GetSpellInfo(255814)] = true, -- Rending Maul
		[GetSpellInfo(255421)] = true, -- Devour
		[GetSpellInfo(255434)] = true, -- Serrated Teeth
		[GetSpellInfo(256577)] = true, -- Soulfeast
		[GetSpellInfo(255558)] = true, -- Tainted Blood
		[GetSpellInfo(259190)] = true, -- Soulrend
		},
	[L['Freehold']] = {
		[GetSpellInfo(258323)] = true, -- Infected Wound
		[GetSpellInfo(257775)] = true, -- Plague Step
		[GetSpellInfo(257908)] = true, -- Oiled Blade
		[GetSpellInfo(257436)] = true, -- Poisoning Strike
		[GetSpellInfo(274389)] = true, -- Rat Traps
		[GetSpellInfo(274555)] = true, -- Scabrous Bite
		[GetSpellInfo(258875)] = true, -- Blackout Barrel
		[GetSpellInfo(256363)] = true, -- Ripper Punch
		[GetSpellInfo(257478)] = true, -- Crippling Bite	
		},
	[L['Kings']] = {
		[GetSpellInfo(270492)] = true, -- Hex
		[GetSpellInfo(267763)] = true, -- Wretched Discharge
		[GetSpellInfo(276031)] = true, -- Pit of Despair
		[GetSpellInfo(265773)] = true, -- Spit Gold
		[GetSpellInfo(270920)] = true, -- Seduction
		[GetSpellInfo(270865)] = true, -- Hidden Blade
		[GetSpellInfo(271564)] = true, -- Embalming Fluid
		[GetSpellInfo(270507)] = true, -- Poison Barrage
		[GetSpellInfo(267273)] = true, -- Poison Nova
		[GetSpellInfo(270003)] = true, -- Suppression Slam
		[GetSpellInfo(270084)] = true, -- Axe Barrage
		[GetSpellInfo(267618)] = true, -- Drain Fluids
		[GetSpellInfo(267626)] = true, -- Dessication
		[GetSpellInfo(270487)] = true, -- Severing Blade
		[GetSpellInfo(266238)] = true, -- Shattered Defenses
		[GetSpellInfo(266231)] = true, -- Severing Axe
		[GetSpellInfo(266191)] = true, -- Whirling Axes
		[GetSpellInfo(272388)] = true, -- Shadow Barrage
		[GetSpellInfo(271640)] = true, -- Dark Revelation
		[GetSpellInfo(268796)] = true, -- Impaling Spear
		[GetSpellInfo(270499)] = true, -- Frost Shock
		[GetSpellInfo(269369)] = true, -- Deathly Roar
		},	
	[L['Shrine']] = {
		[GetSpellInfo(264560)] = true, -- Choking Brine
		[GetSpellInfo(268233)] = true, -- Electrifying Shock
		[GetSpellInfo(268322)] = true, -- Touch of the Drowned
		[GetSpellInfo(268896)] = true, -- Mind Rend
		[GetSpellInfo(269104)] = true, -- Explosive Void
		[GetSpellInfo(267034)] = true, -- Whispers of Power
		[GetSpellInfo(276268)] = true, -- Heaving Blow
		[GetSpellInfo(264166)] = true, -- Undertow
		[GetSpellInfo(264526)] = true, -- Grasp from the Depths
		[GetSpellInfo(274633)] = true, -- Sundering Blow
		[GetSpellInfo(268214)] = true, -- Carve Flesh
		[GetSpellInfo(267818)] = true, -- Slicing Blast
		[GetSpellInfo(268309)] = true, -- Unending Darkness
		[GetSpellInfo(268317)] = true, -- Rip Mind
		[GetSpellInfo(268391)] = true, -- Mental Assault
		[GetSpellInfo(274720)] = true, -- Abyssal Strike
		[GetSpellInfo(268315)] = true, -- Lash
		[GetSpellInfo(276297)] = true, -- Void Seed
		[GetSpellInfo(267899)] = true, -- Hindering Cleave
		[GetSpellInfo(268050)] = true, -- Anchor of Binding
		[GetSpellInfo(269131)] = true, -- Ancient Mindbender	
		},		
	[L['Boralus']] = {
		[GetSpellInfo(257168)] = true, -- Cursed Slash
		[GetSpellInfo(272588)] = true, -- Rotting Wounds
		[GetSpellInfo(272571)] = true, -- Choking Waters
		[GetSpellInfo(274991)] = true, -- Putrid Waters
		[GetSpellInfo(275835)] = true, -- Stinging Venom Coating
		[GetSpellInfo(273930)] = true, -- Hindering Cut
		[GetSpellInfo(257292)] = true, -- Heavy Slash
		[GetSpellInfo(261428)] = true, -- Hangman's Noose
		[GetSpellInfo(256897)] = true, -- Clamping Jaws
		[GetSpellInfo(272874)] = true, -- Trample
		[GetSpellInfo(273470)] = true, -- Gut Shot
		[GetSpellInfo(272834)] = true, -- Viscous Slobber
		[GetSpellInfo(257169)] = true, -- Terrifying Roar
		[GetSpellInfo(272713)] = true, -- Crushing Slam	
		},
	[L['Sethraliss']] = {
		[GetSpellInfo(269686)] = true, -- Plague
		[GetSpellInfo(268013)] = true, -- Flame Shock
		[GetSpellInfo(268008)] = true, -- Snake Charm
		[GetSpellInfo(273563)] = true, -- Neurotoxin
		[GetSpellInfo(272657)] = true, -- Noxious Breath
		[GetSpellInfo(267027)] = true, -- Cytotoxin
		[GetSpellInfo(272699)] = true, -- Venomous Spit
		[GetSpellInfo(263371)] = true, -- Conduction
		[GetSpellInfo(272655)] = true, -- Scouring Sand
		[GetSpellInfo(263914)] = true, -- Blinding Sand
		[GetSpellInfo(263958)] = true, -- A Knot of Snakes
		[GetSpellInfo(266923)] = true, -- Galvanize
		[GetSpellInfo(268007)] = true, -- Heart Attack
		},
	[L['Motherlode']] = {
		[GetSpellInfo(263074)] = true, -- Festering Bite
		[GetSpellInfo(280605)] = true, -- Brain Freeze
		[GetSpellInfo(257337)] = true, -- Shocking Claw
		[GetSpellInfo(270882)] = true, -- Blazing Azerite
		[GetSpellInfo(268797)] = true, -- Transmute: Enemy to Goo
		[GetSpellInfo(259856)] = true, -- Chemical Burn
		[GetSpellInfo(269302)] = true, -- Toxic Blades
		[GetSpellInfo(280604)] = true, -- Iced Spritzer
		[GetSpellInfo(257371)] = true, -- Tear Gas
		[GetSpellInfo(257544)] = true, -- Jagged Cut
		[GetSpellInfo(268846)] = true, -- Echo Blade
		[GetSpellInfo(262794)] = true, -- Energy Lash
		[GetSpellInfo(262513)] = true, -- Azerite Heartseeker
		[GetSpellInfo(260829)] = true, -- Homing Missle (travelling)
		[GetSpellInfo(260838)] = true, -- Homing Missle (exploded)
		[GetSpellInfo(263637)] = true, -- Clothesline
		[GetSpellInfo(262270)] = true, -- Caustic Compound	
		},
	[L['Underrot']] = {
		[GetSpellInfo(265468)] = true, -- Withering Curse
		[GetSpellInfo(278961)] = true, -- Decaying Mind
		[GetSpellInfo(259714)] = true, -- Decaying Spores
		[GetSpellInfo(272180)] = true, -- Death Bolt
		[GetSpellInfo(272609)] = true, -- Maddening Gaze
		[GetSpellInfo(269301)] = true, -- Putrid Blood
		[GetSpellInfo(265533)] = true, -- Blood Maw
		[GetSpellInfo(265019)] = true, -- Savage Cleave
		[GetSpellInfo(265377)] = true, -- Hooked Snare
		[GetSpellInfo(265625)] = true, -- Dark Omen
		[GetSpellInfo(260685)] = true, -- Taint of G'huun
		[GetSpellInfo(266107)] = true, -- Thirst for Blood
		[GetSpellInfo(260455)] = true, -- Serrated Fangs	
		},
	[L['Dagor']] = {
		[GetSpellInfo(258128)] = true, -- Debilitating Shout
		[GetSpellInfo(265889)] = true, -- Torch Strike
		[GetSpellInfo(257791)] = true, -- Howling Fear
		[GetSpellInfo(258864)] = true, -- Suppression Fire
		[GetSpellInfo(257028)] = true, -- Fuselighter
		[GetSpellInfo(258917)] = true, -- Righteous Flames
		[GetSpellInfo(257777)] = true, -- Crippling Shiv
		[GetSpellInfo(258079)] = true, -- Massive Chomp
		[GetSpellInfo(258058)] = true, -- Squeeze
		[GetSpellInfo(260016)] = true, -- Itchy Bite
		[GetSpellInfo(257119)] = true, -- Sand Trap
		[GetSpellInfo(260067)] = true, -- Vicious Mauling
		[GetSpellInfo(258313)] = true, -- Handcuff
		[GetSpellInfo(259711)] = true, -- Lockdown
		[GetSpellInfo(256198)] = true, -- Azerite Rounds: Incendiary
		[GetSpellInfo(256101)] = true, -- Explosive Burst
		[GetSpellInfo(256044)] = true, -- Deadeye
		[GetSpellInfo(256474)] = true, -- Heartstopper Venom	
		},
	[L['Waycrest']] = {
		[GetSpellInfo(260703)] = true, -- Unstable Runic Mark
		[GetSpellInfo(263905)] = true, -- Marking Cleave
		[GetSpellInfo(265880)] = true, -- Dread Mark
		[GetSpellInfo(265882)] = true, -- Lingering Dread
		[GetSpellInfo(264105)] = true, -- Runic Mark
		[GetSpellInfo(264050)] = true, -- Infected Thorn
		[GetSpellInfo(261440)] = true, -- Virulent Pathogen
		[GetSpellInfo(263891)] = true, -- Grasping Thorns
		[GetSpellInfo(264378)] = true, -- Fragment Soul
		[GetSpellInfo(266035)] = true, -- Bone Splinter
		[GetSpellInfo(266036)] = true, -- Drain Essence
		[GetSpellInfo(260907)] = true, -- Soul Manipulation
		[GetSpellInfo(260741)] = true, -- Jagged Nettles
		[GetSpellInfo(264556)] = true, -- Tearing Strike
		[GetSpellInfo(265760)] = true, -- Thorned Barrage
		[GetSpellInfo(260551)] = true, -- Soul Thorns
		[GetSpellInfo(263943)] = true, -- Etch
		[GetSpellInfo(265881)] = true, -- Decaying Touch
		[GetSpellInfo(261438)] = true, -- Wasting Strike
		[GetSpellInfo(268202)] = true, -- Death Lens
		[GetSpellInfo(264153)] = true, -- Spit
		[GetSpellInfo(271175)] = true, -- Ravaging Leap
		[GetSpellInfo(273658)] = true, -- Dark Leap	
		},
	}, 
}

TargetBuff = {
-- Racial
	[65116] = true, -- Stoneform
	[59547] = true, -- Gift of the Naaru
	[20572] = true, -- Blood Fury
	[26297] = true, -- Berserking
	[68992] = true, -- Darkflight
	[58984] = true, -- Shadowmeld
-- Consumables
	[188029] = true, --Unbending Potion (Legion Armor)
	[188028] = true, --Potion of the Old War (Legion Melee)
	[188027] = true, --Potion of Deadly Grace (Legion Caster)
	[229206] = true, --Potion of Prolonged Power (Legion)
	[178207] = true, --Drums of Fury
	[230935] = true, --Drums of the Mountain
-- Death Knight
	[48707] = true, --Anti-Magic Shell
	[81256] = true, --Dancing Rune Weapon
	[55233] = true, --Vampiric Blood
	[193320] = true, --Umbilicus Eternus
	[219809] = true, --Tombstone
	[48792] = true, --Icebound Fortitude
	[207319] = true, --Corpse Shield
	[194844] = true, --BoneStorm
	[145629] = true, --Anti-Magic Zone
	[194679] = true, --Rune Tap
	[51271] = true, --Pilar of Frost
	[207256] = true, --Obliteration
	[152279] = true, --Breath of Sindragosa
	[233411] = true, --Blood for Blood
	[212552] = true, --Wraith Walk
	[215711] = true, --Soul Reaper
	[194918] = true, --Blighted Rune Weapon
-- Demon Hunter
	[207811] = true, --Nether Bond (DH)
	[207810] = true, --Nether Bond (Target)
	[187827] = true, --Metamorphosis
	[227225] = true, --Soul Barrier
	[209426] = true, --Darkness
	[196555] = true, --Netherwalk
	[212800] = true, --Blur
	[188499] = true, --Blade Dance
	[203819] = true, --Demon Spikes
	[218256] = true, --Empower Wards
	[206804] = true, --Rain from Above
	[211510] = true, --Solitude
	[211048] = true, --Chaos Blades
	[162264] = true, --Metamorphosis
	[205629] = true, --Demonic Trample
-- Druid
	[102342] = true, --Ironbark
	[61336] = true, --Survival Instincts
	[210655] = true, --Protection of Ashamane
	[22812] = true, --Barkskin
	[200851] = true, --Rage of the Sleeper
	[234081] = true, --Celestial Guardian
	[202043] = true, --Protector of the Pack (it's this one or the other)
	[201940] = true, --Protector of the Pack
	[201939] = true, --Protector of the Pack (Allies)
	[192081] = true, --Ironfur
	[192083] = true, --Mark of Ursol
	[29166] = true, --Innervate
	[208253] = true, --Essence of G'Hanir
	[194223] = true, --Celestial Alignment
	[102560] = true, --Incarnation: Chosen of Elune
	[102543] = true, --Incarnation: King of the Jungle
	[102558] = true, --Incarnation: Guardian of Ursoc
	[117679] = true, --Incarnation
	[106951] = true, --Berserk
	[5217] = true, --Tiger's Fury
	[1850] = true, --Dash
	[137452] = true, --Displacer Beast
	[102416] = true, --Wild Charge
	[77764] = true, --Stampeding Roar (Cat)
	[77761] = true, --Stampeding Roar (Bear)
	[203727] = true, --Thorns
	[233756] = true, --Eclipse (it's this one or the other)
	[234084] = true, --Eclipse
	[22842] = true, --Frenzied Regeneration
-- Hunter
	[186265] = true, --Aspect of the Turtle
	[53480] = true, --Roar of Sacrifice
	[202748] = true, --Survival Tactics
	[62305] = true, --Master's Call (it's this one or the other)
	[54216] = true, --Master's Call
	[193526] = true, --Trueshot
	[193530] = true, --Aspect of the Wild
	[19574] = true, --Bestial Wrath
	[186289] = true, --Aspect of the Eagle
	[186257] = true, --Aspect of the Cheetah
	[118922] = true, --Posthaste
	[90355] = true, -- Ancient Hysteria (Pet)
	[160452] = true, -- Netherwinds (Pet)
-- Mage
	[45438] = true, --Ice Block
	[113862] = true, --Greater Invisibility
	[198111] = true, --Temporal Shield
	[198065] = true, --Prismatic Cloak
	[11426] = true, --Ice Barrier
	[190319] = true, --Combustion
	[80353] = true, --Time Warp
	[12472] = true, --Icy Veins
	[12042] = true, --Arcane Power
	[116014] = true, --Rune of Power
	[198144] = true, --Ice Form
	[108839] = true, --Ice Floes
	[205025] = true, --Presence of Mind
	[198158] = true, --Mass Invisibility
	[221404] = true, --Burning Determination
-- Monk
	[122783] = true, --Diffuse Magic
	[122278] = true, --Dampen Harm
	[125174] = true, --Touch of Karma
	[201318] = true, --Fortifying Elixir
	[201325] = true, --Zen Moment
	[202248] = true, --Guided Meditation
	[120954] = true, --Fortifying Brew
	[116849] = true, --Life Cocoon
	[202162] = true, --Guard
	[215479] = true, --Ironskin Brew
	[152173] = true, --Serenity
	[137639] = true, --Storm, Earth, and Fire
	[216113] = true, --Way of the Crane
	[213664] = true, --Nimble Brew
	[201447] = true, --Ride the Wind
	[195381] = true, --Healing Winds
	[116841] = true, --Tiger's Lust
	[119085] = true, --Chi Torpedo
	[199407] = true, --Light on Your Feet
	[209584] = true, --Zen Focus Tea
-- Paladin
	[642] = true, --Divine Shield
	[498] = true, --Divine Protection
	[205191] = true, --Eye for an Eye
	[184662] = true, --Shield of Vengeance
	[1022] = true, --Blessing of Protection
	[6940] = true, --Blessing of Sacrifice
	[204018] = true, --Blessing of Spellwarding
	[199507] = true, --Spreading The Word: Protection
	[216857] = true, --Guarded by the Light
	[228049] = true, --Guardian of the Forgotten Queen
	[31850] = true, --Ardent Defender
	[86659] = true, --Guardian of Ancien Kings
	[209388] = true, --Bulwark of Order
	[152262] = true, --Seraphim
	[132403] = true, --Shield of the Righteous
	[31842] = true, --Avenging Wrath (Holy)
	[31884] = true, --Avenging Wrath
	[105809] = true, --Holy Avenger
	[224668] = true, --Crusade
	[200652] = true, --Tyr's Deliverance
	[216331] = true, --Avenging Crusader
	[1044] = true, --Blessing of Freedom
	[210256] = true, --Blessing of Sanctuary
	[199545] = true, --Steed of Glory
	[210294] = true, --Divine Favor
	[221886] = true, --Divine Steed
	[31821] = true, --Aura Mastery
-- Priest
	[81782] = true, --Power Word: Barrier
	[47585] = true, --Dispersion
	[19236] = true, --Desperate Prayer
	[213602] = true, --Greater Fade
	[27827] = true, --Spirit of Redemption
	[197268] = true, --Ray of Hope
	[47788] = true, --Guardian Spirit
	[33206] = true, --Pain Suppression
	[200183] = true, --Apotheosis
	[10060] = true, --Power Infusion
	[47536] = true, --Rapture
	[194249] = true, --Voidform
	[193223] = true, --Surrdender to Madness
	[197862] = true, --Archangel
	[197871] = true, --Dark Archangel
	[197874] = true, --Dark Archangel
	[215769] = true, --Spirit of Redemption
	[213610] = true, --Holy Ward
	[121557] = true, --Angelic Feather
	[214121] = true, --Body and Mind
	[65081] = true, --Body and Soul
	[197767] = true, --Speed of the Pious
	[210980] = true, --Focus in the Light
	[221660] = true, --Holy Concentration
	[15286] = true, --Vampiric Embrace
-- Rogue
	[5277] = true, --Evasion
	[31224] = true, --Cloak of Shadows
	[1966] = true, --Feint
	[199754] = true, --Riposte
	[45182] = true, --Cheating Death
	[199027] = true, --Veil of Midnight
	[121471] = true, --Shadow Blades
	[13750] = true, --Adrenaline Rush
	[51690] = true, --Killing Spree
	[185422] = true, --Shadow Dance
	[198368] = true, --Take Your Cut
	[198027] = true, --Turn the Tables
	[213985] = true, --Thief's Bargain
	[197003] = true, --Maneuverability
	[212198] = true, --Crimson Vial
	[185311] = true, --Crimson Vial
	[209754] = true, --Boarding Party
	[36554] = true, --Shadowstep
	[2983] = true, --Sprint
	[202665] = true, --Curse of the Dreadblades (Self Debuff)
-- Shaman
	[204293] = false, --Spirit Link
	[204288] = true, --Earth Shield
	[210918] = true, --Ethereal Form
	[207654] = true, --Servant of the Queen
	[108271] = true, --Astral Shift
	[98007] = true, --Spirit Link Totem
	[207498] = true, --Ancestral Protection
	[204366] = true, --Thundercharge
	[209385] = true, --Windfury Totem
	[208963] = true, --Skyfury Totem
	[204945] = true, --Doom Winds
	[205495] = true, --Stormkeeper
	[208416] = true, --Sense of Urgency
	[2825] = true, --Bloodlust
	[16166] = true, --Elemental Mastery
	[167204] = true, --Feral Spirit
	[114050] = true, --Ascendance (Elem)
	[114051] = true, --Ascendance (Enh)
	[114052] = true, --Ascendance (Resto)
	[79206] = true, --Spiritwalker's Grace
	[58875] = true, --Spirit Walk
	[157384] = true, --Eye of the Storm
	[192082] = true, --Wind Rush
	[2645] = true, --Ghost Wolf
	[32182] = true, --Heroism
	[108281] = true, --Ancestral Guidance
-- Warlock
	[108416] = true, --Dark Pact
	[104773] = true, --Unending Resolve
	[221715] = true, --Essence Drain
	[212284] = true, --Firestone
	[196098] = true, --Soul Harvest
	[221705] = true, --Casting Circle
	[111400] = true, --Burning Rush
	[212295] = true, --Planeswalker
-- Warrior
	[118038] = true, --Die by the Sword
	[184364] = true, --Enraged Regeneration
	[209484] = true, --Tactical Advance
	[97463] = true, --Commanding Shout
	[213915] = true, --Mass Spell Reflection
	[199038] = true, --Leave No Man Behind
	[223658] = true, --Safeguard
	[147833] = true, --Intervene
	[198760] = true, --Intercept
	[12975] = true, --Last Stand
	[871] = true, --Shield Wall
	[23920] = true, --Spell Reflection
	[216890] = true, --Spell Reflection (PvPT)
	[227744] = true, --Ravager
	[203524] = true, --Neltharion's Fury
	[190456] = true, --Ignore Pain
	[132404] = true, --Shield Block
	[1719] = true, --Battle Cry
	[107574] = true, --Avatar
	[227847] = true, --Bladestorm (Arm)
	[46924] = true, --Bladestorm (Fury)
	[12292] = true, --Bloodbath
	[118000] = true, --Dragon Roar
	[199261] = true, --Death Wish
	[18499] = true, --Berserker Rage
	[202164] = true, --Bounding Stride
	[215572] = true, --Frothing Berserker
	[199203] = true, --Thirst for Battle
}

TargetDebuff = {
	--Death Knight
		[47476] = true, --Strangulate
		[108194] = true, --Asphyxiate UH
		[221562] = true, --Asphyxiate Blood
		[207171] = true, --Winter is Coming
		[206961] = true, --Tremble Before Me
		[207167] = true, --Blinding Sleet
		[212540] = true, --Flesh Hook (Pet)
		[91807] = true, --Shambling Rush (Pet)
		[204085] = true, --Deathchill
		[233395] = true, --Frozen Center
		[212332] = true, --Smash (Pet)
		[212337] = true, --Powerful Smash (Pet)
		[91800] = true, --Gnaw (Pet)
		[91797] = true, --Monstrous Blow (Pet)
		[210141] = true, --Zombie Explosion
	--Demon Hunter
		[207685] = true, --Sigil of Misery
		[217832] = true, --Imprison
		[221527] = true, --Imprison (Banished version)
		[204490] = true, --Sigil of Silence
		[179057] = true, --Chaos Nova
		[211881] = true, --Fel Eruption
		[205630] = true, --Illidan's Grasp
		[208618] = true, --Illidan's Grasp (Afterward)
		[213491] = true, --Demonic Trample (it's this one or the other)
		[208645] = true, --Demonic Trample
		[200166] = true, --Metamorphosis
	--Druid
		[81261] = true, --Solar Beam
		[5211] = true, --Mighty Bash
		[163505] = true, --Rake
		[203123] = true, --Maim
		[202244] = true, --Overrun
		[99] = true, --Incapacitating Roar
		[33786] = true, --Cyclone
		[209753] = true, --Cyclone Balance
		[45334] = true, --Immobilized
		[102359] = true, --Mass Entanglement
		[339] = true, --Entangling Roots
	--Hunter
		[202933] = true, --Spider Sting (it's this one or the other)
		[233022] = true, --Spider Sting
		[224729] = true, --Bursting Shot
		[213691] = true, --Scatter Shot
		[19386] = true, --Wyvern Sting
		[3355] = true, --Freezing Trap
		[203337] = true, --Freezing Trap (Survival PvPT)
		[209790] = true, --Freezing Arrow
		[24394] = true, --Intimidation
		[117526] = true, --Binding Shot
		[190927] = true, --Harpoon
		[201158] = true, --Super Sticky Tar
		[162480] = true, --Steel Trap
		[212638] = true, --Tracker's Net
		[200108] = true, --Ranger's Net
	--Mage
		[61721] = true, --Rabbit (Poly)
		[61305] = true, --Black Cat (Poly)
		[28272] = true, --Pig (Poly)
		[28271] = true, --Turtle (Poly)
		[126819] = true, --Porcupine (Poly)
		[161354] = true, --Monkey (Poly)
		[161353] = true, --Polar bear (Poly)
		[118] = true, --Polymorph
		[82691] = true, --Ring of Frost
		[31661] = true, --Dragon's Breath
		[122] = true, --Frost Nova
		[33395] = true, --Freeze
		[157997] = true, --Ice Nova
		[228600] = true, --Glacial Spike
		[198121] = true, --Forstbite
	--Monk
		[119381] = true, --Leg Sweep
		[202346] = true, --Double Barrel
		[115078] = true, --Paralysis
		[198909] = true, --Song of Chi-Ji
		[202274] = true, --Incendiary Brew
		[233759] = true, --Grapple Weapon
		[123407] = true, --Spinning Fire Blossom
		[116706] = true, --Disable
		[232055] = true, --Fists of Fury (it's this one or the other)
	--Paladin
		[853] = true, --Hammer of Justice
		[20066] = true, --Repentance
		[105421] = true, --Blinding Light
		[31935] = true, --Avenger's Shield
		[217824] = true, --Shield of Virtue
		[205290] = true, --Wake of Ashes
	--Priest
		[9484] = true, --Shackle Undead
		[200196] = true, --Holy Word: Chastise
		[200200] = true, --Holy Word: Chastise
		[226943] = true, --Mind Bomb
		[605] = true, --Mind Control
		[8122] = true, --Psychic Scream
		[15487] = true, --Silence
		[199683] = true, --Last Word
		[64044] = true, -- psychic horror
		[453] = true, -- Mind Soothe
	--Rogue
		[2094] = true, --Blind
		[6770] = true, --Sap
		[1776] = true, --Gouge
		[199743] = true, --Parley
		[1330] = true, --Garrote - Silence
		[207777] = true, --Dismantle
		[199804] = true, --Between the Eyes
		[408] = true, --Kidney Shot
		[1833] = true, --Cheap Shot
		[207736] = true, --Shadowy Duel (Smoke effect)
		[212182] = true, --Smoke Bomb
	--Shaman
		[51514] = true, --Hex
		[211015] = true, --Hex (Cockroach)
		[211010] = true, --Hex (Snake)
		[211004] = true, --Hex (Spider)
		[210873] = true, --Hex (Compy)
		[196942] = true, --Hex (Voodoo Totem)
		[118905] = true, --Static Charge
		[77505] = true, --Earthquake (Knocking down)
		[118345] = true, --Pulverize (Pet)
		[204399] = true, --Earthfury
		[204437] = true, --Lightning Lasso
		[157375] = true, --Gale Force
		[64695] = true, --Earthgrab
	--Warlock
		[710] = true, --Banish
		[6789] = true, --Mortal Coil
		[118699] = true, --Fear
		[5484] = true, --Howl of Terror
		[6358] = true, --Seduction (Succub)
		[171017] = true, --Meteor Strike (Infernal)
		[22703] = true, --Infernal Awakening (Infernal CD)
		[30283] = true, --Shadowfury
		[89766] = true, --Axe Toss
		[233582] = true, --Entrenched in Flame
	--Warrior
		[5246] = true, --Intimidating Shout
		[7922] = true, --Warbringer
		[132169] = true, --Storm Bolt
		[132168] = true, --Shockwave
		[199085] = true, --Warpath
		[105771] = true, --Charge
		[199042] = true, --Thunderstruck
	--Racial
		[155145] = true, --Arcane Torrent
		[20549] = true, --War Stomp
		[107079] = true, --Quaking Palm
}

-- Class buffs { spell ID, position [, {r, g, b, a}][, anyUnit][, hideCount] }
	-- BOTTOMRIGHT = Externals
	-- BOTTOMLEFT = Raid CDs
	-- BOTTOM = Personal CDs
	-- RIGHT = Immunities	
indicatorList = {
	DEATHKNIGHT = {

	},
	DEMONHUNTER = {

	},
	DRUID = {
		{33763, 'TOPLEFT', {1, .5, 0}}, 		-- Livebloom
		{774, 'TOPRIGHT', {0, 1, 0}}, 			-- Reju
		--{48438, 'TOP', {.2, .8, .2}},			-- Wild Growth
		{8936, 'TOP', {0, .8, .8}},			-- Wild Growth

	},
	HUNTER = {
		
	},
	MAGE = {
		
	},
	MONK = {
		{124682, 'TOPLEFT', {1, .5, 0}}, 		-- Enveloping Mist
		{119611, 'TOPRIGHT', {0, 1, 0}}, 			-- Renewing Mist
	},
	PALADIN = {
		{53563, 'TOPLEFT', {1, .5, 0}}, 			-- Beacon of Light
		{25771, 'TOPLEFT', {1, 0 ,0}}, 			-- Forbearance
		{156910, 'TOPLEFT', {1, .5, 0}}, 			-- Beacon of Faith
		{200025, 'TOPLEFT', {1, .5, 0}}, 			-- Beacon of Virtue
		{287280, 'TOPRIGHT', {.2, .9, .2}},			-- glimmer

	},
	PRIEST = {
		{41635, 'TOPLEFT', {1, .5, 0}}, 		-- Prayer of Mending
		{139, 'TOPRIGHT', {0, 1, 0}}, 			-- Renew
		{194384, 'TOPLEFT', {1, .5, 0}}, 		-- Atonement
		{214206, 'TOPLEFT', {1, .5, 0}}, 		-- Atonement 
		{17, 'TOPRIGHT', {0, 1, 0}}, 			-- Power Word: Shield		
		{6788, 'TOPRIGHT', {1, 0, 0}}, 			-- Power Word: Shield  
		

	},
	ROGUE = {

	},
	SHAMAN = {
		{61295, 'TOPRIGHT', {0, 1, 0}}, 			-- Renew
		{974, 'TOPLEFT', {1, .5, 0}}, 			-- Earth shield
	},
	WARLOCK = {

	},
	WARRIOR = {

	},
	ALL = {
		{48707,'BOTTOM',{.4,1,1},true},			-- Anti-Magic Shell
		{48792,'BOTTOM',{.4,1,1},true},			-- Icebound Fortitude
		{194844,'BOTTOM',{.4,1,1},true},		-- Bonestorm
		{81256,'BOTTOM',{.4,1,1},true},			-- Dancing Rune Weapon
		{194679,'BOTTOM',{.4,1,1},true},		-- Rune Tap
		{55233,'BOTTOM',{.4,1,1},true},			-- Vampiric Blood
		{209426,'BOTTOMLEFT',{1,0,0},true},		-- Darkness
		{196555,'RIGHT',{1,0,1},true},			-- Netherwalk
		{212800,'BOTTOM',{.4,1,1},true},		-- Blur
		{187827,'BOTTOM',{.4,1,1},true},		-- Metamorphosis
		{102342,'BOTTOMRIGHT',{1,.4,.4},true},	-- Ironbark
		{22812,'BOTTOM',{.4,1,1},true},			-- Barkskin
		{61336,'BOTTOM',{.4,1,1},true},			-- Survival Instinct
		{102558,'BOTTOM',{.4,1,1},true},		-- Incarnation: Guar
		{186265,'RIGHT',{1,0,1},true},			-- Aspect of the Turtle
		{45438,'RIGHT',{1,0,1},true},			-- Ice Block
		{116849,'BOTTOMRIGHT',{1,.4,.4},true},	-- Life Cocoon
		{122278,'BOTTOM',{.4,1,1},true},		-- Dampen Harm
		{122783,'BOTTOM',{.4,1,1},true},		-- Diffuse Magic
		{125174,'BOTTOM',{.4,1,1},true},		-- Touch of Karma
		{120954,'BOTTOM',{.4,1,1},true},		-- Fortifying Brew
		{115176,'BOTTOM',{.4,1,1},true},		-- Zen Meditation
		{1022,'BOTTOMRIGHT',{1,.4,.4},true},	-- Blessing of Prote
		{6940,'BOTTOMRIGHT',{1,.4,.4},true},	-- Blessing of Sacr
		{204018,'BOTTOMRIGHT',{1,.4,.4},true},	-- Blessing of Spel
		{31821,'BOTTOMLEFT',{1,0,0},true},		-- Aura Mastery 
		{642,'RIGHT',{1,0,1},true},				-- Divine Shield
		{498,'BOTTOM',{.4,1,1},true},			-- Divine Protection
		{205191,'BOTTOM',{.4,1,1},true},		-- Eye for an Eye
		{184662,'BOTTOM',{.4,1,1},true},		-- Shield of Veng
		{31850,'BOTTOM',{.4,1,1},true},			-- Ardent Defender
		{228049,'BOTTOM',{.4,1,1},true},		-- Guardian of the
		{47788,'BOTTOMRIGHT',{1,.4,.4},true},	-- Guardian Spirit
		{33206,'BOTTOMRIGHT',{1,.4,.4},true},	-- Pain Sup
		{81782,'BOTTOMLEFT',{1,0,0},true},		-- Power Word: Barrier
		{19236,'BOTTOM',{.4,1,1},true},			-- Desperate Prayer
		{47585,'BOTTOM',{.4,1,1},true},			-- Dispersion
		{31224,'RIGHT',{1,0,1},true},			-- Cloak of Shadows
		{5277,'BOTTOM',{.4,1,1},true},			-- Evasion
		{199754,'BOTTOM',{.4,1,1},true},		-- Riposte
		{207498,'BOTTOMLEFT',{1,0,0},true},		-- Ancestral Protection
				-- Spirit Link{204293,'BOTTOMLEFT',{1,0,0},true},
		{108271,'BOTTOM',{.4,1,1},true},		-- Astral Shift
		{108416,'BOTTOM',{.4,1,1},true},		-- Dark Pact
		{104773,'BOTTOM',{.4,1,1},true},		-- Unending Resolve
		{118038,'BOTTOM',{.4,1,1},true},		-- Die by the Sword
		{184364,'BOTTOM',{.4,1,1},true},		-- Enraged Regeneration
		{12975,'BOTTOM',{.4,1,1},true},			-- Last Stand
		{227744,'BOTTOM',{.4,1,1},true},		-- Ravager
		{871,'BOTTOM',{.4,1,1},true},			-- Shield Wall
		{23920,'BOTTOM',{.4,1,1},true},			-- Spell Reflection
	},
}

local space = 2
offsets = {
	TOPLEFT = {
		icon = {space, -space},
		count = {'TOP', icon, 'BOTTOM', 0, 0},
	},

	TOPRIGHT = {
		icon = {-space, -space},
		count = {'TOP', icon, 'BOTTOM', 0, 0},
	},

	BOTTOMLEFT = {
		icon = {space, space},
		count = {'LEFT', icon, 'RIGHT', 1, 0},
	},

	BOTTOMRIGHT = {
		icon = {-space, space},
		count = {'RIGHT', icon, 'LEFT', -1, 0},
	},

	LEFT = {
		icon = {space, 0},
		count = {'LEFT', icon, 'RIGHT', 1, 0},
	},

	RIGHT = {
		icon = {-space, 0},
		count = {'RIGHT', icon, 'LEFT', -1, 0},
	},

	TOP = {
		icon = {0, -space},
		count = {'CENTER', icon, 0, 0},
	},

	BOTTOM = {
		icon = {28, space},
		count = {'CENTER', icon, 0, 0},
	},
}