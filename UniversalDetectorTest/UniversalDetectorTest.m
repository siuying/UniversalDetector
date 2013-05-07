//
//  UniversalDetectorTest.m
//  UniversalDetectorTest
//
//  Created by Francis Chong on 7/5/13.
//  Copyright (c) 2013 Ignition Soft. All rights reserved.
//

#import "UniversalDetectorTest.h"
#import "UniversalDetector.h"

@implementation UniversalDetectorTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

+ (NSData*) dataWithFixtureFile:(NSString*)filename {
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    NSString* path = [bundle pathForResource:filename ofType:@"html"];
    return [NSData dataWithContentsOfMappedFile:path];
}

- (void) runTestOnFile:(NSString*)file expectedEncoding:(CFStringEncodings)expectedEncoding {
    NSData* data = [UniversalDetectorTest dataWithFixtureFile:file];
    STAssertNotNil(data, nil);
    
    CFStringEncodings encoding = [UniversalDetector detectEncoding:data];
    STAssertTrue(kCFStringEncodingInvalidId != encoding, nil);
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, expectedEncoding, nil);
}

- (void)testEncoding
{
    // http://news.mingpao.com/20130507/gaa1.htm
    NSData* data = [UniversalDetectorTest dataWithFixtureFile:@"mingpao"];
    STAssertNotNil(data, nil);
    UniversalDetector* detector = [[UniversalDetector alloc] init];

    CFStringEncodings encoding = [detector detectEncoding:data];
    STAssertTrue(kCFStringEncodingInvalidId != encoding, nil);
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, kCFStringEncodingBig5, nil);

    // http://www.jiji.com/jc/c?g=pol&k=2013050700380
    data = [UniversalDetectorTest dataWithFixtureFile:@"jijicom"];
    STAssertNotNil(data, nil);

    encoding = [detector detectEncoding:data];
    STAssertTrue(kCFStringEncodingInvalidId != encoding, nil);
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, kCFStringEncodingEUC_JP, nil);
    
    // http://www.yomiuri.co.jp/national/news/20130507-OYT1T00237.htm?from=main5
    data = [UniversalDetectorTest dataWithFixtureFile:@"yomiuri"];
    STAssertNotNil(data, nil);
    
    encoding = [detector detectEncoding:data];
    STAssertTrue(kCFStringEncodingInvalidId != encoding, nil);
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, kCFStringEncodingShiftJIS, nil);
    
    // http://www.theverge.com/2013/5/6/4303072/fitbit-flex-review
    data = [UniversalDetectorTest dataWithFixtureFile:@"theverge"];
    STAssertNotNil(data, nil);
    
    encoding = [detector detectEncoding:data];
    STAssertTrue(kCFStringEncodingInvalidId != encoding, nil);
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingUTF8, nil);
    
    // http://headline.2ch.net/bbynamazu/
    data = [UniversalDetectorTest dataWithFixtureFile:@"2ch"];
    STAssertNotNil(data, nil);
    
    encoding = [detector detectEncoding:data];
    STAssertTrue(kCFStringEncodingInvalidId != encoding, nil);
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingShiftJIS, nil);
    
    // pure ascii encoding
    data = [UniversalDetectorTest dataWithFixtureFile:@"ascii"];
    STAssertNotNil(data, nil);
    encoding = [detector detectEncoding:data];
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingInvalidId, nil);
}

@end
