//
//  Offer202201161955.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/16.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    int majorityElement(vector<int>& nums) {

        int count = 0;
        int candidate = 0;
        
        for(int &val : nums) {
            if (count == 0) {
                candidate = val;
                count++;
            } else {
                if (val == candidate) {
                    count++;
                } else {
                    count--;
                }
            }
        }
        return candidate;
    }
};


@interface Offer202201161955 : XCTestCase

@end

@implementation Offer202201161955

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<int>nums {1, 2, 3, 2, 2, 2, 5, 4, 2};
    int ret = Solution().majorityElement(nums);
    XCTAssert(ret == 2);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
