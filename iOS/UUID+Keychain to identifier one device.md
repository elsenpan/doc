
```
pod 'SAMKeychain'
```
```
#import "SAMKeychain.h"

NSString *uuid = [SAMKeychain passwordForService:@"service" account:@"account"];
if (!uuid) {
   NSString *identifierForVendor = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
   [SAMKeychain setAccessibilityType:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly];
   [SAMKeychain setPassword:identifierForVendor forService:@"service" account:@"account"];
   NSLog(@"initial uuid %@",identifierForVendor);
}else{
   NSLog(@"uuid:%@",uuid);
}
```
