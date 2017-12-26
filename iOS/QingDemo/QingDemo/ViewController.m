//
//  ViewController.m
//  QingDemo
//
//  Created by K on 2017/12/20.
//  Copyright © 2017年 K. All rights reserved.
//

#import "ViewController.h"
#import "QingUtil/Qing.h"

@interface ViewController ()
@property (strong)UIButton* loginBtn;
@property (strong)UIButton* testBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGPoint selfCGPoint = [[UIScreen mainScreen] bounds].origin;
    CGSize selfCGSize =  [[UIScreen mainScreen] bounds].size;
    CGFloat space = selfCGSize.height/21;
    CGFloat widgetWidth = selfCGSize.width * 9/10;
    
    
    // 最高60
    CGFloat widgetHeight = 3*space > 60 ? 60 :3*space ;
    CGFloat widgetYTop = selfCGPoint.y;
    CGFloat widgetX = selfCGPoint.x + (selfCGSize.width/2) - (widgetWidth/2);
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [view setBackgroundColor:[UIColor darkGrayColor]];
    
    _loginBtn =  [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginBtn setBackgroundColor:[UIColor colorWithRed:1.0 green:0.7 blue:0.1 alpha:1]];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginBtn.frame=CGRectMake(widgetX, widgetYTop + space, widgetWidth , widgetHeight);
    [_loginBtn addTarget:self action:@selector(loginBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
    _testBtn =  [UIButton buttonWithType:UIButtonTypeSystem];
    [_testBtn setBackgroundColor:[UIColor colorWithRed:1.0 green:0.7 blue:0.1 alpha:1]];
    [_testBtn setTitle:@"支付测试" forState:UIControlStateNormal];
    [_testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _testBtn.frame=CGRectMake(widgetX, widgetYTop + widgetHeight + space  + space, widgetWidth , widgetHeight);
    [_testBtn addTarget:self action:@selector(testBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:_loginBtn];
    [view addSubview:_testBtn];
    [self.view addSubview:view];

    [QingApi initWithGameKey:@"XqEELEvMCbkqyGfN"];
    [self loginBtnPress:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testBtnPress:(id)sender
{
    QingOrderParams *params = [[QingOrderParams alloc] init];
    params.qing_product_name = @"test_product";
    params.qing_product_price = 1;
    params.qing_cp_order_id = @"test_order_ID";
    params.qing_is_sandbox = NO;
    params.qing_extends_param1 = @"extends_param1";
    params.qing_extends_param2 = @"extends_param2";
    
    [QingApi qingRequestOrderWithParams:params withBlock:^(QingOrderResult *info){
        
        NSLog(@"did pay %@",info);
    }];
}

-(void)loginBtnPress:(id)sender
{
    [QingApi qingShowLoginWithBlock:^(QingUserInfo *info){
        NSLog(@"did login %@",info);
    }];
}


@end

