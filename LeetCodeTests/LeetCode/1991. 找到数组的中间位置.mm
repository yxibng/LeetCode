//
//  LeetCode202202152254.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/15.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    int findMiddleIndex(vector<int>& nums) {

        vector<int>leftSum(nums.size(),0);
        vector<int>rightSum(nums.size(),0);
        
        for(int i = 1; i< nums.size(); i++) {
            leftSum[i] = leftSum[i-1] + nums[i-1];
        }
        for(int j = nums.size()-2; j >= 0; j--) {
            rightSum[j] = rightSum[j+1] + nums[j+1];
        }
        
        for (int k = 0; k < nums.size(); k++) {
            if (leftSum[k] == rightSum[k]) {
                return k;
            }
        }
        return -1;
    }
};


@interface LeetCode202202152254 : XCTestCase

@end

@implementation LeetCode202202152254

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    vector<int>nums {2,3,-1,8,4};
    int ret = Solution().findMiddleIndex(nums);
    XCTAssert(ret == 3);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
