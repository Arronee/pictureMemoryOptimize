//
//  ViewController.m
//  pictureMemoryOptimize
//
//  Created by roc on 2017/6/10.
//  Copyright © 2017年 roc. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "picCollectionViewCell.h"

#define base @"http://www.fanhuihuan.top:8080/picture/pic/"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *pictureArray;//图片数组

@property(nonatomic,strong)UICollectionView *collectionView;//图片展示collectionveiw

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pictureArray = [NSMutableArray array];

    
    for (int i = 1; i<201; i++) {
        NSString *picStr = [NSString stringWithFormat:base@"%d.jpg",i];
        [_pictureArray addObject:picStr];
    }
        
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(100, 100);
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];

    [_collectionView registerNib:[UINib nibWithNibName:@"picCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"AAA"];
    
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _pictureArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    picCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AAA" forIndexPath:indexPath];
    cell.imagV.backgroundColor = [UIColor whiteColor];
    [cell.imagV sd_setImageWithURL:[NSURL URLWithString:_pictureArray[indexPath.row]]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
