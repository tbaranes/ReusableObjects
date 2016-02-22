Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "ReusableObjects"
s.version          	= "1.0"
s.summary          	= "`ReusableObjects` is the easiest way to create an object once, and re-used it as much as possible. It's allow you to avoid several allocation / initialization of expensive objects such as `NSDateFormatter`, `NSNumberFormatter`... or any of your custom objects."
s.description      	= "`ReusableObjects` is the easiest way to create an object once, and re-used it as much as possible. It's allow you to avoid several allocation / initialization of expensive objects such as `NSDateFormatter`, `NSNumberFormatter`... or any of your custom objects. Available for iOS, OS X, and tvOS."
s.homepage         	= "https://github.com/tbaranes/ReusableObjects."
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Tom Baranes" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/tbaranes/ReusableObjects.git", :tag => "#{s.version}" }

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.ios.deployment_target		= '8.0'
s.osx.deployment_target 	= '10.10'
s.tvos.deployment_target 	= '9.0'

s.requires_arc 	   			= true
s.source_files				= 'Source/*.swift'

end