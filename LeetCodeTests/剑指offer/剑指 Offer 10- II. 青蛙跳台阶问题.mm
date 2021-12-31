//
//  Offer202112311441.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2021/12/31.
//

#import <XCTest/XCTest.h>

/*
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 示例 2：

 输入：n = 7
 输出：21
 示例 3：

 输入：n = 0
 输出：1
 提示：

 0 <= n <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
public:
    int numWays(int n) {

        if (n == 0 || n == 1) {
            return 1;
        }
        int left = 1;
        int right = 1;
        int ret = 2;
        for (int i = 2; i <= n; i++) {
            ret = (left + right)%1000000007;
            left = right;
            right = ret;
        }
        return ret;
    }
};

@interface Offer202112311441 : XCTestCase

@end

@implementation Offer202112311441

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
