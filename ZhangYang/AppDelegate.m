//
//  AppDelegate.m
//  ZhangYang
//
//  Created by HOU on 2020/5/18.
//  Copyright © 2020 DUGU. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageModel.h"
#import "MessageCreateApi.h"
#import "MessageGetModel.h"
#import "MessageGetApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = HOST;
    
    /*
    MessageModel *createModel = [[MessageModel alloc]init];
    
    createModel.messageContent = @"消息1";
    createModel.messageId = @"zhangyang211";
//    createModel.messageType = 0;
//    createModel.messageState = 0;
    

    
    MessageCreateApi *api = [[MessageCreateApi alloc]initWithMessage:createModel];
    
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        createModel.messageCreationTime = [request.responseObject[@"creationTime"] integerValue];
        NSLog(@"%@",request.responseString);
        NSLog(@"-------------------------");
        MessageGetModel *getModel = [[MessageGetModel alloc]init];
        getModel.messageId = @"zhangyang211";
        getModel.messageLimit = 20;
        
        MessageGetApi *getApi = [[MessageGetApi alloc]initWithMessage:getModel];
        
        [getApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
           
            NSLog(@"%@",request.responseObject);
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            NSLog(@"%@",request.requestUrl);
            NSLog(@"%@",request.error.localizedDescription);
            
        }];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    */
    
    

    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ZhangYang"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
