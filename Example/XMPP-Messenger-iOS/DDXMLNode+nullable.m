//
//  DDXMLNode+nullable.m
//  XMPP-Messenger-iOS
//
//  Created by Mohammadreza Hemmati on 12/28/16.
//  Copyright © 2016 ProcessOne. All rights reserved.
//

#import "DDXMLNode+nullable.h"

@implementation DDXMLNode (nullable)

+ (id)namespaceWithNullableName:(nullable NSString *)name stringValue:(NSString *)stringValue{
    return [DDXMLNode namespaceWithName:name stringValue:stringValue];
}

@end
