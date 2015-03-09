//
//  ViewController.m
//  selfie
//
//  Created by Leo on 31/01/2015.
//  Copyright (c) 2015 Leo. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "AuthAPIClient.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize emailInput;
@synthesize passwordInput;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)login:(id)sender {
    [SVProgressHUD show];
    
    id params = @{
                  @"username": self.emailInput.text,
                  @"password": self.passwordInput.text
                  };
    
    [[AuthAPIClient sharedClient] postPath:@"/auth/login.json"
                                parameters:params
                                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                       
                                       NSString *authToken = [responseObject objectForKey:@"auth_token"];
                                       [self.credentialStore setAuthToken:authToken];
                                       
                                       [SVProgressHUD dismiss];
                                       
                                       [self dismissViewControllerAnimated:YES completion:nil];
                                       
                                   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                       if (operation.response.statusCode == 500) {
                                           [SVProgressHUD showErrorWithStatus:@"Something went wrong!"];
                                       } else {
                                           NSData *jsonData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                                           NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                                                options:0
                                                                                                  error:nil];
                                           NSString *errorMessage = [json objectForKey:@"error"];
                                           [SVProgressHUD showErrorWithStatus:errorMessage];
                                       }
                                   }];
}





@end
