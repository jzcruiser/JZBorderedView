//
//  JZBorderedView.m
//  JZBorderedView
//
//  Created by James Zhao on 7/13/15.
//  Copyright (c) 2015 James Zhao. All rights reserved.
//

#import "JZBorderedView.h"

@implementation JZSeparator

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self commonInit];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self commonInit];
    }

    return self;
}

- (void)prepareForInterfaceBuilder
{
    [self commonInit];
}

- (void)commonInit
{
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.backgroundColor = _color;
}

@end

@implementation JZBorderedView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self commonInit];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self commonInit];
    }

    return self;
}

- (void)prepareForInterfaceBuilder
{
}

- (void)commonInit
{
    self.topSeparator = [self instantiateNewSeparatorWithPosition:JZSeparatorPositionTop];
    self.topSeparator.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    self.leftSeparator = [self instantiateNewSeparatorWithPosition:JZSeparatorPositionLeft];
    self.leftSeparator.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    self.bottomSeparator = [self instantiateNewSeparatorWithPosition:JZSeparatorPositionBottom];
    self.bottomSeparator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.rightSeparator = [self instantiateNewSeparatorWithPosition:JZSeparatorPositionRight];
    self.rightSeparator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    self.separators = [@[self.topSeparator, self.leftSeparator, self.bottomSeparator, self.rightSeparator] mutableCopy];
    self.separatorColor = [UIColor grayColor];
    self.separatorWidth = .5f;
}

#pragma mark - Getters

- (JZSeparator *)instantiateNewSeparatorWithPosition:(JZSeparatorPosition)position
{
    JZSeparator *separator = [[JZSeparator alloc]init];

    separator = [[JZSeparator alloc]init];
    separator.position = position;
    separator.hidden = YES;
    [self addSubview:separator];
    return separator;
}

#pragma mark - Setters

- (void)setTopSeparatorEnabled:(BOOL)enabled
{
    _topSeparatorEnabled = enabled;
    self.topSeparator.hidden = !enabled;
}

- (void)setLeftSeparatorEnabled:(BOOL)enabled
{
    _leftSeparatorEnabled = enabled;
    self.leftSeparator.hidden = !enabled;
}

- (void)setBottomSeparatorEnabled:(BOOL)enabled
{
    _bottomSeparatorEnabled = enabled;
    self.bottomSeparator.hidden = !enabled;
}

- (void)setRightSeparatorEnabled:(BOOL)enabled
{
    _rightSeparatorEnabled = enabled;
    self.rightSeparator.hidden = !enabled;
}

- (void)setSeparatorWidth:(CGFloat)separatorWidth
{
    _separatorWidth = separatorWidth;
    [self setNeedsLayout];
}

- (void)setSeparatorColor:(UIColor *)separatorColor
{
    _separatorColor = separatorColor;
    [self setNeedsLayout];
}

- (void)setTopSeparatorLeftInset:(CGFloat)topSeparatorLeftInset
{
    _topSeparatorLeftInset = topSeparatorLeftInset;
    UIEdgeInsets insets = self.topSeparator.insets;
    insets.left = topSeparatorLeftInset;
    self.topSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setTopSeparatorRightInset:(CGFloat)topSeparatorRightInset
{
    _topSeparatorRightInset = topSeparatorRightInset;
    UIEdgeInsets insets = self.topSeparator.insets;
    insets.right = topSeparatorRightInset;
    self.topSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setBottomSeparatorLeftInset:(CGFloat)bottomSeparatorLeftInset
{
    _bottomSeparatorLeftInset = bottomSeparatorLeftInset;
    UIEdgeInsets insets = self.topSeparator.insets;
    insets.left = bottomSeparatorLeftInset;
    self.bottomSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setBottomSeparatorRightInset:(CGFloat)bottomSeparatorRightInset
{
    _bottomSeparatorRightInset = bottomSeparatorRightInset;
    UIEdgeInsets insets = self.topSeparator.insets;
    insets.right = bottomSeparatorRightInset;
    self.bottomSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setLeftSeparatorTopInset:(CGFloat)leftSeparatorTopInset
{
    _leftSeparatorTopInset = leftSeparatorTopInset;
    UIEdgeInsets insets = self.leftSeparator.insets;
    insets.top = leftSeparatorTopInset;
    self.leftSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setLeftSeparatorBottomInset:(CGFloat)leftSeparatorBottomInset
{
    _leftSeparatorBottomInset = leftSeparatorBottomInset;
    UIEdgeInsets insets = self.leftSeparator.insets;
    insets.bottom = leftSeparatorBottomInset;
    self.leftSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setRightSeparatorTopInset:(CGFloat)rightSeparatorTopInset
{
    _rightSeparatorTopInset = rightSeparatorTopInset;
    UIEdgeInsets insets = self.rightSeparator.insets;
    insets.top = rightSeparatorTopInset;
    self.rightSeparator.insets = insets;
    [self setNeedsLayout];
}

- (void)setRightSeparatorBottomInset:(CGFloat)rightSeparatorBottomInset
{
    _rightSeparatorBottomInset = rightSeparatorBottomInset;
    UIEdgeInsets insets = self.rightSeparator.insets;
    insets.bottom = rightSeparatorBottomInset;
    self.rightSeparator.insets = insets;
    [self setNeedsLayout];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];

    for (JZSeparator *separator in self.separators) {
        separator.color = self.separatorColor;
        separator.width = self.separatorWidth;
        separator.frame = [self separatorViewFrameForSeparator:separator];
    }
}

- (UIEdgeInsets)adjustedSeparatorInset:(JZSeparatorPosition)position insets:(UIEdgeInsets)insets
{
    switch (position) {
    case  JZSeparatorPositionTop:
    case  JZSeparatorPositionBottom:
        return (UIEdgeInsets) {
                   .top = 0,
                   .left = insets.left,
                   .bottom = 0,
                   .right = insets.right,
        };

    case  JZSeparatorPositionLeft:
    case  JZSeparatorPositionRight:
        return (UIEdgeInsets) {
                   .top = insets.top,
                   .left = 0,
                   .bottom = insets.bottom,
                   .right = 0,
        };

    default:
        return insets;
    }
}

- (CGRect)separatorViewFrameForSeparator:(JZSeparator *)separator
{
    CGRect       defaultFrame = [self defaultSeparatorViewFrame:separator.position width:separator.width];
    UIEdgeInsets insets = [self adjustedSeparatorInset:separator.position insets:separator.insets];
    CGRect       frame = UIEdgeInsetsInsetRect(defaultFrame, insets);

    return frame;
}

- (CGRect)defaultSeparatorViewFrame:(JZSeparatorPosition)position width:(CGFloat)width
{
    switch (position) {
    case  JZSeparatorPositionTop:
        return (CGRect) {
                   .origin.x = 0,
                   .origin.y = 0,
                   .size.width = CGRectGetWidth(self.bounds),
                   .size.height = width,
        };

    case  JZSeparatorPositionBottom:
        return (CGRect) {
                   .origin.x = 0,
                   .origin.y = CGRectGetMaxY(self.bounds) - width,
                   .size.width = CGRectGetWidth(self.bounds),
                   .size.height = width,
        };

    case  JZSeparatorPositionLeft:
        return (CGRect) {
                   .origin.x = 0,
                   .origin.y = 0,
                   .size.width = width,
                   .size.height = CGRectGetHeight(self.bounds),
        };

    case  JZSeparatorPositionRight:
        return (CGRect) {
                   .origin.x = CGRectGetMaxX(self.bounds) - width,
                   .origin.y = 0,
                   .size.width = width,
                   .size.height = CGRectGetHeight(self.bounds),
        };

    default:
        return CGRectZero;
    }
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];

    if ([subview isKindOfClass:[JZSeparator class]]) {
        [self sendSubviewToBack:subview];
    }
}

@end