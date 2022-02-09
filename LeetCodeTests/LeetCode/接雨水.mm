//
//  LeetCode202202091318.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/9.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    int trap(vector<int>& height) {
        int n = (int)height.size();
        vector<int> leftMax(n);
        vector<int> rightMax(n);
        
        int maxHeight = 0;
        for (int i = 0; i < n; i++) {
            maxHeight = max(maxHeight, height[i]);
            leftMax[i] = maxHeight;
        }
        maxHeight = 0;
        for (int j = n-1; j >= 0; j--) {
            maxHeight = max(maxHeight, height[j]);
            rightMax[j] = maxHeight;
        }
        int sum = 0;
        for (int k = 1; k < n-1; k++) {
            sum += min(leftMax[k], rightMax[k]) - height[k];
        }
        return sum;
    }
};


@interface LeetCode202202091318 : XCTestCase

@end

@implementation LeetCode202202091318

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    {
        vector<int> nums{0,1,0,2,1,0,1,3,2,1,2,1};
        int ret = Solution().trap(nums);
        XCTAssert(ret == 6);
    }
    
    {
        vector<int> nums{4,2,0,3,2,5};
        int ret = Solution().trap(nums);
        XCTAssert(ret == 9);
    }



}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
