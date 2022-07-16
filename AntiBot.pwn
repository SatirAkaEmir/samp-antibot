																																																																																					/*
	Anti Bot v0.1
	github.com/SatirAkaEmir/samp-antibot
	Credits - Satir
																																																																																																												*/
#include <a_samp>

main()
{
	print("Anti Bot Scripti Yükleniyor... ~ by Satir");
}
//================================DEFINE=========================================
#define MAX_BOT_BAGLANTI 2  //Aynı IP'den En Fazla 2 Bağlantı Yapılabilir. (Değiştirebilirsiniz)
//================================PUBLICS========================================
public OnFilterScriptInit()
{
	print("Anti Bot Scripti Yüklendi.");
	print("~by Satir~");
	return 1;
}
//================================ONFILTERSCRIPTEXIT=============================
public OnFilterScriptExit()
{
	print("Anti Bot Scripti Silindi. ~ by Satir");
	return 1;
}
public OnPlayerConnect(playerid)
{
	new PlayerName[25];
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	if(IPSayisi(IPCek(playerid)) >= MAX_BOT_BAGLANTI) return BotBanla(playerid), 0;
	printf("%s Sunucuya Bağlandı.", PlayerName);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	new PlayerName[25];
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	printf("%s Sunucudan Ayrıldı.", PlayerName);
	return 1;
}
//================================STOCKS=========================================
stock IPSayisi(const ip[]) // Bir IP'den kaç bağlantı olduğunu sayar.
{
	new b = 0;
	for(new i = 0; i < MAX_PLAYERS; i++)
	if(IsPlayerConnected(i) && !strcmp(IPCek(i),ip)) b++;
	return b;
}
stock IPCek(playerid) // Oyuncunun IP'sini çeker.
{
	new ip[16];
	GetPlayerIp(playerid, ip, sizeof(ip));
	return ip;
}
stock BotBanla(playerid) // Oyuncuyu banlar.
{
	new PlayerName[25];
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	printf("%s Aynı Anda Çok Fazla Bağlantı Yaptığı için Banlandı.", PlayerName);
	Ban(playerid);
	return 1;
}
//================================Script Sonu==============================
