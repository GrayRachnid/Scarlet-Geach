// High-heeled footwear with height-boosting properties

/obj/item/clothing/shoes/roguetown/heels
	name = "heels"
	desc = "High-heeled shoes that add height and elegance."
	gender = PLURAL
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	body_height_offset = 1  // Height boost level

/obj/item/clothing/shoes/roguetown/heels/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, FOOTSTEP_MOB_HEELS, 70, 0)

/obj/item/clothing/shoes/roguetown/heels/greyscale
	name = "heels"
	desc = "Elegant open-top heels with a tall narrow heel. The simple design can be dyed any color."
	icon_state = "greyscaleheels"
	item_state = "testgreyscale"
	color = "#8B7355" // Default brown leather color
	sellprice = 30
	var/atom/movable/holdingknife = "blocked" // Prevents knife storage

/obj/item/clothing/shoes/roguetown/heels/leather
	name = "leather heel boots"
	desc = "Knee-high boots with tall heels, crafted from fine leather. Iron bars can be added for decorative buckles."
	icon_state = "leatherheelboots"
	item_state = "leatherheelboots"
	color = null
	max_integrity = 80  // Same as regular leather boots
	armor = ARMOR_BOOTS_BAD
	sellprice = 27
	body_height_offset = 3
	var/has_buckles = FALSE

/obj/item/clothing/shoes/roguetown/heels/leather/attackby(obj/item/W, mob/living/carbon/user, params)
	if(istype(W, /obj/item/ingot/iron))
		if(has_buckles)
			to_chat(user, span_warning("[src] already has buckles attached."))
			return
		
		if(do_after(user, 4 SECONDS, target = src))
			to_chat(user, span_notice("I carefully attach iron buckles to [src]."))
			qdel(W)
			has_buckles = TRUE
			detail_tag = "_detail"
			update_icon()
			if(ismob(loc))
				var/mob/M = loc
				M.update_inv_shoes()
		return
	
	return ..()

/obj/item/clothing/shoes/roguetown/heels/leather/update_icon()
	cut_overlays()
	if(has_buckles && detail_tag)
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		add_overlay(pic)

/obj/item/clothing/shoes/roguetown/heels/leather/reinforced
	name = "hardened leather heel boots"
	desc = "Sturdy heeled boots stitched together from cured leather. Firm and stylish."
	icon_state = "leatherheelboots"
	item_state = "leatherheelboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 100  // Same as reinforced boots
	armor = ARMOR_BOOTS
	sellprice = 35

/obj/item/clothing/shoes/roguetown/heels/black
	name = "black heel boots"
	desc = "Knee to thigh-high boots with imposing heels, made from darkened leather. Iron bars can be added for decorative buckles."
	icon_state = "blackheelboots"
	item_state = "blackheelboots"
	color = null
	max_integrity = 80  // Same as regular leather boots
	armor = ARMOR_BOOTS_BAD
	sellprice = 45
	body_height_offset = 4
	var/has_buckles = FALSE
	var/shiftable = TRUE
	var/shifted = FALSE

/obj/item/clothing/shoes/roguetown/heels/black/attackby(obj/item/W, mob/living/carbon/user, params)
	if(istype(W, /obj/item/ingot/iron))
		if(has_buckles)
			to_chat(user, span_warning("[src] already has buckles attached."))
			return
		
		if(do_after(user, 4 SECONDS, target = src))
			to_chat(user, span_notice("I carefully attach iron buckles to [src]."))
			qdel(W)
			has_buckles = TRUE
			detail_tag = "_detail"
			update_icon()
			if(ismob(loc))
				var/mob/M = loc
				M.update_inv_shoes()
		return
	
	return ..()

/obj/item/clothing/shoes/roguetown/heels/black/attack_right(mob/user)
	if(!shiftable)
		return
	if(shifted)
		if(alert("Would you like to wear your boots normally? -Removes greyscaling.",,"Yes","No") != "No")
			icon_state = "blackheelboots"
			item_state = "blackheelboots"
			color = null
			update_icon()
			shifted = FALSE
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_shoes()
			return
	else
		if(alert("Would you like to wear your boots colorfully? -Adds Greyscaling.",,"Yes","No") != "No")
			icon_state = "gblackheelboots"
			item_state = "gblackheelboots"
			color = null
			update_icon()
			shifted = TRUE
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_shoes()
			return

/obj/item/clothing/shoes/roguetown/heels/black/update_icon()
	cut_overlays()
	if(has_buckles && detail_tag)
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		add_overlay(pic)

/obj/item/clothing/shoes/roguetown/heels/gaudy
	name = "gaudy heels"
	desc = "Ostentatious golden heels that proclaim wealth and status. A decorative rose can be attached."
	icon_state = "gaudyheels"
	item_state = "gaudyheels"
	color = null
	sellprice = 50
	var/atom/movable/holdingknife = "blocked" // Prevents knife storage
	var/has_rose = FALSE
	var/shiftable = TRUE
	var/shifted = FALSE

/obj/item/clothing/shoes/roguetown/heels/gaudy/attack_right(mob/user)
	if(!shiftable)
		return
	if(shifted)
		if(alert("Would you like to wear your boots normally? -Removes greyscaling.",,"Yes","No") != "No")
			icon_state = "gaudyheels"
			item_state = "gaudyheels"
			color = null
			update_icon()
			shifted = FALSE
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_shoes()
			return
	else
		if(alert("Would you like to wear your heels colorfully? -Adds Greyscaling.",,"Yes","No") != "No")
			icon_state = "ggaudyheels"
			item_state = "ggaudyheels"
			color = null
			update_icon()
			shifted = TRUE
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_shoes()
			return

/obj/item/clothing/shoes/roguetown/heels/gaudy/attackby(obj/item/W, mob/living/carbon/user, params)
	if(istype(W, /obj/item/carvedgem/rose))
		if(has_rose)
			to_chat(user, span_warning("[src] already has a decorative rose attached."))
			return
		
		if(do_after(user, 4 SECONDS, target = src))
			to_chat(user, span_notice("I carefully attach the decorative rose to [src]."))
			qdel(W)
			has_rose = TRUE
			detail_tag = "_detail"
			update_icon()
			if(ismob(loc))
				var/mob/M = loc
				M.update_inv_shoes()
		return
	
	return ..()

/obj/item/clothing/shoes/roguetown/heels/gaudy/update_icon()
	cut_overlays()
	if(has_rose && detail_tag)
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		add_overlay(pic)
