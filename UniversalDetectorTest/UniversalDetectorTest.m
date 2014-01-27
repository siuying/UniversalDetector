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
    STAssertNotNil(data, nil);
    UniversalDetector* detector = [[UniversalDetector alloc] init];

    CFStringEncodings encoding = [detector encodingWithData:data];
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, kCFStringEncodingBig5, nil);
    
    // http://www.jiji.com/jc/c?g=pol&k=2013050700380
    data = [UniversalDetectorTest dataWithFixtureFile:@"jijicom"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingWithData:data];
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, kCFStringEncodingEUC_JP, nil);
    
    // http://www.yomiuri.co.jp/national/news/20130507-OYT1T00237.htm?from=main5
    data = [UniversalDetectorTest dataWithFixtureFile:@"yomiuri"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingWithData:data];
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, kCFStringEncodingShiftJIS, nil);
    
    // http://www.theverge.com/2013/5/6/4303072/fitbit-flex-review
    data = [UniversalDetectorTest dataWithFixtureFile:@"theverge"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingWithData:data];
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingUTF8, nil);
    
    // http://headline.2ch.net/bbynamazu/
    data = [UniversalDetectorTest dataWithFixtureFile:@"2ch"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingWithData:data];
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingShiftJIS, nil);
    
    // http://m.money.pl/wiadomosci/artykul/sezon;wynikow;na;gpw;w;pelni;inwestorzy;czekaja;na;,196,0,1371588.html
    data = [UniversalDetectorTest dataWithFixtureFile:@"polish"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingWithData:data];
    STAssertTrue(CFStringIsEncodingAvailable(encoding), nil);
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingISOLatin2, nil);
    
    // pure ascii encoding
    data = [UniversalDetectorTest dataWithFixtureFile:@"ascii"];
    STAssertNotNil(data, nil);
    encoding = [detector encodingWithData:data];
    STAssertEquals(encoding, (CFStringEncodings) kCFStringEncodingASCII, nil);
}

- (void)testEncodingAsString
{
    // http://news.mingpao.com/20130507/gaa1.htm
    NSData* data = [UniversalDetectorTest dataWithFixtureFile:@"mingpao"];
    STAssertNotNil(data, nil);
    UniversalDetector* detector = [[UniversalDetector alloc] init];

    NSString* encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"Big5", nil);

    // http://www.jiji.com/jc/c?g=pol&k=2013050700380
    data = [UniversalDetectorTest dataWithFixtureFile:@"jijicom"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"EUC-JP", nil);
    
    // http://www.yomiuri.co.jp/national/news/20130507-OYT1T00237.htm?from=main5
    data = [UniversalDetectorTest dataWithFixtureFile:@"yomiuri"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"Shift_JIS", nil);
    
    // http://www.theverge.com/2013/5/6/4303072/fitbit-flex-review
    data = [UniversalDetectorTest dataWithFixtureFile:@"theverge"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"UTF-8", nil);
    
    // http://headline.2ch.net/bbynamazu/
    data = [UniversalDetectorTest dataWithFixtureFile:@"2ch"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"Shift_JIS", nil);

    // http://m.money.pl/wiadomosci/artykul/sezon;wynikow;na;gpw;w;pelni;inwestorzy;czekaja;na;,196,0,1371588.html
    data = [UniversalDetectorTest dataWithFixtureFile:@"polish"];
    STAssertNotNil(data, nil);
    
    encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"ISO-8859-2", nil);   

    // pure ascii encoding
    data = [UniversalDetectorTest dataWithFixtureFile:@"ascii"];
    STAssertNotNil(data, nil);
    encoding = [detector encodingAsStringWithData:data];
    STAssertEqualObjects(encoding, @"US-ASCII", nil);
}

@end
