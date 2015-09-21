//
//  goodsview.m
//  泽臻小店
//
//  Created by xiaoguang yang on 15/4/17.
//  Copyright (c) 2015年 Apollo. All rights reserved.
//

#import "goodsview.h"

NSString *const getgoossaleliest = @"kdt.items.onsale.get";
NSString *const addgood = @"kdt.item.add";



@interface goodsview ()

@end

@implementation goodsview
@synthesize navbar;
@synthesize searchtext;
@synthesize tableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    recivedata = [[NSMutableData alloc] init];
    
    searchtext.delegate=self;
    searchtext.enablesReturnKeyAutomatically=YES;
    searchtext.returnKeyType = UIReturnKeySearch;
    
    
    navtitle = [[UINavigationItem alloc] init];
    navtitle.title = @"商品列表";
    datalen=0;
    
    rightButton = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleBordered target:self action:@selector(selectrightAction:)];
    
    leftButton = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleBordered target:self action:@selector(selectleftAction:)];
    [navtitle setLeftBarButtonItem:leftButton animated:YES];
//    [navtitle setRightBarButtonItem:rightButton animated:YES];
    navtitle.hidesBackButton=YES;
    [navbar pushNavigationItem:navtitle animated:YES];
    
    
    
    
    UINib *nib=[UINib nibWithNibName:@"Cell" bundle:[NSBundle bundleWithIdentifier:@"goodscell"]];
    [tableview registerNib:nib forCellReuseIdentifier:@"goodscell" ];
    [tableview setBackgroundColor:[UIColor clearColor]];

    searchtext.backgroundColor=[UIColor clearColor];
    tableview.delegate=self;
    tableview.dataSource =self;
    indicator = [[YYAnimationIndicator alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height/2-40, 80, 80)];
    [indicator setLoadText:@"正在努力加载..."];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tabBarController.selectedIndex=0;
    FirstViewController *view =[self.tabBarController.viewControllers objectAtIndex:0];
    
    NSDictionary *dic = [dataarray objectAtIndex:indexPath.row];
    
    NSURL *url = [[NSURL alloc] initWithString:[dic objectForKey:@"detail_url"]];
    
    [view.webui loadRequest:[[NSURLRequest alloc] initWithURL:url]];
}

-(void)tableView:(UITableView*)tableView  willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return datalen;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GoodsCell *goodcell = [tableview dequeueReusableCellWithIdentifier:@"goodscell" ];
    if (goodcell == nil)
        goodcell = [[GoodsCell alloc] init];
    [goodcell setCelllInfo:[dataarray objectAtIndex:indexPath.row]];
    
    return goodcell;
    
}

-(void)selectleftAction:(id)sender
{
    //TODO:添加 商品
    [searchtext resignFirstResponder];
    
    NSString * strurl=[koudaitong encodeDictionary:[koudaitong getURl:getgoossaleliest] paramdictionary:[koudaitong getGoodsParams:@""]];
    
    NSLog(@"%@",strurl);
    
    [recivedata resetBytesInRange:NSMakeRange(0, recivedata.length)];
    [recivedata setLength:0];
    datalen=0;
    [koudaitong sendHttpUrl:[strurl stringByReplacingOccurrencesOfString:@"%20" withString:@" "]  httpdelegate:self];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self setVisualEffect];
    }
    [self.view addSubview:indicator];
    [indicator startAnimation];  //开始转动
    
}

-(void)selectrightAction:(id)sender
{
    
    //TODO:添加 商品
    [searchtext resignFirstResponder];
    [self performSegueWithIdentifier:@"addgood" sender:self];
    
}



#pragma mark - NSURLConnectionDataDelegate
#pragma mark 接收到服务器返回的数据时调用（如果数据比较多，这个方法可能会被调用多次）
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"接收到服务器返回的数据");
    // 拼接数据
    [recivedata appendData:data];
}

#pragma mark 网络连接出错时调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"网络连接出错:%@", [error localizedDescription]);
    [indicator stopAnimationWithLoadText:@"失败" withType:YES];//加载成功
    [effectview removeFromSuperview];
    
}
#pragma mark 服务器的数据已经接收完毕时调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"服务器的数据已经接收完毕");
    // 解析成字符串数据
    NSString *str = [[NSString alloc] initWithData:recivedata encoding:NSUTF8StringEncoding ];
    NSLog(@"json %@", str);
    
    [indicator stopAnimationWithLoadText:@"完成" withType:YES];//加载成功
    [effectview removeFromSuperview];
    
    
    NSDictionary *dataDictory = [NSJSONSerialization JSONObjectWithData:recivedata options:kNilOptions error:nil];
    NSDictionary *dataDictory2= [dataDictory objectForKey:@"response"];
    datalen =[[dataDictory2 objectForKey:@"total_results"] integerValue];
    NSLog(@"数据 %i", datalen);
    dataarray = [dataDictory2 objectForKey:@"items"];
    
    [tableview reloadData];
    if (datalen == 0)
    {
        UIAlertView *aleartview = [[UIAlertView alloc] initWithTitle:@"商品搜索" message:@"不好意思，你要的商品我们还没有采购，不着急看看有没有别的需要" delegate:self cancelButtonTitle:@"重新搜索" otherButtonTitles: @"随便看看",nil];
        [aleartview show];
    
        
    }
    //    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGBK_95);
    //    NSString *result = [[NSString alloc] initWithData:recivedata encoding:gbkEncoding];
    //    NSLog(@"json %@", result);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            searchtext.text=@"";
            
            break;
        case 1:
            searchtext.text=@"";
            [self selectleftAction:self];
    
            break;
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [searchtext resignFirstResponder];
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchtext resignFirstResponder];
    NSString *searchstr = searchtext.text;
    NSString * strurl=[koudaitong encodeDictionary:[koudaitong getURl:getgoossaleliest] paramdictionary:[koudaitong getGoodsParams:searchstr]];
    
    NSLog(@"%@",strurl);
    
    [recivedata resetBytesInRange:NSMakeRange(0, recivedata.length)];
    [recivedata setLength:0];
    datalen=0;
    [koudaitong sendHttpUrl:[strurl stringByReplacingOccurrencesOfString:@"%20" withString:@" "]  httpdelegate:self];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self setVisualEffect];
    }
    [self.view addSubview:indicator];
    [indicator startAnimation];  //开始转动
    
}

-(void)setVisualEffect
{
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    
    effectview.frame =tableview.frame;
    
    [self.view addSubview:effectview];
}






/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
