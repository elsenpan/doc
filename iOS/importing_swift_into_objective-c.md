## Where is Apple doc?
[importing_swift_into_objective-c](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_swift_into_objective-c)

## Use Swift class inside Object-C project
- Create new Swift file(For the first Swift file, Xcode will automatically prompt for Bridge-Header file, no need to create it, as it used for import object-c file in Swift project)
- Inside Object-C file do #import "$(PROJECT_NAME)-Swift.h"
- Build project, Xcode will auto create object-c interface of Swift file inside $(PROJECT_NAME)-Swift.h
## How to import same Swift header file for multiple targets
change SWIFT_OBJC_INTERFACE_HEADER_NAME (“Objective-C Generated Interface Header Name”) under Project's, not Targets, Build Settings, to:
$(PROJECT_NAME)-Swift.h, this makes you import the same file $(PROJECT_NAME)-Swift.h in object-c files through multiple targets

[Objective C to Swift header file with multiple targets](https://stackoverflow.com/questions/26262029/objective-c-to-swift-header-file-with-multiple-targets#)

## Can't find Swift class or Swift class members?
check how to use attribute @objc or @objcMembers if using Swift4
By default, the generated header contains interfaces for Swift declarations marked with the public or open modifier. 

