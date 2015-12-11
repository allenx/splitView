//
//  ViewController.m
//  splitView
//
//  Created by Allen X on 11/24/15.
//  Copyright © 2015 Allen X. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    int page;
}

@end

@implementation ViewController
@synthesize newsList, splitTableView;

- (void)viewDidLoad {
    newsList = [[NSMutableArray alloc]initWithCapacity:54];
    [super viewDidLoad];
    page = 0;
    [self getData];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getData{
    NSLog(@"lsdf");
    page++;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:[[NSString alloc]initWithFormat:@"http://open.twtstudio.com/api/v1/news/1/page/%d", page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSArray *news = [dic objectForKey:@"data"];
        for (NSDictionary *dict in news){
            NSLog(@"%@",[dict objectForKey:@"subject"]);
            [newsList addObject:dict];
        }
        [splitTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",(unsigned long)[newsList count]);
    return [newsList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"identifier";
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[customCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.subject.text = [newsList[indexPath.row] objectForKey:@"subject"];
    cell.comments.text = [[NSString alloc]initWithFormat:@"评论(%@)", [newsList[indexPath.row] objectForKey:@"comments"]];
    cell.visits.text = [[NSString alloc]initWithFormat:@"访问(%@)", [newsList[indexPath.row] objectForKey:@"visitcount"]];
    NSString *url = [newsList[indexPath.row] objectForKey:@"pic"];
    [cell.image setImageWithURL:[NSURL URLWithString:url]];
    
    return cell;


}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.y==scrollView.contentSize.height - scrollView.frame.size.height){
        [self getData];
        //[splitTableView reloadData];
    }
    /*if(scrollView.contentOffset.y==0){
        NSLog(@"lalal");
    }*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
