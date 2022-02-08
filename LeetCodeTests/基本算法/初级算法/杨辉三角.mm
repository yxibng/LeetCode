//
//  Easy202202081009.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/8.
//

#import <XCTest/XCTest.h>
#include <vector>

using namespace std;
class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<vector<int>>ret;
        for (int i = 1; i <= numRows; i++) {
            vector<int>nums(i);
            for (int j = 1; j <= i; j++) {
                if (j == 1 || j == i) {
                    nums[j-1] = 1;
                } else {
                    nums[j-1] = ret[i-2][j-2] + ret[i-2][j-1];
                }
            }
            ret.push_back(nums);
        }
        return ret;
    }
};



@interface Easy202202081009 : XCTestCase

@end

@implementation Easy202202081009

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    auto ret = Solution().generate(5);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
