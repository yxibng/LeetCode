//
//  Offer202201141855.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/14.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;


class Solution {
public:
    int singleNumber(vector<int>& nums) {

        //统计每一位1的个数
        vector<int> ret (32, 0);
        for (int i = 0; i< nums.size(); i++) {
            int val = nums[i];
            for (int j = 0; j< 32; j++) {
                if (val & (1<<j)) {
                    ret[j]++;
                }
            }
        }
        //每一位对3求余
        int num = 0;
        for (int i = 0; i< ret.size(); i++) {
            int val = ret[i] % 3;
            if (val) {
                num = num | (1 << i);
            }
        }
        return num;
    }
};


@interface Offer202201141855 : XCTestCase

@end

@implementation Offer202201141855

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<int> nums {3,4,3,3};
    
    int ret = Solution().singleNumber(nums);
    XCTAssert(ret == 4);
    

    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
