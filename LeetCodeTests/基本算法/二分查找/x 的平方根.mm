//
//  MySqrt202112251948.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/25.
//

#import <XCTest/XCTest.h>

/*
 
 给你一个非负整数 x ，计算并返回 x 的 算术平方根 。

 由于返回类型是整数，结果只保留 整数部分 ，小数部分将被 舍去 。

 注意：不允许使用任何内置指数函数和算符，例如 pow(x, 0.5) 或者 x ** 0.5 。

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/binary-search/xe9cog/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
public:
    int mySqrt(int x) {
        
        if (x == 0) {
            return 0;
        }
        
        int left = 1;
        int right = x;
        
        while (left <= right) {
            int64_t mid = left + ((right - left) >> 1);
            if (mid * mid == x) {
                //找到了目标值
                return (int)mid;
            } else if (mid * mid < x) {
                if ((mid + 1) * (mid + 1) > x) {
                    //找了目标值
                    return (int)mid;
                }
                left = (int)mid + 1;
            } else {
                right = (int)mid - 1;
            }
        }
        return 0;
    }
};

@interface MySqrt202112251948 : XCTestCase

@end

@implementation MySqrt202112251948

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    int ret = su.mySqrt(8);
    XCTAssert(ret == 2);
    ret = su.mySqrt(0);
    XCTAssert(ret == 0);
    ret = su.mySqrt(9);
    XCTAssert(ret == 3);
    
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
