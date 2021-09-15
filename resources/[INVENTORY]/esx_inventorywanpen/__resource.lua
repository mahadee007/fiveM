resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "ESX Inventory HUD"

version "1.1"

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
 -- "client/shop.lua",
  "client/trunk.lua",
  "client/property.lua",
  "client/player.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
 -- ICONS
    'html/img/items/car_keys.png',
	'html/img/items/bottle.png',
	'html/img/items/alive_chicken.png',
	'html/img/items/gym_membership.png',
	"html/img/items/sicklecrab.png",
	'html/img/items/milk_engine.png',
	'html/img/items/turtle.png',
	'html/img/items/turtlebait.png',
	'html/img/items/shark.png',
	'html/img/items/fishbait.png',
	'html/img/items/fishingrod.png',
	'html/img/items/fish.png',
	'html/img/items/bandage.png',
	'html/img/items/cigarett.png',
	'html/img/items/carokit.png',
	"html/img/items/cockles.png",
	'html/img/items/cow.png',
	'html/img/items/cowpackage.png',
	'html/img/items/deer.png',
	"html/img/items/drills",
	'html/img/items/handcuffs.png',
	'html/img/items/hatchet.png',
	'html/img/items/jumelles.png',
	'html/img/items/ledeer.png',
	'html/img/items/lemonkey.png',
	'html/img/items/monkey.png',
	'html/img/items/nitro.png',
	"html/img/items/poolcleaner.png",
	"html/img/items/poolreceipt.png",
	"html/img/items/pumkin.png",
	"html/img/items/pumkin_pro.png",
	"html/img/items/shell.png",
    'html/img/items/whale.png',
	'html/img/items/wdw.png',
	'html/img/items/knife_sl.png',
	'html/img/items/sliced_pork.png',
	'html/img/items/packed_sliced_pork.png',	
	'html/img/items/rice.png',
	'html/img/items/fish2.png',
	'html/img/items/mushroom.png',
	'html/img/items/glass.png',
	'html/img/items/skateboard.png',
	'html/img/items/mushroom_pro.png',
	'html/img/items/shellfish.png',
	'html/img/items/contract.png',
	'html/img/items/contract.png',
	'html/img/items/colis.png',
	'html/img/items/shellfish_pro.png',
	'html/img/items/spade.png',
	'html/img/items/rice_pro.png',
	'html/img/items/packaged_chicken.png',
	'html/img/items/cloth.png',
	'html/img/items/cutted_wood.png',
	'html/img/items/marijuana',
	'html/img/items/chickenwithoutfeather.png',
	'html/img/items/chicken_meat.png',
	'html/img/items/chicken.png',
	'html/img/items/chicken_package.png',
	'html/img/items/knife_chicken.png',
	'html/img/items/knife.png',
	'html/img/items/knife_rubber.png',
    'html/img/items/crab.png',
	'html/img/items/crabpack.png',
	'html/img/items/steel.png',
	'html/img/items/gunpowder.png',
	'html/img/items/packaged_plank.png',
	'html/img/items/weed_pooch.png',
	'html/img/items/weed.png',
	'html/img/items/fabric.png',
	'html/img/items/wood.png',
	'html/img/items/sfish.png',
	'html/img/items/mfish.png',
	'html/img/items/lfish.png',
	'html/img/items/rubber_pack.png',
	'html/img/items/rubber.png',
	'html/img/items/leather.png',
	'html/img/items/meatw.png',
	'html/img/items/chest_a.png',
	'html/img/items/porkpackage.png',
	'html/img/items/pork.png',
	'html/img/items/oil_b.png',
	'html/img/items/oil_b.png',
	'html/img/items/pro_wood.png',
	'html/img/items/milking_machine.png',
	'html/img/items/milk_pro.png',
	'html/img/items/orange.png',
	'html/img/items/acabbage.png',
	'html/img/items/bcabbage.png',
	'html/img/items/gps.png',
	'html/img/items/lEbait.png',
	'html/img/items/lUbait.png',
	'html/img/items/petrol.png',
	'html/img/items/fish.png',
    'html/img/items/pastacarbonara.png',
	'html/img/items/macka.png',
	'html/img/items/lotteryticket.png',
	'html/img/items/fanta.png',
	'html/img/items/cage.png',
	'html/img/items/sprite.png',
	'html/img/items/cheesebows.png',
	'html/img/items/chips.png',
	'html/img/items/marabou.png',
	'html/img/items/pizza.png',
	'html/img/items/burger.png',
	'html/img/items/essence.png',
	'html/img/items/cofe.png',
	'html/img/items/diamond.png',
	'html/img/items/gold.png',
	'html/img/items/shovel.png',
	'html/img/items/meat.png',
	'html/img/items/meatpig.png',
	'html/img/items/meat_pro.png',
	"html/img/items/battery.png",
    "html/img/items/lowradio.png",
    "html/img/items/stockrim.png",
    "html/img/items/airbag.png",
    "html/img/items/highradio.png",
    "html/img/items/highrim.png",
	'html/img/items/icetea.png',
	'html/img/items/close.png',
	'html/img/items/shell_a.png',
	'html/img/items/shell_b.png',
	'html/img/items/lighter.png',
	'html/img/items/petrol_raffin.png',
	'html/img/items/sandwich.png',
	'html/img/items/stone.png',
	'html/img/items/wine.png',
	'html/img/items/copper.png',
	'html/img/items/milk_cow.png',
	'html/img/items/washed_stone.png',
	'html/img/items/iron.png',
	'html/img/items/slaughtered_chicken.png',
	'html/img/items/lrod.png',
	'html/img/items/hamajifish.png',
	'html/img/items/prawn.png',
	'html/img/items/prawnbait.png',
	'html/img/items/squid.png',
	'html/img/items/blindfold.png',
	'html/img/items/squidbait.png',
	'html/img/items/worm.png',
	'html/img/items/lbait.png',
    'html/img/items/beer.png',
	'html/img/items/honey_a.png',
	'html/img/items/honey_b.png',
	'html/img/items/hatchet_lj.png',
	'html/img/items/sickle.png',
	'html/img/items/Scissors.png',
	'html/img/items/baitom.png',
    'html/img/items/namtom.png',
    'html/img/items/binoculars.png',
    'html/img/items/bread.png',
    'html/img/items/cannabis.png',
    'html/img/items/cigarette.png',
    'html/img/items/clip.png',
    'html/img/items/cocacola.png',
    'html/img/items/coffe.png',
    'html/img/items/coke.png',
	'html/img/items/cocaine.png',
	'html/img/items/blowpipe.png',
	'html/img/items/cocaine_pooch.png',
	'html/img/items/meth.png',
	'html/img/items/meth_pooch.png',
	'html/img/items/defibrillators.png',
    'html/img/items/hamburger.png',
    'html/img/items/cash.png',
    'html/img/items/chocolate.png',
	'html/img/items/coke_pooch.png',
	'html/img/items/bag.png',
	'html/img/items/weaponflashlight.png',
	'html/img/items/weapongrip.png',
	'html/img/items/weaponskin.png',
	'html/img/items/clip.png',
	'html/img/items/oxygen_mask.png',
    'html/img/items/jewels.png',
    'html/img/items/medikit.png',
    'html/img/items/tequila.png',
    'html/img/items/whisky.png',
    'html/img/items/limonade.png',
    'html/img/items/phone.png',
    'html/img/items/vodka.png',
    'html/img/items/water.png',
    'html/img/items/cupcake.png',
    'html/img/items/drpepper.png',
    'html/img/items/energy.png',
	'html/img/items/datissin.png',
    'html/img/items/croquettes.png',
    'html/img/items/bolpistache.png',
    'html/img/items/bolnoixcajou.png',
	'html/img/items/drill.png',
    'html/img/items/minus.png',
    'html/img/items/plongee1.png',
    'html/img/items/plongee2.png',
    'html/img/items/bolcacahuetes.png',
	'html/img/items/marijuana_cigarette.png',
	'html/img/items/bong.png',
    'html/img/items/fixkit.png',
    'html/img/items/bolchips.png',
    'html/img/items/black_money.png',
	'html/img/items/WEAPON_MACHETE.png',
    'html/img/items/WEAPON_APPISTOL.png',
    'html/img/items/WEAPON_ASSAULTRIFLE.png',
    'html/img/items/WEAPON_ASSAULTSHOTGUN.png',
    'html/img/items/WEAPON_BOTTLE.png',
    'html/img/items/WEAPON_BULLPUPRIFLE.png',
    'html/img/items/WEAPON_CARBINERIFLE.png',
    'html/img/items/WEAPON_COMBATMG.png',
    'html/img/items/WEAPON_BAT.png',
    'html/img/items/WEAPON_COMBATPISTOL.png',
    'html/img/items/WEAPON_CROWBAR.png',
    'html/img/items/WEAPON_GOLFCLUB.png',
    'html/img/items/WEAPON_KNIFE.png',
    'html/img/items/WEAPON_MICROSMG.png',
    'html/img/items/WEAPON_NIGHTSTICK.png',
    'html/img/items/WEAPON_HAMMER.png',
    'html/img/items/WEAPON_PISTOL.png',
    'html/img/items/WEAPON_PUMPSHOTGUN.png',
    'html/img/items/WEAPON_SAWNOFFSHOTGUN.png',
    'html/img/items/WEAPON_SMG.png',
    'html/img/items/WEAPON_STUNGUN.png',
    'html/img/items/WEAPON_SPECIALCARBINE.png',
    'html/img/items/WEAPON_KNUCKLE.png',
    'html/img/items/WEAPON_FLASHLIGHT.png',
    'html/img/items/WEAPON_REVOLVER.png',
	'html/img/items/WEAPON_HATCHET.png',
    'html/img/items/WEAPON_DAGGER.png',
    'html/img/items/WEAPON_PETROLCAN.png',
    'html/img/items/WEAPON_PISTOL50.png',
    'html/img/items/WEAPON_DBSHOTGUN.png',
    'html/img/items/WEAPON_SWITCHBLADE.png',
    'html/img/items/WEAPON_POOLCUE.png'
}
