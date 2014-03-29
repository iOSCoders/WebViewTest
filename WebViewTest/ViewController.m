//
//  ViewController.m
//  WebViewTest
//
//  Created by Joe Bologna on 3/27/14.
//  Copyright (c) 2014 Focused for Success, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate> {
    UIWebView *webView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    //webView.scrollView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    webView.delegate = self;
    NSString *file = @"index.html";
    NSURL *url = [NSURL URLWithString:file relativeToURL:[[NSBundle mainBundle] bundleURL]];
    NSLog(@"%@", url.path);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%s", __func__);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%s: %@", __func__, error);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%s", __func__);
    return YES;
}

@end
