//
//  OnePresence.swift
//  OneChat
//
//  Created by Paul on 27/02/2015.
//  Copyright (c) 2015 ProcessOne. All rights reserved.
//

import Foundation
import XMPPFramework

// MARK: Protocol
public protocol OnePresenceDelegate {
	func onePresenceDidReceivePresence()
}

public class OnePresence: NSObject {
	var delegate: OnePresenceDelegate?
	
	// MARK: Singleton
	
	class var sharedInstance : OnePresence {
		struct OnePresenceSingleton {
			static let instance = OnePresence()
		}
		return OnePresenceSingleton.instance
	}
	
	// MARK: Functions
	
	class func goOnline() {
		let presence = XMPPPresence(type: "available")
		let domain = OneChat.sharedInstance.xmppStream!.myJID.domain
		
        let status: DDXMLElement = DDXMLElement(name: "status", stringValue: "Man ham hastam")
        presence.addChild(status)
        
        let show: DDXMLElement = DDXMLElement(name: "show", stringValue: "chat")
        presence.addChild(show)
        
		if domain == "gmail.com" || domain == "gtalk.com" || domain == "talk.google.com" {
			let priority: DDXMLElement = DDXMLElement(name: "priority", stringValue: "24")
			presence.addChild(priority)
		}
		
		OneChat.sharedInstance.xmppStream?.sendElement(presence)
	}
	
	class func goOffline() {
		var _ = XMPPPresence(type: "unavailable")
	}
}

extension OnePresence: XMPPStreamDelegate {
	
	public func xmppStream(sender: XMPPStream, didReceivePresence presence: XMPPPresence) {
		print("did received presence : \(presence)")
	}
}
