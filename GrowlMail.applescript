-- Register with Growl

tell application "Growl"
	set the allNotificationsList to {"New Mail"}
	set the enabledNotificationsList to {"New Mail"}
	register as application "GrowlMail" all notifications allNotificationsList default notifications enabledNotificationsList icon of application "Mail"
end tell

-- Loop through messages and display Growl notification(s)

using terms from application "Mail"
	on perform mail action with messages these_messages for rule this_rule
		tell application "Mail"
			
			set the message_count to the count of these_messages
			
			if message_count is greater than 5 then
				
				tell application "Growl"
					notify with name "New Mail" title "New Mail" description "You have received " & message_count & " new messages" application name "GrowlMail"
				end tell
				
			else
				
				repeat with i from 1 to the message_count
					
					set this_message to item i of these_messages
					
					tell application "Growl"
						notify with name "New Mail" title "New Mail" description "You have received a new message" application name "GrowlMail"
					end tell
					
				end repeat
				
			end if
			
		end tell
	end perform mail action with messages
end using terms from