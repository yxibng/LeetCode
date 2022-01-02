//
//  Offer202201020908.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/2.
//

#import <XCTest/XCTest.h>
#include<string>
#include<vector>
using namespace std;

/*
 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

  

 示例 1:

 输入: 12258
 输出: 5
 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
  

 提示：

 0 <= num < 231

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
public:
    int translateNum(int num) {
        string str = to_string(num);
        vector<int> dp(str.size());
        dp[0] = 1;
        
        for (int i = 1; i< str.size(); i++) {
            int val = std::stoi(str.substr(i-1, 2));
            if (val > 9 && val < 26) {
                if (i == 1) {
                    dp[i] = dp[i-1] + 1;
                } else {
                    dp[i] = dp[i-1] + dp[i-2];
                }
            } else {
                dp[i] = dp[i-1];
            }
        }
        return dp[str.size() -1];
    }
};




@interface Offer202201020908 : XCTestCase

@end

@implementation Offer202201020908

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    int ret = su.translateNum(12258);
    XCTAssert(ret == 5);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
