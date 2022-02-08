//
//  LeetCode202202081455.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/8.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
class Solution {
public:
    bool canPlaceFlowers(vector<int>& flowerbed, int n) {
        
        if (n == 0) return true;
        if (n > flowerbed.size() / 2 + 1) return false;
        
        int count = 1;
        for (int i = 0; i< flowerbed.size(); i++) {
            if (flowerbed[i] == 1) {
                count = 0;
                continue;
            }
            count++;
            if (count == 3) {
                n--;
                count = 1;
            }
            if (n == 0) {
                return true;
            }
        }

        if (count == 2) {
            n--;
        }
        return n == 0;
    }
};


@interface LeetCode202202081455 : XCTestCase

@end

@implementation LeetCode202202081455

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
