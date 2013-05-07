# UniversalDetector for Objective-C

UniversalDetector is a wrapper for [uchardet](http://code.google.com/p/uchardet/), which is based on C++ implementation of the [universal charset detection library](http://lxr.mozilla.org/seamonkey/source/extensions/universalchardet/) by Mozilla.

UniversalDetector is an encoding detector library, which takes a sequence of bytes in an unknown character encoding without any additional information, and attempts to determine the encoding of the text.

## Usage

```
CFStringEncodings encoding = [UniversalDetector detectEncoding:data];
```

## LICENSE 

Mozilla Public License, refer to file LICENSE.

