//
//  Easy202201252230.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/25.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        
        if (nums.size() <= 1) {
            return (int)nums.size();
        }
        int index = 0;
        for (int i = 1; i< nums.size(); i++) {
            if (nums[index] != nums[i]) {
                nums[++index] = nums[i];
            }
        }
        return index+1;
    }
};


@interface Easy202201252230 : XCTestCase




@end

@implementation Easy202201252230

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    {
        vector<int> nums {1,1,2};
        int count = Solution().removeDuplicates(nums);
        XCTAssert(count == 2);
    }
    {
        vector<int> nums {0,0,1,1,1,2,2,3,3,4};
        int count = Solution().removeDuplicates(nums);
        XCTAssert(count == 5);
    }
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
