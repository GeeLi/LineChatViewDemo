# LineChatViewDemo
##折线图绘制的domo，帮助如何快速绘制折线图

###第一步
导入Demo中的第三方库，导入头文件,
```Objective-C
#import "PNLineChartView.h"
#import "PNPlot.h"
````
###第二步
创建lineChatView,设置折线图的属性
```Objective-C
//折线图
    self.lineChartView = [[PNLineChartView alloc] initWithFrame:CGRectMake(0,100,[UIScreen mainScreen].bounds.size.width - 20,300)];
    self.lineChartView.backgroundColor = [UIColor clearColor];
    NSArray* plottingDataValues = @[@0,@15,@20,@10,@14,@26,@45,@30,@15,@17,@32,@14,@10,@22,@45,@51,@44];
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
    self.lineChartView.xAxisFontColor = [UIColor whiteColor];
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    
    PNPlot *plots = [[PNPlot alloc] init];
    plots.plottingValues = plottingDataValues;
    plots.lineColor = PSColorToUIColor(229, 86, 36);
    plots.lineWidth = 2;
    [self.lineChartView addPlot:plots];

    [self.view addSubview:self.lineChartView];
```

##显示效果
