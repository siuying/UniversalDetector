# UniversalDetector for Objective-C

UniversalDetector is a wrapper for [uchardet](http://code.google.com/p/uchardet/), which is based on C++ implementation of the [universal charset detection library](http://lxr.mozilla.org/seamonkey/source/extensions/universalchardet/) by Mozilla.

UniversalDetector is an encoding detector library, which takes a sequence of bytes in an unknown character encoding without any additional information, and attempts to determine the encoding of the text.

## Usage

```
CFStringEncodings encoding = [UniversalDetector detectEncoding:data];
```

## Installation

If you use CocoaPods, add following line to your Podfile:

```
pod 'UniversalDetector'
```

Otherwise, add 'UniversalDetector/*.{h,m}', 'external/uchardet/src/*.{cpp,h,tab}', 'external/uchardet/src/tools/*.cpp' and library 'libstdc++' to your project.

## LICENSE 

Mozilla Public License, refer to file LICENSE.

