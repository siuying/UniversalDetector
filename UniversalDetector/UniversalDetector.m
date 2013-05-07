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

+(CFStringEncodings) detectEncoding:(NSData*)data {
    uchardet_t detector = uchardet_new();
    uchardet_handle_data(detector, [data bytes], [data length]);
    uchardet_data_end(detector);
    const char * charset = uchardet_get_charset(detector);
    
    NSString* encodingName = [NSString stringWithCString:charset encoding:NSASCIIStringEncoding];
    CFStringEncodings encoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)encodingName);
    return encoding;
}

@end
