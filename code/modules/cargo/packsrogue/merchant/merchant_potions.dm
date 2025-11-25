// Merchant Potions. Merchant potions are meant to be relatively cost ineffective and set a CEILING for potion prices
// Normal potion brewer can and should undercut these prices. However this gives merchants more things to sell to fulfill their role as "adventurer shop"
// And hopefully generate demands for potions from other brewer who can offer it cheaper while improving access
// Yes, they are meant to have access to the high tier stat buff potion but not the second tier health or mana potions or any of the poison. (Not anymore)
/datum/supply_pack/rogue/potions
	group = "Potions"
	crate_name = "merchant guild's crate"
	mandated_public_profit = 0.5 // 50% Mandatory Profit Margin on top. Let's not make it too expensive for lowpop.
	crate_type = /obj/structure/closet/crate/chest/merchant

//Only two since that's 4 uses total; two sips each. You only need one sip for cure.
/datum/supply_pack/rogue/potions/rotcure
	name = "Rot Cure Potion"
	cost = 300
	contains = list(
					/obj/item/reagent_containers/glass/bottle/alchemical/rogue/rotcure,
					/obj/item/reagent_containers/glass/bottle/alchemical/rogue/rotcure,
				)

/datum/supply_pack/rogue/potions/healthpot
	name = "Healing Potion"
	cost = 50
	contains = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot)

/datum/supply_pack/rogue/potions/manapot
	name = "Mana Potion"
	cost = 50
	contains = list(/obj/item/reagent_containers/glass/bottle/rogue/manapot)

/datum/supply_pack/rogue/potions/stamina
	name = "Stamina Potion"
	cost = 50
	contains = list(/obj/item/reagent_containers/glass/bottle/rogue/stampot)

/datum/supply_pack/rogue/potions/antidote
	name = "Poison Antidote"
	cost = 35
	contains = list(/obj/item/reagent_containers/glass/bottle/rogue/antidote)
