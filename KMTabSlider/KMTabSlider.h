//
//  KMTabSlider.h
//  KMSliderBar
//
//  Created by Kabir Mahal on 10/23/14.
//  Copyright (c) 2014 Kabir Mahal. All rights reserved.
//

typedef enum KMState {
    KMFirstSelected = 0,
    KMSecondSelected = 1,
    KMThirdSelected = 2,
}KMStatus;

#import <UIKit/UIKit.h>

@class KMTabSlider;

@protocol KMTabSliderDelegate

-(void) KMTabSlider:(KMTabSlider*)KMTabSlider itemSelected:(KMStatus)itemSelected;

@end

@interface KMTabSlider : UIView

@property (strong, nonatomic) id <KMTabSliderDelegate> delegate;

-(KMTabSlider*)initWithFrame:(CGRect)frame firstTitle:(NSString*)firstTitle secondTitle:(NSString*)secondTitle andThirdTitle:(NSString*)thirdTitle withSelectedColor:(UIColor*)selectedColor andUnselectedColor:(UIColor*)unselectedColor;

@end



