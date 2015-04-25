//
//  ViewController.m
//  Collection View Images
//
//  Created by Jure Zove on 25/04/15.
//  Copyright (c) 2015 Candy Code. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *images;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

static NSString *directoryName = @"Images";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray const *filenames = @[@"aventador.jpeg", @"diablo.jpeg", @"huracan.jpeg"];
    
    NSMutableArray *mutableImages = [NSMutableArray arrayWithCapacity:filenames.count];
    
    // Create an array of UIImage objects
    for (NSString *filename in filenames) {
        [mutableImages addObject:[UIImage imageWithContentsOfFile:[self fullPathFor:filename]]];
    }
    self.images = [NSArray arrayWithArray:mutableImages];
    
    [self.collectionView reloadData];
}

#pragma mark - Extra - set collection view's width and height to fit screen

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.flowLayout.itemSize = self.view.bounds.size;
}

- (NSString *)fullPathFor:(NSString *)filename {
    return [[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:directoryName] stringByAppendingPathComponent:filename];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = (CustomCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];
    cell.imageView.image = self.images[indexPath.row];
    return cell;
}

@end
