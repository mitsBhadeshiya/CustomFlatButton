//
//  MBButton.h
//  FlatButton
//
//  Created by Mitul Bhadesiya on 19/08/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import <UIKit/UIKit.h>


#define Custom_Gray [UIColor colorWithRed:(210.0f/255.0f) green:(210.0f/255.0f) blue:(210.0f/255.0f) alpha:1.0f]

#define Custom_Green [UIColor colorWithRed:(99.0f/255.0f) green:(181.0f/255.0f) blue:(76.0f/255.0f) alpha:1.0f]

#define Custom_Green_Dark [UIColor colorWithRed:(75.0f/255.0f) green:(175.0f/255.0f) blue:(50.0f/255.0f) alpha:1.0f]

typedef NS_ENUM(NSInteger, MBButtonType) {
    
    ButtonDefault= 0,
    ButtonCircle
};

@interface MBButton : UIButton
{
    UITapGestureRecognizer *gesture;
    
    MBButtonType buttonType;
    NSString *buttonTitle;
    CGRect buttonFrame;
    UIColor *rippleColor;
}

@property (nonatomic) BOOL isRippleOn;

- (id)initWithFrame:(CGRect)frame;
-(id)initWithFrame:(CGRect)frame type:(MBButtonType)btnType;

@end
