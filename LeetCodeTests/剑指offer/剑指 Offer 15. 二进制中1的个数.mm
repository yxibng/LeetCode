//
//  Offer202201131345.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/13.
//

#import <XCTest/XCTest.h>
class Solution {
public:
    int hammingWeight(uint32_t n) {
        
        int count = 0;
        for (int i = 0; i< 32; i++) {
            if ((1<<i) & n) {
                count++;
            }
        }
        return count;
    }
};


@interface Offer202201131345 : XCTestCase

@end

@implementation Offer202201131345

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
