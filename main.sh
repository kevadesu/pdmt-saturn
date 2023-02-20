#!/bin/bash

main() {
	read -p "pdmt> " pdmt_cmd
	case "$pdmt_cmd" in
		m|mark)
			echo "
			nsfw - 18+ Adult content, gore etc.
			wrong-channel - User didn't post the content in its intended channel
			spam-flood - User is sending spam or flooding the chat
			disrespect - User is disrespecting
			illegal-material - User sent illegal material
			leak - Self explanatory
			defamation - User is gossiping about someone, defaming them or talking bad about them.
			mod-abuse - Mod abusing powers
			tos - User is violating platform's TOS
			minimod - User is minimodding
			other - Other"
			read -p "pdmt/mark> " pdmt_mark
			case "$pdmt_mark" in
				nsfw)
					pdmt_ruleviolation="NSFW"
				;;
				wrong-channel)
					pdmt_ruleviolation="Wrong channel"
				;;
				spam-flood)
					pdmt_ruleviolation="Spam/Flood"
				;;
				disrespect)
					pdmt_ruleviolation="Disrespect"
				;;
				illegal-material)
					pdmt_ruleviolation="Illegal material"
				;;
				leak)
					pdmt_ruleviolation="Leak"
				;;
				defamation)
					pdmt_ruleviolation="Defamation/Gossip"
				;;
				mod-abuse)
					pdmt_ruleviolation="Mod abuse"
				;;
				tos)
					pdmt_ruleviolation="TOS Viol."
				;;
				minimod)
					pdmt_ruleviolation="Minimodding"
				;;
				
				other)
					pdmt_ruleviolation="Other"
				;;
				*)
					echo "!: Invalid ruleviolation mark!"
					main
				;;
			esac
			main
		;;
		l|msglk)
			read -p "pdmt/link> " pdmt_link
			pdmt_msglink=$pdmt_link
			main
		;;
		d|desc)
			read -p "pdmt/desc> " pdmt_desc
			pdmt_desc="$pdmt_desc"
			main
		;;
		u|user)
			read -p "pdmt/user> " pdmt_user
			pdmt_user="$pdmt_user"
			main
		;;
		e|export)
			echo "
----------
$(date)
----------
Message marked as: $pdmt_ruleviolation
----------
Description: $pdmt_desc
----------
Message link: $pdmt_msglink
----------
User committing offence: $pdmt_user
----------
Ticket generated with PDMT-SATURN 
			"
			echo "Copy the message and send it to your moderation chat or your admin"
			main
		;;
		discard)
			pdmt_ruleviolation=
			pdmt_desc=
			pdmt_msglink=
			pdmt_user=
		;;
		q|quit)
			read -p "Do you really want to quit PDMT? [y/n]"
			case "$yn" in
			y)
				exit
			;;
			n)
				main
			;;
			*)
				main
			;;
			esac
		;;
		h|help)
			echo "
m/mark - Use this command to mark which rule has been violated in the message
l/msglk - Use this command to add the message link in one line (with commas)
d/desc - Use this command to add an additional description
u/user - Add the username of the person who committed the rule violation
e/export - Use this command to export the ticket
q/quit - Quit the *P*inoya*D*B *M*oderation *T*ool
discard - Discard changes without warning
			"
			main
		;;
		*)
			echo "!: invalid command, check command list using h or help"
			main
		;;
	esac
}

echo "Welcome to PDMT
Check commands first with the command 'h' or 'help' before using this program."
main
