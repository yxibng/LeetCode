//
//  Easy202202061402.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/6.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
class Solution {
public:
    void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
        int end = m + n - 1;
        int end_m = m - 1;
        int end_n = n - 1;
        
        while (end_m >= 0 && end_n >= 0) {
            
            if (nums1[end_m] >= nums2[end_n]) {
                nums1[end] = nums1[end_m];
                end_m--;
            } else {
                nums1[end] = nums2[end_n];
                end_n--;
            }
            end--;
        }
        
        while (end_n >= 0) {
            nums1[end] = nums2[end_n];
            end_n--;
            end--;
        }
    }
};
@interface Easy202202061402 : XCTestCase

@end

@implementation Easy202202061402

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
