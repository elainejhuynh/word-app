//
//  ViewController.m
//  Assignment1
//
//  Created by Elaine Huynh on 9/6/15.
//  Copyright (c) 2015 edu.cs2048. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@property (weak, nonatomic) IBOutlet UIButton *secondButton;

@property (weak, nonatomic) IBOutlet UITextField *firstInput;

@property (weak, nonatomic) IBOutlet UITextField *secondInput;

@property (weak, nonatomic) IBOutlet UITextField *portInput;

@property (weak, nonatomic) IBOutlet UILabel *portDisplay;

@property (weak, nonatomic) IBOutlet UILabel *firstWordDisplay;

@property (weak, nonatomic) IBOutlet UILabel *secondWordDisplay;

@property (nonatomic, strong) NSMutableArray *portmanteaus;

@property (nonatomic, strong) NSMutableDictionary *portDictionary;

@property (weak, nonatomic) IBOutlet UITextView *listDisplay;

@property (weak, nonatomic) IBOutlet UILabel *listLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *notValidLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.portDisplay.text = @"portmanteau";
    self.firstWordDisplay.text = @"word 1";
    self.secondWordDisplay.text = @"word 2";
    self.firstInput.placeholder = @"word 1";
    self.secondInput.placeholder = @"word 2";
    self.portInput.placeholder = @"enter portmanteau";
    
    [_firstButton setTitle:@"combine" forState:UIControlStateNormal];
    [_secondButton setTitle:@"show pieces" forState:UIControlStateNormal];

    self.portmanteaus = [[NSMutableArray alloc] init];
    self.portDictionary = [[NSMutableDictionary alloc] init];
    
    self.listDisplay.text = @"";
    self.listLabel.text = @"List of portmanteaus:";
    [_listLabel setTextColor:[UIColor orangeColor]];
    
    self.titleLabel.text = @"Portmanteau App";
    [[self titleLabel] setFont:[UIFont fontWithName:@"Marker Felt" size:26]];
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.886 blue:0.886 alpha:1];
    self.notValidLabel.text = @"";
    [[self notValidLabel] setFont:[UIFont fontWithName:@"AppleGothic" size:10]];
    [_notValidLabel setTextColor:[UIColor redColor]];

    
}

- (IBAction)firstButtonPressed:(id)sender {
    NSString *wordOne = self.firstInput.text;
    NSString *wordTwo = self.secondInput.text;
    
    NSString *combined = [NSString stringWithFormat:@"%@%@", wordOne,wordTwo];
    self.portDisplay.text = combined;
    
    [_portmanteaus addObject:combined];
    NSLog(@"Current list of portmanteaus: \n%@", _portmanteaus);

    [_portDictionary setObject:@[wordOne, wordTwo] forKey:combined];
    NSLog(@"portmanteau dictionary: \n%@", _portDictionary);
    
    NSString *portList =[[_portmanteaus valueForKey:@"description"] componentsJoinedByString:@"\n"];
    self.listDisplay.text = portList;
    [_listDisplay setTextColor:[UIColor orangeColor]];
    
}

- (IBAction)secondButtonPressed:(id)sender {
    NSString *wholeWord = self.portInput.text;
    
    NSInteger portmanteausCount = [_portmanteaus count];
    
    BOOL valid = NO;
    
    for (int i= 0; i < portmanteausCount; i++) {
        NSString *matchingWord = [self.portmanteaus objectAtIndex: i];
        if ([wholeWord isEqualToString: matchingWord]) {
            valid = YES;
        }
    }
    
    if (valid) {
        NSArray *wordArray = [_portDictionary objectForKey:wholeWord];
        NSString *first = wordArray[0];
        NSString *second = wordArray[1];
        self.notValidLabel.text = @"";
        self.firstWordDisplay.text = first;
        self.secondWordDisplay.text = second;
        
    }
    
    else{
        NSLog(@"won't work");
        self.notValidLabel.text = @"Not in portmanteau list";
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
