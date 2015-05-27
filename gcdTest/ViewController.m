//
//  ViewController.m
//  gcdTest
//
//  Created by Douglas Voss on 5/27/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *startLongOperation;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *outLabel;

@end

@implementation ViewController

- (IBAction)startLongOperationMethod
{
    dispatch_queue_t queue;
    if (queue==nil) {
        queue = dispatch_queue_create("long.operation.queue", nil);
    }
    dispatch_async(queue, ^{[self longRunningOperation];});
}

- (void)longRunningOperation
{
    //sleep(3);
    [NSThread sleepForTimeInterval:3];
    dispatch_async(dispatch_get_main_queue(), ^{self.outLabel.text=[NSString stringWithFormat:@"awesome sauce %d", arc4random_uniform(5)];});
    
}
                          
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
