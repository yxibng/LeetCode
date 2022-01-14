//
//  Offer202201141753.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/14.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> singleNumbers(vector<int>& nums) {
        //整体异或
        int ret = 0;
        for (auto &v : nums) {
            ret = ret^v;
        }
        
        //得到任意一位为1的
        int div = 1;
        while ((div & ret) == 0) {
            div = div << 1;
        }
        
        //根据 div 将数组划分
        int a = 0;
        int b = 0;
        for (auto &v:nums) {
            if (div & v) {
                //为1的一组， 异或
                a = a ^ v;
            } else {
                 //为0的一组， 异或
                b = b ^ v;
            }
        }
        return vector<int>{a, b};
    }
};

@interface Offer202201141753 : XCTestCase

@end

@implementation Offer202201141753

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    vector<int> nums{1, 2, 5, 2};
    auto ret = Solution().singleNumbers(nums);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
