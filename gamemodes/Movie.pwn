/* a Movie Server create by #Mikee*/
//// Includes
#include <a_samp>
#include <zcmd>
#include <sscanf2>
/// Defines
#define COLOR_BLACK 0x00000000
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_GREEN 0x9EC73DAA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xDABB3EAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_GREY 0xAFAFAFAA


////////////////////////Variables

//Nombres vehiculos
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

/////////////////
main()
{
	print("\n----------------------------------");
	print("-------------Movie Server-----------");
	print("----------------------------------\n");
}



public OnGameModeInit()
{
	SetGameModeText("Movie Server");
	AddPlayerClass(1, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid,2150.5767,1298.5627,35.0023);
	SetPlayerCameraPos(playerid, 2150.5767,1298.5627,35.0023);
	SetPlayerCameraLookAt(playerid, 2150.5767,1298.5627,35.0023);
	return 1;
}

public OnPlayerConnect(playerid)
{
	SendClientMessage(playerid, COLOR_YELLOW, "Welcome to the Movie server");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
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
	if(strcmp(cmdtext, "/ayuda", true) == 0)
	{
		SendClientMessage(playerid, COLOR_PINK, "Commando de auyda");
		return 1;
	}

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
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

////////////////////////////////////// Commands //////////////////////////////////////
CMD:help(playerid, params[])
{
    ShowPlayerDialog(playerid, 1, 0, "Help", "Commands\n /health\n /w(eapon)\n /v(ehicle)", "Next", "Close");
    return 1;
}

CMD:health(playerid, params[])
{
	SetPlayerHealth(playerid, 100.0);
	return 1; 
}

CMD:w(playerid, params[])
{
	new weaponid;
	if(sscanf(params, "i", weaponid)) return SendClientMessage(playerid, COLOR_RED, "[SERVER] Command error /w [ID Weapon]");
	else
	{
		GivePlayerWeapon(playerid, weaponid, 500);
	}
	return 1;
}

CMD:we(playerid, params[])
{
	new weaponName[256];
	if(sscanf(params, "s", weaponName)) return SendClientMessage(playerid, COLOR_RED, "[SERVER] Command error /we [Name of weapon]");
	else
	{
		new weapon = GetWeaponIDFromName(weaponName);
		GivePlayerWeapon(playerid, weapon, 500);
	}
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



///////////////////////// Stock //////////////////////
stock GetVehicleModelIDFromName(vname[])
{
        for(new i = 0; i < 211; i++)
        {
                if(strfind(VehicleNames[i], vname, true) != -1)
                return i + 400;
        }
        return -1;
}

stock GetWeaponIDFromName(name[])
{
	for(new i = 0; i < 48; i++)
	{
		if(strfind(WeaponNames[i], name, true) != -1)
			return i;
	}
	return -1;
}
