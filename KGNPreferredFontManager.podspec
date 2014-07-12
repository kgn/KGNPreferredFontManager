Pod::Spec.new do |spec|
  spec.name = 'KGNPreferredFontManager'
  spec.version = '0.0.1'
  spec.authors = {'David Keegan' => 'git@davidkeegan.com'}
  spec.homepage = 'https://github.com/kgn/KGNPreferredFontManager'
  spec.summary = 'Helper class to registering custom fonts for UIFontTextStyle'
  spec.source = {:git => 'https://github.com/kgn/KGNPreferredFontManager.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.platform = :ios
  spec.requires_arc = true
  spec.source_files = 'KGNPreferredFontManager'
end
