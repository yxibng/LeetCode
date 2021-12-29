//
//  Pow202112291022.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/29.
//

#import <XCTest/XCTest.h>

class Solution {
public:
    double myPow(double x, int n) {

        if (n == 0) {
            return 1;
        }
        
        if (n==-2147483648) {
            // -2^31 ~ 2^31-1, 考虑溢出的情况
            return 1 / travel(x, -(n+1)) * x;
        }
        
        int N = n > 0? n: -n;
        double val = travel(x, N);
        return n > 0 ? val : 1 / val;
    }
    
    double travel(double x, int n) {
        
        if (n == 0) {
            return 1;
        }
        double val = travel(x, n/2);
        return n %2 == 0 ? val * val : val * val * x;
    }
};

@interface Pow202112291022 : XCTestCase

@end

@implementation Pow202112291022

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    
    Solution su;
    double ret = su.myPow(2.0, -2147483648);
    
    NSLog(@"ret = %f",ret);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
