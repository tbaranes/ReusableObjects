# ReusableObjects

[![Travis](https://img.shields.io/travis/tbaranes/ReusableObjects.svg)](https://travis-ci.org/recisio/ReusableObjects)
![Language](https://img.shields.io/badge/language-Swift%202-orange.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/ReusableObjects.svg?style=flat)](https://github.com/tbaranes/ReusableObjects)
[![Platform](https://img.shields.io/cocoapods/p/ReusableObjects.svg?style=flat)](http://cocoadocs.org/docsets/ReusableObjects)
[![License](https://img.shields.io/cocoapods/l/ReusableObjects.svg?style=flat)](http://cocoapods.org/pods/ReusableObjects)

`ReusableObjects` is the easiest way to create an object once, and re-used it as much as possible. It's allow you to avoid several allocation / initialization of expensive objects such as `NSDateFormatter`, `NSNumberFormatter`... or any of your custom objects.

Available for iOS, OS X, and tvOS.

## Example

```swift
let reuseIdentifier = "kDateFormatterIdentifier"      
NSDateFormatter.registerObjectWithIdentifier(reuseIdentifier)
if let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier) as? NSDateFormatter,
               reusedDateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(identifier) as? NSDateFormatter {
	print("\(dateFormatter) vs \(reusedDateFormatter)") // <NSDateFormatter: 0x7fd1307125c0> vs <NSDateFormatter: 0x7fd1307125c0>
}
```

Check out the demo project to see other examples.
 
## Installation

### Cocoapods Installation

ReusableObjects is available on CocoaPods. Add the following line in your Podfile:

```
pod 'ReusableObjects'
```

### Swift Package Manager

ReusableObjects is available on SPM. Just add the following to your Package file:

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/tbaranes/ReusableObjects.git", majorVersion: 1)
    ]
)
```

### Manual Installation

Just drag the `Source/*.swift` files into your project.
 

## Usage

```swift
static func registerObjectWithIdentifier(reuseIdentifier: String)
public func registerObjectWithIdentifier(reuseIdentifier: String)
```

Attempts to register a class to reuse it anywhere in your application. Does nothing if the current object or identifier is not valid.

The `reuseIdentifier` parameter must not be nil and must not be an empty string.


```swift
static func unregisterObjectWithIdentifier(reuseIdentifier: String)
```

Unregister the object located by its identifiers. Doesn nothing if the object doesn't exist.


```swift
static func dequeueReusableObjectWithIdentifier(reuseIdentifier: String) -> AnyObject?
```

Returns a reusable `NSObject` object located by its identifier. 

If any object found, it will register the object before returning the object registered or nil if an error occured.

## What's next

- [ ] A better public interfaces
- [ ] WatchOS support
- Your ideas!

## Contribution

- If you found a **bug**, open an **issue**
- If you have a **feature request**, open an **issue**
- If you want to **contribute**, submit a **pull request**

## Licence

ReusableObjects is available under the MIT license. See the LICENSE file for more info.

