//
//  JZBorderedView.h
//  JZBorderedView
//
//  Created by James Zhao on 7/13/15.
//  Copyright (c) 2015 James Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, JZSeparatorPosition) {
    JZSeparatorPositionNone = 1 << 0,
    JZSeparatorPositionTop = 1 << 1,
    JZSeparatorPositionLeft = 1 << 2,
    JZSeparatorPositionBottom = 1 << 3,
    JZSeparatorPositionRight = 1 << 4,
};

@interface JZSeparator : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, assign) JZSeparatorPosition position;

@end

//IB_DESIGNABLE
@interface JZBorderedView : UIView

@property (nonatomic, strong) NSMutableArray *separators;

@property (nonatomic, strong) JZSeparator *topSeparator;
@property (nonatomic, strong) JZSeparator *leftSeparator;
@property (nonatomic, strong) JZSeparator *bottomSeparator;
@property (nonatomic, strong) JZSeparator *rightSeparator;

@property (nonatomic, strong) IBInspectable UIColor *separatorColor;
@property (nonatomic, assign) IBInspectable CGFloat separatorWidth;

@property (nonatomic, assign) IBInspectable CGFloat topSeparatorLeftInset;
@property (nonatomic, assign) IBInspectable CGFloat topSeparatorRightInset;

@property (nonatomic, assign) IBInspectable CGFloat bottomSeparatorLeftInset;
@property (nonatomic, assign) IBInspectable CGFloat bottomSeparatorRightInset;

@property (nonatomic, assign) IBInspectable CGFloat leftSeparatorTopInset;
@property (nonatomic, assign) IBInspectable CGFloat leftSeparatorBottomInset;
@property (nonatomic, assign) IBInspectable CGFloat rightSeparatorTopInset;
@property (nonatomic, assign) IBInspectable CGFloat rightSeparatorBottomInset;

@property (nonatomic, assign) IBInspectable BOOL topSeparatorEnabled;
@property (nonatomic, assign) IBInspectable BOOL leftSeparatorEnabled;
@property (nonatomic, assign) IBInspectable BOOL bottomSeparatorEnabled;
@property (nonatomic, assign) IBInspectable BOOL rightSeparatorEnabled;

@end
