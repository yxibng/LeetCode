//
//  Easy202201272234.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/27.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <unordered_set>
using namespace std;
class Solution {
public:
    bool containsDuplicate(vector<int>& nums) {
        unordered_set<int>set;
        for (int val: nums) {
            if (set.find(val) != set.end()) {
                return true;
            }
            set.insert(val);
        }
        return false;
    }
    
    bool containsDuplicate1(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        for (int i = 1; i<nums.size(); i++) {
            if (nums[i] == nums[i-1]) {
                return true;
            }
        }
        return false;
    }
    
};



@interface Easy202201272234 : XCTestCase

@end

@implementation Easy202201272234

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
