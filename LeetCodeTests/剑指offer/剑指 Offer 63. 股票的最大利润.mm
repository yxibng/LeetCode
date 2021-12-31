//
//  Offer202112311459.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2021/12/31.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;


/*
 假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？

  

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
  

 限制：

 0 <= 数组长度 <= 10^5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */


class Solution {
public:
    int maxProfit(vector<int>& prices) {
        if (prices.size() <= 1) {
            return 0;
        }
        int profile = 0;
        int minPrice = prices[0];
        for (int i = 1; i< prices.size(); i++) {
            int p = prices[i] - minPrice;
            profile = max(p, profile);
            minPrice = min(prices[i], minPrice);
        }
        return profile;
    }
};





@interface Offer202112311459 : XCTestCase

@end

@implementation Offer202112311459

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
