//
//  Offer202201081341.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/8.
//

#import <XCTest/XCTest.h>
#include<vector>
#include <unordered_set>
using namespace std;
class Solution {
public:
    bool isStraight(vector<int>& nums) {

        int max = nums[0];
        int min = 14;
        unordered_set<int>numSet;
        
        for (auto & v: nums) {
            if (v == 0) {
                continue;
            }
            if (numSet.find(v) != numSet.end()) {
                return false;
            } else {
                numSet.insert(v);
            }
            max = std::max(max, v);
            min = std::min(min, v);
        }
        return max-min < 5;
    }
};
@interface Offer202201081341 : XCTestCase

@end

@implementation Offer202201081341

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
