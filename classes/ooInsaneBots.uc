//=============================================================================
// ooInsaneBots.
//=============================================================================
class ooInsaneBots expands Mutator config(ooInsaneBots);


var() config string botsToChange[32];
var() config float damageScale;
var() config int botHealth;

function scaleDamage(Pawn Other){

	local int i;
	local string currentName;

	currentName = Other.PlayerReplicationInfo.PlayerName;

	for(i = 0; i < 32; i++){
		
		if(botsToChange[i] ~= currentName){
		
			Other.DamageScaling = damageScale;
			Other.Health = botHealth;
			return;

		}
	}

}


function ModifyPlayer(Pawn Other){

	if(Other.PlayerReplicationInfo != None){

		scaleDamage(Other);
	}
	
	if(NextMutator != None){
		NextMutator.ModifyPlayer(Other);
	}
}

defaultproperties
{
     botsToChange(0)="Loque"
     botsToChange(1)="Tamerlane"
     damageScale=1000.000000
     botHealth=9999999
}
