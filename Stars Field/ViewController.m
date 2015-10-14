//
//  ViewController.m
//  Stars Field
//
//  Created by Do Minh Hai on 10/14/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView * red, *violet, *green, *brown ;
    CGPoint center;
    CGFloat deltaX ;
    CGFloat deltaY ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size ;
    deltaX = 100 ;
    deltaY = 100;
    center = CGPointMake(size.width * 0.5, (size.height - 60) * 0.5);
    red    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet"]];
    green  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    brown  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown"]];
    [self vitri];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    [self animate];
}
-(void) vitri
{
    red.center = center;
    violet.center = center;
    green.center = center;
    brown.center = center;
}
-(void) animate
{
    [UIView animateWithDuration:1 animations:^{
        brown.center = CGPointMake(center.x - deltaX, center.y - deltaY);
        red.center = CGPointMake(center.x + deltaX, center.y + deltaY);
        green.center = CGPointMake(center.x + deltaX, center.y - deltaY);
        violet.center = CGPointMake(center.x - deltaX, center.y + deltaY)  ;
    }
                     completion:^(BOOL finished){
        [UIView animateWithDuration:1 animations:^{
            brown.center = CGPointMake(center.x - deltaX, center.y);
            green.center = CGPointMake(center.x, center.y - deltaY);
            red.center = CGPointMake(center.x + deltaX, center.y);
            violet.center = CGPointMake(center.x, center.y + deltaY);
        }
                         completion:^(BOOL finished){
            [UIView animateWithDuration:3 animations:^{
                [self vitri];
            }
                             completion:^(BOOL finished){
                                 [self animate];
                             }];
        }];
    }];
}
@end
