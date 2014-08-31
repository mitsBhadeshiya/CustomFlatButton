//
//  MBButton.m
//  FlatButton
//
//  Created by Mitul Bhadesiya on 19/08/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "MBButton.h"

@implementation MBButton

@synthesize isRippleOn;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame type:(MBButtonType)btnType
{
    self = [super initWithFrame:frame];
    buttonFrame = frame;
    if(self ){
        buttonType  = btnType;
        [self setButtonWithType];
        if(buttonType == ButtonCircle){
            
            // set Frame size for circle
            if(frame.size.height > frame.size.width){
                buttonFrame.size.height = frame.size.width;
            }else {
                buttonFrame.size.width = frame.size.height;
            }
       }
        
    }
    return  self;
}


/* CREATE IMAGE FROM THE COLOR */

-(UIImage *)createImageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/* SET BUTTON */
-(void)setButtonWithType
{
    switch (buttonType) {
        case ButtonDefault:
            [self setBackgroundImage:[self createImageFromColor:Custom_Gray] forState:UIControlStateNormal];
            [self setBackgroundImage:[self createImageFromColor:Custom_Gray] forState:UIControlStateHighlighted];
            [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            self.layer.borderColor = [UIColor grayColor].CGColor;
            self.layer.borderWidth = 0.0f;
            self.layer.cornerRadius = 4.0f;
            break;
            
        case ButtonCircle:
            [self setBackgroundImage:[self createImageFromColor: Custom_Green] forState:UIControlStateNormal];
            [self setBackgroundImage:[self createImageFromColor:Custom_Green_Dark] forState:UIControlStateHighlighted];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.layer.borderColor = [UIColor blackColor].CGColor;
            self.layer.borderWidth = 0.0f;
            self.layer.cornerRadius = self.frame.size.width/2;
            
            break;

        default:
            break;
    }
    
    gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    gesture.numberOfTapsRequired =1;
    [self addGestureRecognizer:gesture];
    self.layer.masksToBounds = YES;
}

-(void)handleTap:(id)sender {
    
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:1.0f];
    [animation setTimingFunction:UIViewAnimationCurveEaseInOut];
    [animation setType:@"rippleEffect" ];
    [self.layer addAnimation:animation forKey:NULL];
}



@end
