	// NOTES:
	//
	// "ability_type":
	//	DOTA_ABILITY_TYPE_BASIC = 0 : 
	//  DOTA_ABILITY_TYPE_ULTIMATE = 1 :
	//  DOTA_ABILITY_TYPE_ATTRIBUTES = 2 : 
	//
	// "ability_behavoir":
	//	DOTA_ABILITY_BEHAVIOR_HIDDEN = 1 : This ability can be owned by a unit but can't be casted and wont show up on the HUD.
	//	DOTA_ABILITY_BEHAVIOR_PASSIVE = 2 : Can't be casted like above but this one shows up on the ability HUD
	//	DOTA_ABILITY_BEHAVIOR_NO_TARGET = 4 : Doesn't need a target to be cast, ability fires off as soon as the button is pressed
	//	DOTA_ABILITY_BEHAVIOR_UNIT_TARGET = 8 : Ability needs a target to be casted on.
	//	DOTA_ABILITY_BEHAVIOR_POINT = 16 : Ability can be cast anywhere the mouse cursor is (If a unit is clicked it will just be cast where the unit was standing)
	//	DOTA_ABILITY_BEHAVIOR_AOE = 32 : This ability draws a radius where the ability will have effect. YOU STILL NEED A TARGETTING BEHAVIOR LIKE DOTA_ABILITY_BEHAVIOR_POINT FOR THIS TO WORK.
	//	DOTA_ABILITY_BEHAVIOR_NOT_LEARNABLE = 64 : This ability probably can be casted or have a casting scheme but cannot be learned (these are usually abilities that are temporary like techie's bomb detonate)
	//	DOTA_ABILITY_BEHAVIOR_CHANNELLED = 128 : This abillity is channelled. If the user moves or is silenced the ability is interrupted.
	//	DOTA_ABILITY_BEHAVIOR_ITEM = 256 : This ability is tied up to an item.
	//	DOTA_ABILITY_BEHAVIOR_TOGGLE = 512 :  
	//
	// "ability_unit_target_type":
	//	DOTA_UNIT_TARGET_NONE = 0 :
	//	DOTA_UNIT_TARGET_FRIENDLY_HERO = 5 : 
	//  DOTA_UNIT_TARGET_FRIENDLY_BASIC = 9 :
	//	DOTA_UNIT_TARGET_FRIENDLY = 13 :
	//	DOTA_UNIT_TARGET_ENEMY_HERO = 6 :
	//	DOTA_UNIT_TARGET_ENEMY_BASIC = 10 :
	//	DOTA_UNIT_TARGET_ENEMY = 14 :
	//	DOTA_UNIT_TARGET_ALL = 15 :
	//

	//=================================================================================================================
	// Ability: Base 
	// Note: This is loaded and overriden/added to by values in the specific ability chunks.
	//=================================================================================================================

	//"ability_base"
	{
		// General
		//-------------------------------------------------------------------------------------------------------------
		//"ID"						        	"0"														// unique ID number for this ability.  Do not change this once established or it will invalidate collected stats.
		//"AbilityType"			     		"DOTA_ABILITY_TYPE_BASIC"
		//"AbilityBehavior"			    	"DOTA_ABILITY_BEHAVIOR_NONE"
		//"OnCastbar"						"1"
		//"OnLearnbar"				    	"1"
		//"FightRecapLevel"				"0"
	
		// Stats
		//-------------------------------------------------------------------------------------------------------------
		//"AbilityCastRange"			      	"0"
		//"AbilityCastRangeBuffer"		    "250"
		//"AbilityCastPoint"			        	"0.0 0.0 0.0 0.0"
		//"AbilityChannelTime"		    	"0.0 0.0 0.0 0.0"
		//"AbilityCooldown"			     	"0.0 0.0 0.0 0.0"
		//"AbilityDuration"				        "0.0 0.0 0.0 0.0"
		//"AbilitySharedCooldown"			""
		//"AbilityDamage"					    "0 0 0 0"
		//"AbilityManaCost"				    "0 0 0 0"
		//"AbilityModifierSupportValue"	"1.0"	// for stats tracking.
		//"AbilityModifierSupportBonus"	"0"		// for stats tracking.
		
		// Item Info	
		//-------------------------------------------------------------------------------------------------------------
		//"ItemCost"						    "0"
		//"ItemInitialCharges"			"0"
		//"ItemCombinable"				"1"
		//"ItemPermanent"					"1"
		//"ItemStackable"					"0"
		//"ItemRecipe"				    	"0"
		//"ItemDroppable"					"1"
		//"ItemPurchasable"				"1"
		//"ItemSellable"				    	"1"
		//"ItemRequiresCharges"		"0"
		//"ItemKillable"					    "1"
		//"ItemDisassemblable"			"0"
		//"ItemShareability"				"ITEM_NOT_SHAREABLE"
		//"ItemDeclaresPurchase"   	"0"
	}

	//=================================================================================================================
	// Ability: Attribute Bonus
	//=================================================================================================================
	"attribute_bonus"
	{
		// General
		//-------------------------------------------------------------------------------------------------------------
		"ID"					"5002"														// unique ID number for this ability.  Do not change this once established or it will invalidate collected stats.
		"AbilityType"					"DOTA_ABILITY_TYPE_ATTRIBUTES"
		"AbilityBehavior"				"DOTA_ABILITY_BEHAVIOR_PASSIVE"
		
		// Special
		//-------------------------------------------------------------------------------------------------------------
		"AbilitySpecial"
		{
			"01"
			{
				"var_type"						"FIELD_FLOAT"
				"attribute_bonus_per_level"		"2.0"
			}
		}
	}
	
	//=================================================================================================================
	// Alchemist: Goblin's Greed (CAPPING GOLD GAIN)
	//=================================================================================================================
	"alchemist_goblins_greed"
	{
		// General
		//-------------------------------------------------------------------------------------------------------------
		"ID"							"5368"														// unique ID number for this ability.  Do not change this once established or it will invalidate collected stats.
		"AbilityBehavior"				"DOTA_ABILITY_BEHAVIOR_PASSIVE"

		// Special	
		//-------------------------------------------------------------------------------------------------------------
		"AbilitySpecial"
		{
			"01"
			{
				"var_type"				"FIELD_INTEGER"
				"duration"				"30"
			}
			"02"
			{
				"var_type"				"FIELD_INTEGER"
				"bonus_gold"			"6 8 10 12"
			}
			"03"
			{
				"var_type"				"FIELD_INTEGER"
				"bonus_bonus_gold"		"3"
			}
			"04"
			{
				"var_type"				"FIELD_INTEGER"
				"bonus_gold_cap"		"12 20 28 36"
			}
		}
	}
	