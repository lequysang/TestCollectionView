//
//  Cell.h
//  MyCollectionView
//
//  Created by Quy Sang Le on 11/5/12.
//  Copyright (c) 2012 Quy Sang Le. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface Cell : UICollectionViewCell

@property (strong , nonatomic) UIImageView *imageView;
@property (strong , nonatomic) NSString *imageURL;

@property (strong , nonatomic) UIActivityIndicatorView *loadingIndicator;

- (void)setImageURL:(NSString *)imageURL;

@end
