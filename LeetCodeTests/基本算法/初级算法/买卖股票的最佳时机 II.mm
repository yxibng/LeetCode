//
//  Easy202201252244.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/25.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution_202201260937 {
public:
    int maxProfit(vector<int>& prices) {
        if (prices.size() <= 1) {
            return 0;
        }
        vector<int> cash(prices.size(), 0);
        vector<int> hold(prices.size(), 0);
        //持有现金
        cash[0] = 0;
        //持有股票
        hold[0] = -prices[0];
        for (int i = 1; i< prices.size(); i++) {
            //卖出股票，得到现金
            cash[i] = max(cash[i-1], hold[i-1] + prices[i]);
            //买入股票，现金减少
            hold[i] = max(cash[i-1]-prices[i], hold[i-1]);
        }
        
        return cash[prices.size() -1];
    }
};


@interface Easy202201252244 : XCTestCase

@end

@implementation Easy202201252244

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<int> nums{7,1,5,3,6,4};
    int ret = Solution_202201260937().maxProfit(nums);
    XCTAssert(ret == 7);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
