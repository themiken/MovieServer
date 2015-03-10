/* a Movie Server create by #Mikee*/
//// Includes
#include <a_samp>
#include <zcmd>
#include <sscanf2>
/////////
#undef MAX_PLAYERS
/////// Defines
#define MAX_PLAYERS 50
#define COLOR_BLACK 0x00000000
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_GREEN 0x9EC73DAA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xDABB3EAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_GREY 0xAFAFAFAA
/////////////enums
enum DataUser
{
    PASSWORD,
    ADMIN,
    SCORE
};

////////////////////////Var
new pInfo[MAX_PLAYERS][DataUser];
///////////////// Dialog
#define WEAPON_DIALOG_ID 1
//Vehicle Names
new VehicleNames[212][] =
{
        {"Landstalker"},
        {"Bravura"},
        {"Buffalo"},
        {"Linerunner"},
        {"Perrenial"},
        {"Sentinel"},
        {"Dumper"},
        {"Firetruck"},
        {"Trashmaster"},
        {"Stretch"},
        {"Manana"},
        {"Infernus"},
        {"Voodoo"},
        {"Pony"},
        {"Mule"},
        {"Cheetah"},
        {"Ambulance"},
        {"Leviathan"},
        {"Moonbeam"},
        {"Esperanto"},
        {"Taxi"},
        {"Washington"},
        {"Bobcat"},
        {"Mr Whoopee"},
        {"BF Injection"},
        {"Hunter"},
        {"Premier"},
        {"Enforcer"},
        {"Securicar"},
        {"Banshee"},
        {"Predator"},
        {"Bus"},
        {"Rhino"},
        {"Barracks"},
        {"Hotknife"},
        {"Trailer 1"},
        {"Previon"},
        {"Coach"},
        {"Cabbie"},
        {"Stallion"},
        {"Rumpo"},
        {"RC Bandit"},
        {"Romero"},
        {"Packer"},
        {"Monster"},
        {"Admiral"},
        {"Squalo"},
        {"Seasparrow"},
        {"Pizzaboy"},
        {"Tram"},
        {"Trailer 2"},
        {"Turismo"},
        {"Speeder"},
        {"Reefer"},
        {"Tropic"},
        {"Flatbed"},
        {"Yankee"},
        {"Caddy"},
        {"Solair"},
        {"Berkley's RC Van"},
        {"Skimmer"},
        {"PCJ-600"},
        {"Faggio"},
        {"Freeway"},
        {"RC Baron"},
        {"RC Raider"},
        {"Glendale"},
        {"Oceanic"},
        {"Sanchez"},
        {"Sparrow"},
        {"Patriot"},
        {"Quad"},
        {"Coastguard"},
        {"Dinghy"},
        {"Hermes"},
        {"Sabre"},
        {"Rustler"},
        {"ZR-350"},
        {"Walton"},
        {"Regina"},
        {"Comet"},
        {"BMX"},
        {"Burrito"},
        {"Camper"},
        {"Marquis"},
        {"Baggage"},
        {"Dozer"},
        {"Maverick"},
        {"News Chopper"},
        {"Rancher"},
        {"FBI Rancher"},
        {"Virgo"},
        {"Greenwood"},
        {"Jetmax"},
        {"Hotring"},
        {"Sandking"},
        {"Blista Compact"},
        {"Police Maverick"},
        {"Boxville"},
        {"Benson"},
        {"Mesa"},
        {"RC Goblin"},
        {"Hotring Racer A"},
        {"Hotring Racer B"},
        {"Bloodring Banger"},
        {"Rancher"},
        {"Super GT"},
        {"Elegant"},
        {"Journey"},
        {"Bike"},
        {"Mountain Bike"},
        {"Beagle"},
        {"Cropdust"},
        {"Stunt"},
        {"Tanker"},
        {"Roadtrain"},
        {"Nebula"},
        {"Majestic"},
        {"Buccaneer"},
        {"Shamal"},
        {"Hydra"},
        {"FCR-900"},
        {"NRG-500"},
        {"HPV1000"},
        {"Cement Truck"},
        {"Tow Truck"},
        {"Fortune"},
        {"Cadrona"},
        {"FBI Truck"},
        {"Willard"},
        {"Forklift"},
        {"Tractor"},
        {"Combine"},
        {"Feltzer"},
        {"Remington"},
        {"Slamvan"},
        {"Blade"},
        {"Freight"},
        {"Streak"},
        {"Vortex"},
        {"Vincent"},
        {"Bullet"},
        {"Clover"},
        {"Sadler"},
        {"Firetruck LA"},
        {"Hustler"},
        {"Intruder"},
        {"Primo"},
        {"Cargobob"},
        {"Tampa"},
        {"Sunrise"},
        {"Merit"},
        {"Utility"},
        {"Nevada"},
        {"Yosemite"},
        {"Windsor"},
        {"Monster A"},
        {"Monster B"},
        {"Uranus"},
        {"Jester"},
        {"Sultan"},
        {"Stratum"},
        {"Elegy"},
        {"Raindance"},
        {"RC Tiger"},
        {"Flash"},
        {"Tahoma"},
        {"Savanna"},
        {"Bandito"},
        {"Freight Flat"},
        {"Streak Carriage"},
        {"Kart"},
        {"Mower"},
        {"Duneride"},
        {"Sweeper"},
        {"Broadway"},
        {"Tornado"},
        {"AT-400"},
        {"DFT-30"},
        {"Huntley"},
        {"Stafford"},
        {"BF-400"},
        {"Newsvan"},
        {"Tug"},
        {"Trailer 3"},
        {"Emperor"},
        {"Wayfarer"},
        {"Euros"},
        {"Hotdog"},
        {"Club"},
        {"Freight Carriage"},
        {"Trailer 3"},
        {"Andromada"},
        {"Dodo"},
        {"RC Cam"},
        {"Launch"},
        {"Police Car (LSPD)"},
        {"Police Car (SFPD)"},
        {"Police Car (LVPD)"},
        {"Police Ranger"},
        {"Picador"},
        {"S.W.A.T. Van"},
        {"Alpha"},
        {"Phoenix"},
        {"Glendale"},
        {"Sadler"},
        {"Luggage Trailer A"},
        {"Luggage Trailer B"},
        {"Stair Trailer"},
        {"Boxville"},
        {"Farm Plow"},
        {"Utility Trailer"}
};
// Nombres armas
new WeaponNames[47][] =
{
        {"Unarmed"},
        {"Brass Knuckles"},
        {"Golf Club"},
        {"Nite Stick"},
        {"Knife"},
        {"Baseball Bat"},
        {"Shovel"},
        {"Pool Cue"},
        {"Katana"},
        {"Chainsaw"},
        {"Purple Dildo"},
        {"Smal White Vibrator"},
        {"Large White Vibrator"},
        {"Silver Vibrator"},
        {"Flowers"},
        {"Cane"},
        {"Grenade"},
        {"Tear Gas"},
        {"Molotov Cocktail"},
        {""},
        {""},
        {""},
        {"9mm"},
        {"Silenced 9mm"},
        {"Desert Eagle"},
        {"Shotgun"},
        {"Sawn-off Shotgun"},
        {"Combat Shotgun"},
        {"Micro SMG"},
        {"MP5"},
        {"AK-47"},
        {"M4"},
        {"Tec9"},
        {"Country Rifle"},
        {"Sniper Rifle"},
        {"Rocket Launcher"},
        {"HS Rocket Launcher"},
        {"Flamethrower"},
        {"Minigun"},
        {"Satchel Charge"},
        {"Detonator"},
        {"Spraycan"},
        {"Fire Extinguisher"},
        {"Camera"},
        {"Nightvision Goggles"},
        {"Thermal Goggles"},
        {"Parachute"}
};

/////////////////////////////////////////////////////////////////////////////////

main()
{
	print("\n----------------------------------");
	print("-------------Movie Server-----------");
	print("----------------------------------\n");
}



public OnGameModeInit()
{
	SetGameModeText("Movie Server");
    AddPlayerClass(0,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(1,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(2,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(3,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(4,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(5,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(6,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(7,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(8,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(9,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(10,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(11,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(12,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(13,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(14,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(15,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(16,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(17,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(18,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(19,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(20,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(21,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(22,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(23,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(24,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(25,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(26,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(27,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(28,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(29,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(30,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(31,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(32,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(33,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(34,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(35,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(36,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(37,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(38,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(39,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(40,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(41,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(42,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(43,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(44,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(45,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(46,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(47,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(48,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(49,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(50,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(51,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(52,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(53,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(54,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(55,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(56,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(57,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(58,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(59,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(60,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(61,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(62,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(63,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(64,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(65,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(66,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(67,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(68,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(69,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(70,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(71,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(72,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(73,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(74,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(75,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(76,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(77,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(78,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(79,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(80,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(81,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(82,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(83,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(84,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(85,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(86,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(87,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(88,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(89,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(90,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(91,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(92,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(93,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(94,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(95,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(96,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(97,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(98,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(99,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(100,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(101,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(102,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(103,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(104,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(105,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(106,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(107,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(108,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(109,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(110,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(111,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(112,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(113,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(114,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(115,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(116,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(117,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(118,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(119,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(120,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(121,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(122,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(123,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(124,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(125,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(126,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(127,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(128,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(129,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(130,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(131,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(132,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(133,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(134,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(135,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(136,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(137,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(138,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(139,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(140,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(141,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(142,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(143,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(144,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(145,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(146,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(147,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(148,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(149,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(150,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(151,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(152,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(153,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(154,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(155,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(156,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(157,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(158,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(159,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(160,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(161,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(162,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(163,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(164,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(165,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(166,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(167,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(168,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(169,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(170,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(171,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(172,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(173,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(174,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(175,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(176,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(177,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(178,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(179,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(180,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(181,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(182,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(183,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(184,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(185,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(186,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(187,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(188,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(189,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(190,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(191,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(192,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(193,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(194,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(195,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(196,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(197,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(198,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(199,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(200,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(201,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(202,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(203,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(204,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(205,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(206,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(207,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(208,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(209,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(210,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(211,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(212,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(213,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(214,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(215,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(216,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(217,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(218,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(219,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(220,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(221,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(222,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(223,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(224,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(225,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(226,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(227,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(228,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(229,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(230,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(231,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(232,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(233,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(234,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(235,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(236,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(237,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(238,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(239,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(240,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(241,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(242,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(243,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(244,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(245,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(246,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(247,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(248,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(249,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(250,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(251,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(252,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(253,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(254,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(255,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(256,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(257,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(258,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(259,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(260,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(261,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(262,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(263,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(264,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(265,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(266,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(267,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(268,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(269,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(270,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(271,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(272,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(273,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(274,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(275,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(276,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(277,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(278,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(279,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(280,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(281,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(282,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(283,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(284,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(285,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(286,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(287,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(288,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(289,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(290,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(291,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(292,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(293,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(294,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(295,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(296,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(297,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(298,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);
    AddPlayerClass(299,2175.6648,1285.7250,42.2241,89.6379,0,0,0,0,0,0);



	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid,2175.6648,1285.7250,42.2241);
	SetPlayerCameraPos(playerid, 2150.5767,1298.5627,35.0023);
	SetPlayerCameraLookAt(playerid, 2150.5767,1298.5627,35.0023);
	return 1;
}

public OnPlayerConnect(playerid)
{
    new text[24+MAX_PLAYER_NAME];
    format(text, sizeof(text), "%s ha entrado al servidor", GetPlayerNameForText(playerid));
    SendClientMessageToAll(COLOR_GREY, text);
	SendClientMessage(playerid, COLOR_YELLOW, "Welcome to the Movie server");

   
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, 2508.0098,-1667.2411,13.3924);
    GameTextForPlayer(playerid, "Welcome", 3000, 4);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	
	return SendClientMessage(playerid, COLOR_RED, "[SERVER]: Command error please use /help");
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
   	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(response == 1)
    {
        switch(dialogid)
        {
            case 1:
            {
                new weapons[] = {16,17,18,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,39,40,41,42,43,46};
                return GivePlayerWeapon(playerid, weapons[listitem], 500);
            }            
        }
    }
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

////////////////////////////////////// Commands //////////////////////////////////////
//////////////////// Register Command ////////////////
CMD:register(playerid, params[])
{
    new password[256];
    if(sscanf(params, "s", password)) return SendClientMessage(playerid, COLOR_RED, "[INFO] Use /register [password]");
    else
    {
        new string[256];
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));
        format(string, sizeof(string), "%s.ini", name);
        if(fexist(string))
        {
            SendClientMessage(playerid, COLOR_RED, "[INFO]: Su cuenta ya esta registrada");
        }
        else
        {
            new File:data = fopen(string, io_write);
            if(data)
            {
                new var[256];
                new pass[265];
                format(var, sizeof(var), "\r\nAdmin = %d", pInfo[playerid][ADMIN]);
                format(pass, sizeof(pass),"\r\nPassword = %s", password);
                fwrite(data, "[data]\r\n");
                fwrite(data, "Name = ");
                fwrite(data, name);
                fwrite(data, pass);
                fwrite(data, var);
                fclose(data);
            }

            SendClientMessage(playerid, COLOR_GREY, "[INFO]: Gracias por registrarte");
    }

    }
    return 1;
}

/////////////////////////////////////// Command Help ////////////////////////////////////////////////////////////
CMD:help(playerid, params[])
{
    ShowPlayerDialog(playerid, 1, 0, "Help", "Commands\n /register\n /health\n /w(eapon)\n /v(ehicle)\n /skin", "Next", "Close");
    return 1;
}

////////////////////// Command Health
CMD:health(playerid, params[])
{
	SetPlayerHealth(playerid, 100.0);
	return 1; 
}
////////////// Weapon
CMD:w(playerid, params[])
{
    ShowPlayerDialog(playerid, WEAPON_DIALOG_ID, 2, "Weapon","Grenade\nTear Gass\nMolotov Cocktail\n9mm\nSilenced 9mm\nDesert Eagle\nShotgun\nSawnoff Shotgun\nCombat Shotgun\nMicro Uzi\nMP5\nAK-47\nM4\nTec-9\nCountry Rifle\nSniper Rifle\nRPG\nHS Rocket\nFlamethower\nC4 Explosive\nC4 Detonator\nSpraycan\nFire Extinguisher\nCamera\nParachute", "Select", "Cancel");    
	return 1;
}

CMD:v(playerid, params[])
{
	new vehicleName[256];
	if(sscanf(params, "s", vehicleName)) return SendClientMessage(playerid, COLOR_RED, "[SERVER]: Command Error use /v [name vehicle]");
	else
	{
		new vehicle = GetVehicleModelIDFromName(vehicleName);
		if(vehicle < 400 || vehicle > 611) return SendClientMessage(playerid, COLOR_RED, "[SERVER]: Name of the vehicle no valid");
		else
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			CreateVehicle(vehicle, x+5, y+5, z, 0, 0, 0, 60);
			new mes[256];
			format(mes, sizeof(mes), "[SERVER]: Vehicle %s created", VehicleNames[vehicle -400]);
			SendClientMessage(playerid, COLOR_YELLOW, mes);
		}
	}
	
	return 1;
}

CMD:repair(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        SetVehicleHealth(vehicleid, 1000.0);
        SendClientMessage(playerid, COLOR_GREY, "[INFO]: Tu vehículo ha sido arreglado");
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[INFO]: No te encuentras en un vehÃ­culo");
    }
    return 1;
}

CMD:skin(playerid, params[])
{
    new skin;
    if(sscanf(params, "d", skin)) return SendClientMessage(playerid, COLOR_RED, "[INFO]: Use /skin [ID]");
    else
    {
        SetPlayerSkin(playerid, skin);
    }

    return 1;
}


//////////////////////////////////////////////////////////////////// Stock ///////////////////////////////////////////////////////////////////////////////////////////
stock GetPlayerNameForText(playerid)
{
    new name[MAX_PLAYER_NAME];
    new string[256];
    GetPlayerName(playerid, name, sizeof(name));
    format(string, sizeof(string), "%s", name);
    return string;
}

stock GetVehicleModelIDFromName(vname[])
{
    for(new i = 0; i < 211; i ++)
    {
        if(strfind(VehicleNames[i], vname, true) != -1)
            return i + 400;
    }

    return 1;
}

stock GetWeaponIDFromName(name[])
{
	for(new i = 0; i < 48; i++)
	{
		if(strfind(WeaponNames[i], name, true) != -1)
			return i;
	}
	return 1;
}


// stock ReadPlayerData(line, playerid)
// {
//     new string[256];
//     new name[MAX_PLAYER_NAME];
//     new File:player;
//     GetPlayerName(playerid, name, sizeof(name));
//     format(string,256,"%s.ini", name);
//     player = fopen(string, io_read);
//     for(new i = 0; i <= line; i++)
//     {
//         fread(player, string);
//         if(line == i)
//         {
//             fclose(player);
//             return string;
//         }        
//         return string;
//     }

    
// }

