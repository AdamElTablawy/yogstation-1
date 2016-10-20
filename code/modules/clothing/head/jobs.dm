
//Bartender //it's chef what the fuck is your problem?
/obj/item/clothing/head/chefhat
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chef"
	item_state = "chef"
	desc = "The commander in chef's head wear."
	strip_delay = 10
	put_on_delay = 10

	dog_fashion = /datum/dog_fashion/head/chef

/obj/item/clothing/head/chefhat/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is donning [src]! It looks like they're trying to become a chef.</span>")
	user.say("Bork Bork Bork!")
	sleep(20)
	user.visible_message("<span class='suicide'>[user] climbs into an imaginary oven!</span>")
	user.say("BOOORK!")
	playsound(user, 'sound/machines/ding.ogg', 50, 1)
	return(FIRELOSS)

//Captain
/obj/item/clothing/head/caphat
	name = "captain's hat"
	desc = "It's good being the king."
	icon_state = "captain"
	item_state = "that"
	flags_inv = 0
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	armor = list(melee = 35, bullet = 35, laser = 25, energy = 10, bomb = 25, bio = 0, rad = 0)
	strip_delay = 60

	dog_fashion = /datum/dog_fashion/head/captain

/obj/item/clothing/head/caphat/parade
	name = "captain's parade cap"
	desc = "Worn only by Captains with an abundance of class."
	icon_state = "capcap"

	dog_fashion = null


//Head of Personnel
/obj/item/clothing/head/hopcap
	name = "head of personnel's cap"
	icon_state = "hopcap"
	desc = "The symbol of true bureaucratic micromanagement."
	armor = list(melee = 25, bullet = 15, laser = 25, energy = 10, bomb = 25, bio = 0, rad = 0)

	dog_fashion = /datum/dog_fashion/head/hop

//Chaplain
/obj/item/clothing/head/nun_hood
	name = "nun hood"
	desc = "Maximum piety in this star system."
	icon_state = "nun_hood"
	flags_inv = HIDEHAIR
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/det_hat
	name = "detective's fedora"
	desc = "There's only one man who can sniff out the dirty stench of crime, and he's likely wearing this hat."
	icon_state = "detective"
	armor = list(melee = 25, bullet = 35, laser = 25, energy = 10, bomb = 100, bio = 0, rad = 0) //it seems fitting that if the det is killed by a bomb the only remaining thing is his slightly scuffed hat
	var/candy_cooldown = 0

	dog_fashion = /datum/dog_fashion/head/detective

/obj/item/clothing/head/det_hat/AltClick()
	..()
	if(ismob(loc))
		var/mob/M = loc
		if(candy_cooldown < world.time)
			var/obj/item/weapon/reagent_containers/food/snacks/candy_corn/CC = new /obj/item/weapon/reagent_containers/food/snacks/candy_corn(src)
			M.put_in_hands(CC)
			M << "You slip a candy corn from your hat."
			candy_cooldown = world.time+1200
		else
			M << "You just took a candy corn! You should wait a couple minutes, lest you burn through your stash."

/obj/item/clothing/head/det_hat/evil
	name = "syndicate fedora"
	icon_state = "syndicate_fedora"
	desc = "A suspicious black fedora with a red band."
	w_class = 4
	throw_speed = 4
	embedded_pain_multiplier = 4
	sharpness = IS_BLUNT
	hitsound = 'sound/weapons/Genhit.ogg'
	attack_verb = list("poked", "tipped")
	var/extended = 0

/obj/item/clothing/head/det_hat/evil/attack_self(mob/user)
	extended = !extended
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, 1)
	if(extended)
		force = 15
		throwforce = 40
		embed_chance = 100
		sharpness = IS_SHARP
		icon_state = "syndicate_fedora_sharp"
		attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut", "tipped")
		hitsound = 'sound/weapons/bladeslice.ogg'
	else
		force = 0
		throwforce = 0
		embed_chance = 0
		sharpness = IS_BLUNT
		icon_state = "syndicate_fedora"
		attack_verb = list("poked", "tipped")
		hitsound = 'sound/weapons/Genhit.ogg'


//Mime
/obj/item/clothing/head/beret
	name = "beret"
	desc = "A beret, a mime's favorite headwear."
	icon_state = "beret"

	dog_fashion = /datum/dog_fashion/head/beret


//Security

/obj/item/clothing/head/HoS
	name = "head of security cap"
	desc = "The robust standard-issue cap of the Head of Security. For showing the officers who's in charge."
	icon_state = "hoscap"
	armor = list(melee = 50, bullet = 40, laser = 45, energy = 20, bomb = 25, bio = 10, rad = 0)
	strip_delay = 80

/obj/item/clothing/head/HoS/beret
	name = "head of security beret"
	desc = "A robust beret for the Head of Security, for looking stylish while not sacrificing protection."
	icon_state = "hosberetblack"

/obj/item/clothing/head/warden
	name = "warden's police hat"
	desc = "It's a special armored hat issued to the Warden of a security force. Protects the head from impacts."
	icon_state = "policehelm"
	armor = list(melee = 45, bullet = 25, laser = 35, energy = 10, bomb = 25, bio = 0, rad = 0)
	strip_delay = 60

	dog_fashion = /datum/dog_fashion/head/warden

/obj/item/clothing/head/beret/sec
	name = "security beret"
	desc = "A robust beret with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficent protection."
	icon_state = "beret_badge"
	armor = list(melee = 35, bullet = 30, laser = 35,energy = 10, bomb = 25, bio = 0, rad = 0)
	strip_delay = 60
	dog_fashion = null

/obj/item/clothing/head/beret/sec/navyhos
	name = "head of security's beret"
	desc = "A special beret with the Head of Security's insignia emblazoned on it. A symbol of excellence, a badge of courage, a mark of distinction."
	icon_state = "hosberet"

/obj/item/clothing/head/beret/sec/navywarden
	name = "warden's beret"
	desc = "A special beret with the Warden's insignia emblazoned on it. For wardens with class."
	icon_state = "wardenberet"
	armor = list(melee = 45, bullet = 25, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)
	strip_delay = 60

/obj/item/clothing/head/beret/sec/navyofficer
	desc = "A special beret with the security insignia emblazoned on it. For officers with class."
	icon_state = "officerberet"

//Clerk
/obj/item/clothing/head/clerkcap
	name = "clerk's hat"
	desc = "It's a hat used by clerk's to help keep dust out of thier eyes."
	icon_state = "clerkcap"
	item_state = "clerkcap"
