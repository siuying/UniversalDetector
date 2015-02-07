Pod::Spec.new do |s|
  s.name          = 'UniversalDetector'
  s.version       = '1.3.2'
  s.license       = { :type => 'Mozilla Public License', :file => 'LICENSE' }
  s.summary       =  'Wrapper of uchardet for Objective-C.'
  s.description   =  'UniversalDetector takes a sequence of bytes in an unknown character encoding without any additional information, and attempts to determine the encoding of the text.'
  s.homepage      = 'https://github.com/siuying/UniversalDetector'
  s.author        = { 'Francis Chong' => 'francis@ignition.hk' }
  s.source        = { :git => 'https://github.com/siuying/UniversalDetector.git', :tag => s.version.to_s }

  s.source_files        = 'UniversalDetector/*.{h,m}', 'external/*.{h,cpp}', 'external/universalchardet/src/base/*.{cpp,h}'
  s.public_header_files = 'UniversalDetector/*.h', 'external/uchardet.h'
  s.preserve_paths      = 'external/universalchardet/src/base/*.{tab}'

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.xcconfig = {
       'WARNING_CFLAGS' => '-Wno-shorten-64-to-32'
  }

  s.library             = 'stdc++'
  s.requires_arc = true
end