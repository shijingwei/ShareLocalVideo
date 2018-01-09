//
//  ViewController.m
//  ShareVideo
//
//  Created by ShiAwe on 1/9/18.
//  Copyright © 2018 awe. All rights reserved.
//

#import "ViewController.h"

//Step 1 : 实现  <UIDocumentInteractionControllerDelegate>
@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *docInteractionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//点击分享本地视频
- (IBAction)shareVideo:(id)sender {
    
    //Step 2: 获取视频文件地址
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Test.mp4" ofType:nil];
    NSLog(@"Step 1: 获取视频文件地址 : %@",filePath);
    
    
    //Step 3: 初始化 及设置代理
    NSURL * url = [NSURL fileURLWithPath:filePath];
    self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
    self.docInteractionController.delegate = self;
    
    //Step 4: 显示可以支持视频的应用
    [self.docInteractionController presentOptionsMenuFromRect:self.view.frame
                                                       inView:self.view
                                                     animated:YES];
    
}


//Step 5:实现代理方法
#pragma mark - UIDocumentInteractionControllerDelegate
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)interactionController
{
    return self;
}



@end
