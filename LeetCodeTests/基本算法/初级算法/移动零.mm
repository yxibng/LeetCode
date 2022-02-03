//
//  Easy202202032106.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/3.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        
        
        int length = (int)nums.size();
        int i = 0;
        
        while (i < length) {
            while (nums[i] != 0) {
                i++;
            }
            //num[i] == 0;
            int j = i+1;
            while (j < length && nums[j] == 0) {
                j++;
            }
            if (j >= length) {
                break;
            }
            //num[j] != 0
            swap(nums[i], nums[j]);
        }
        
    }
};

@interface Easy202202032106 : XCTestCase

@end

@implementation Easy202202032106

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    
    {
        vector<int> nums{0,1,0,3,12};
        vector<int> ans = {1,3,12,0,0};
        
        Solution().moveZeroes(nums);
        XCTAssert(nums == ans);

    }
    
    
    {
        vector<int> nums{1};
        vector<int> ans = {1};
        
        Solution().moveZeroes(nums);
        XCTAssert(nums == ans);

        
    }
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
