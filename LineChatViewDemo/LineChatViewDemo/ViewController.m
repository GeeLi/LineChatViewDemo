//
//  ViewController.m
//  LineChatViewDemo
//
//  Created by 李帅 on 16/3/9.
//  Copyright © 2016年 company. All rights reserved.
//

#import "ViewController.h"
#import "PNLineChartView.h"
#import "PNPlot.h"
#define PSColorToUIColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface ViewController ()
@property(nonatomic,strong) PNLineChartView* lineChartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //折线图
    self.lineChartView = [[PNLineChartView alloc] initWithFrame:CGRectMake(0,100,[UIScreen mainScreen].bounds.size.width - 20,300)];
    self.lineChartView.backgroundColor = [UIColor clearColor];
    NSArray* plottingDataValues = @[@0,@15,@20,@10,@14,@26,@45,@30,@15,@17,@32,@14,@10,@22,@45,@51,@44,@18,@28,@38,@40];
    self.lineChartView.max = [[plottingDataValues valueForKeyPath:@"@max.floatValue"] floatValue];
    self.lineChartView.min = 0;
    self.lineChartView.interval = 10;
    NSMutableArray* yAxisValues = [NSMutableArray array];
    for (int i=0; i<7; i++) {
        NSString* str = [NSString stringWithFormat:@"%.0f", self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < plottingDataValues.count; i ++)
    {
        [arrayM addObject:[NSString stringWithFormat:@"%d:00",i]];
    }
    
    self.lineChartView.xAxisValues = arrayM;
    //颜色
    self.lineChartView.xAxisFontColor = [UIColor grayColor];
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    self.lineChartView.horizontalLinesColor = [UIColor grayColor];
    
    PNPlot *plots = [[PNPlot alloc] init];
    plots.plottingValues = plottingDataValues;
    plots.lineColor = PSColorToUIColor(229, 86, 36);
    plots.lineWidth = 2;
    [self.lineChartView addPlot:plots];

    [self.view addSubview:self.lineChartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
