# Approval Record View

Standard Approval Layouts are boring! So why not just display the entire Record Layout of the related record you want to approve?

<img src="https://github.com/dschibster/approval-record-view/blob/master/resources/screenshot.jpg?raw=true"/>

# How does it work?

There's two ways of going about it:

* If you want to only display the record layout of your target object, all you need to do is drag the component onto the Approval Request Lightning Page!
* If there is a related Record to this target object you want to check, then you can use the checkbox "Use Custom Config?" to traverse the field relationships of your Target Object up to the record Id you need. For Contact, just use "AccountId", for example, to check the Account Layout!
  * For this to work, you need to create a new record in the "Approval Record View Id" Custom Metadata Type. Make Sure that the DeveloperName of your Custom Metadata Record is identical to the DeveloperName of the Approval Process you want to have a custom record lookup to! 
  
As Approval Pages are normally one-for-all in the entire org, the setting you use is going to be universal. If you decide to use a custom config, those that do not have any will still default to the normal record id. No worries!
  
# But Dennis, how do I do that?

That's where we trick Salesforce into showing us the Lightning Page! While you're not able to open Approval Request in the Object Manager by itself, going into an Object's setup page and replacing the API Name of the Object in the URL with `ProcessInstanceWorkItem` will bring you to that very page! There, you can create a new Lightning Page and go nuts!

The easier way however is to simply open an Approval Request record, then clicking the cog icon and using the "Edit Page" option to directly edit the current (old) Approval Request Layout. Don't forget to make your edited page the Org Default, though!

# Some maintenance is necessary

This is currently not pre-packaged (thought it might be in the future) because of the necessity to always have a valid Approval Process at the end of the day. That means that the Test Class will probably look different on your org than on my Scratch Org. Feel free to copy-paste the contents of the force-app folder into your org and editing the Test Class to your liking. In the future, there might just be a package install button lying around here somewhere!
