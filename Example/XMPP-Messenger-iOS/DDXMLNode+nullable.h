//
//  DDXMLNode+nullable.h
//  XMPP-Messenger-iOS
//
//  Created by Mohammadreza Hemmati on 12/28/16.
//  Copyright © 2016 ProcessOne. All rights reserved.
//

#import <KissXML/KissXML.h>

@interface DDXMLNode (nullable)

+ (id)namespaceWithNullableName:(nullable NSString *)name stringValue:(NSString *)stringValue;

@end
