//
//  Cell.m
//  MyCollectionView
//
//  Created by Quy Sang Le on 11/5/12.
//  Copyright (c) 2012 Quy Sang Le. All rights reserved.
//

#import "Cell.h"
#import "QuartzCore/QuartzCore.h"

//@interface Cell(){
//    __block UIActivityIndicatorView *activityIndicator;
//}

//@end

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"INIT CELL");
        // Initialization code
        [self.backgroundView setBackgroundColor:[UIColor whiteColor]];
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        //indicator
        self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.loadingIndicator.center = self.contentView.center;
        [self.loadingIndicator setHidesWhenStopped:YES];
        [self.contentView addSubview:self.loadingIndicator];
        //cellImage
        self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)setImageURL:(NSString *)imageURL
{
    if (_imageURL != imageURL)
    {
        _imageURL = imageURL;
        [self.imageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"placeholder.png"] options:SDWebImageProgressiveDownload
        progress:^(NSUInteger receivedSize, long long expectedSize)
         {
             [self.loadingIndicator startAnimating];
         }
        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
         {
             [self.loadingIndicator stopAnimating];
         }];        
    }
}





@end
