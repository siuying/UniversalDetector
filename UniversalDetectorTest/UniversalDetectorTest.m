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

- (void)testEncoding
{
    // http://news.mingpao.com/20130507/gaa1.htm
    NSData* data = [UniversalDetectorTest dataWithFixtureFile:@"mingpao"];
    XCTAssertNotNil(data,);
    UniversalDetector* detector = [[UniversalDetector alloc] init];

    CFStringEncodings encoding = [detector encodingWithData:data];
    XCTAssertTrue(CFStringIsEncodingAvailable(encoding));
    XCTAssertEqual(encoding, kCFStringEncodingBig5);
    
    // http://www.jiji.com/jc/c?g=pol&k=2013050700380
    data = [UniversalDetectorTest dataWithFixtureFile:@"jijicom"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingWithData:data];
    XCTAssertTrue(CFStringIsEncodingAvailable(encoding));
    XCTAssertEqual(encoding, kCFStringEncodingEUC_JP);
    
    // http://www.yomiuri.co.jp/national/news/20130507-OYT1T00237.htm?from=main5
    data = [UniversalDetectorTest dataWithFixtureFile:@"yomiuri"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingWithData:data];
    XCTAssertTrue(CFStringIsEncodingAvailable(encoding));
    XCTAssertEqual(encoding, kCFStringEncodingShiftJIS);
    
    // http://www.theverge.com/2013/5/6/4303072/fitbit-flex-review
    data = [UniversalDetectorTest dataWithFixtureFile:@"theverge"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingWithData:data];
    XCTAssertTrue(CFStringIsEncodingAvailable(encoding));
    XCTAssertEqual(encoding, (CFStringEncodings) kCFStringEncodingUTF8);
    
    // http://headline.2ch.net/bbynamazu/
    data = [UniversalDetectorTest dataWithFixtureFile:@"2ch"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingWithData:data];
    XCTAssertTrue(CFStringIsEncodingAvailable(encoding));
    XCTAssertEqual(encoding, (CFStringEncodings) kCFStringEncodingShiftJIS);
    
    // pure ascii encoding
    data = [UniversalDetectorTest dataWithFixtureFile:@"ascii"];
    XCTAssertNotNil(data);
    encoding = [detector encodingWithData:data];
    XCTAssertEqual(encoding, kCFStringEncodingInvalidId);
}

- (void)testEncodingAsString
{
    // http://news.mingpao.com/20130507/gaa1.htm
    NSData* data = [UniversalDetectorTest dataWithFixtureFile:@"mingpao"];
    XCTAssertNotNil(data);
    UniversalDetector* detector = [[UniversalDetector alloc] init];

    NSString* encoding = [detector encodingAsStringWithData:data];
    XCTAssertEqualObjects(encoding, @"Big5");

    // http://www.jiji.com/jc/c?g=pol&k=2013050700380
    data = [UniversalDetectorTest dataWithFixtureFile:@"jijicom"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingAsStringWithData:data];
    XCTAssertEqualObjects(encoding, @"EUC-JP");
    
    // http://www.yomiuri.co.jp/national/news/20130507-OYT1T00237.htm?from=main5
    data = [UniversalDetectorTest dataWithFixtureFile:@"yomiuri"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingAsStringWithData:data];
    XCTAssertEqualObjects(encoding, @"Shift_JIS");
    
    // http://www.theverge.com/2013/5/6/4303072/fitbit-flex-review
    data = [UniversalDetectorTest dataWithFixtureFile:@"theverge"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingAsStringWithData:data];
    XCTAssertEqualObjects(encoding, @"UTF-8");
    
    // http://headline.2ch.net/bbynamazu/
    data = [UniversalDetectorTest dataWithFixtureFile:@"2ch"];
    XCTAssertNotNil(data);
    
    encoding = [detector encodingAsStringWithData:data];
    XCTAssertEqualObjects(encoding, @"Shift_JIS");

    // pure ascii encoding
    data = [UniversalDetectorTest dataWithFixtureFile:@"ascii"];
    XCTAssertNotNil(data);
    encoding = [detector encodingAsStringWithData:data];
    XCTAssertTrue([encoding isEqualToString:@"US-ASCII"] || [encoding isEqualToString:@""]);
}

@end
