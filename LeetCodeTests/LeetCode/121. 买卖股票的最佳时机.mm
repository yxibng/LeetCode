//
//  202112202140.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/20.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include <vector>
using namespace std;
class Solution {
public:
    int maxProfit(vector<int>& prices) {

        if (prices.empty()) {
            return 0;
        }
        int maxProfit = 0;
        int minPrice = prices[0];
        for (int i = 1; i < prices.size() ; i++) {
            int profit = prices[i] - minPrice;
            maxProfit = max(profit, maxProfit);
            minPrice = min(prices[i], minPrice);
        }
        return maxProfit;
    }
};



@interface _02112202140 : XCTestCase

@end

@implementation _02112202140

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    Solution su{};
    vector<int>v = {7, 1, 5, 3, 6, 4};
    int maxProfit = su.maxProfit(v);
    XCTAssert(maxProfit == 5);
    
    vector<int> v2 = {7, 6, 4, 3, 1};
    maxProfit = su.maxProfit(v2);
    XCTAssert(maxProfit == 0);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
