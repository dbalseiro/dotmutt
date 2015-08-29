#!/usr/bin/osascript
global contactFirstName, contactLastName, contactEmail, labelEmail

on print_contact()
	return contactFirstName & " " & contactLastName & " [" & contactEmail & " (" & labelEmail & ")]"
end print_contact

on create_email(p)
	tell application "Contacts"
		make new email at end of emails of p with properties {label:labelEmail, value:contactEmail}
	end tell
end create_email

on create_contact()
	tell application "Contacts"
		set thePerson to make new person with properties {first name:contactFirstName, last name:contactLastName}
		my create_email(thePerson)
		save
	end tell
end create_contact

on add_email(p)
	tell application "Contacts"
		if contactEmail is in (get value of emails of p) then
			return "email already in contact"
		else
			my create_email(p)
			return "email added " & my print_contact()
		end if
	end tell
end add_email

on add_contact()
	tell application "Contacts"
		repeat with p in people
			if (first name of p as string is equal to contactFirstName) and (last name of p as string is equal to contactLastName) then
				return my add_email(p)
			end if
		end repeat
		my create_contact()
		return "new contact created: " & my print_contact()
	end tell
end add_contact

on run (arguments)
    set contactFirstName to first item of arguments
    set contactLastName to second item of arguments
    set contactEmail to third item of arguments
    set labelEmail to fourth item of arguments

    my add_contact()
end run

