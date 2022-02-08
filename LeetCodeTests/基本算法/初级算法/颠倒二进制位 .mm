//
//  Easy202202080955.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/8.
//

#import <XCTest/XCTest.h>

class Solution {
public:
    uint32_t reverseBits(uint32_t n) {
        uint32_t ret = 0;
        for (int i = 0; i< 32; i++) {
            //ret 左移
            ret = ret << 1;
            //将ret 的最后一位设置为n的最后一位
            ret |= (n&1);
            //n右移一位
            n = n>>1;
        }
        return ret;
    }
};



@interface Easy202202080955 : XCTestCase

@end

@implementation Easy202202080955

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
