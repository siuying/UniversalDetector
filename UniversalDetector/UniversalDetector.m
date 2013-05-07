//
//  UniversalDetector.m
//  UniversalDetector
//
//  Created by Francis Chong on 7/5/13.
//  Copyright (c) 2013 Ignition Soft. All rights reserved.
//

#import "UniversalDetector.h"
#import "uchardet.h"

@implementation UniversalDetector

-(id) init {
    self = [super init];
    if (self) {
        _detector = uchardet_new();
    }
    return self;
}

-(void) dealloc {
    uchardet_delete(_detector);
}

-(CFStringEncodings) detectEncoding:(NSData*)data {
    uchardet_handle_data(_detector, [data bytes], [data length]);
    uchardet_data_end(_detector);
    const char * charset = uchardet_get_charset(_detector);

    NSString* encodingName = [NSString stringWithCString:charset encoding:NSASCIIStringEncoding];
    CFStringEncodings encoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)encodingName);
    uchardet_reset(_detector);

    return encoding;
}

+(CFStringEncodings) detectEncoding:(NSData*)data {
    return [[[UniversalDetector alloc] init] detectEncoding:data];
}

@end
