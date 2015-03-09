//
//  CredentialStore.h
//  selfie
//
//  Created by Leo on 09/03/2015.
//  Copyright (c) 2015 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CredentialStore : NSObject

- (BOOL)isLoggedIn;
- (void)clearSavedCredentials;
- (NSString *)authToken;
- (void)setAuthToken:(NSString *)authToken;

@end