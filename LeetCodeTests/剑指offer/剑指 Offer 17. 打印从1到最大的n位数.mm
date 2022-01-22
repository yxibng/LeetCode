//
//  Offer202201221947.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/22.
//

#import <XCTest/XCTest.h>
#include <vector>

using namespace std;

class Solution {
public:
    vector<int> printNumbers(int n) {
        vector<int> ans;
        int val = pow(10, n) -1;
        for (int i = 1; i <= val; i++) {
            ans.push_back(i);
        }
        return ans;
    }
};


@interface Offer202201221947 : XCTestCase

@end

@implementation Offer202201221947

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
