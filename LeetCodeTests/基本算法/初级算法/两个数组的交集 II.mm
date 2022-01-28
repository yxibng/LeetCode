//
//  Easy202201282229.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/28.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {

        if (nums1.empty() || nums2.empty()) {
            return {};
        }
        sort(nums1.begin(), nums1.end());
        sort(nums2.begin(), nums2.end());
        
        int i = 0;
        int j = 0;
        vector<int>ret;
        
        while (i < nums1.size() && j < nums2.size()) {
            if (nums1[i] > nums2[j]) {
                j++;
            } else if(nums1[i] < nums2[j]) {
                i++;
            } else {
                ret.push_back(nums1[i]);
                i++;
                j++;
            }
        }
        return ret;
    }
};
@interface Easy202201282229 : XCTestCase

@end

@implementation Easy202201282229

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
