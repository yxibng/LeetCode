//
//  Easy202202071014.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/7.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <string>
using namespace std;
class Solution {
public:
    vector<string> fizzBuzz(int n) {
        vector<string>ret(n);
        for (int i = 1; i<=n; i++) {
            if (i % 3 == 0 && i % 5 == 0) {
                ret[i-1] = "FizzBuzz";
            } else if (i % 3 == 0) {
                ret[i-1] = "Fizz";
            } else if (i % 5 == 0) {
                ret[i-1] = "Buzz";
            } else {
                ret[i - 1] = to_string(i);
            }
        }
        return ret;
    }
};
@interface Easy202202071014 : XCTestCase

@end

@implementation Easy202202071014

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
