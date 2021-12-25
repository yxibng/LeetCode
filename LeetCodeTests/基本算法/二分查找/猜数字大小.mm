//
//  BinarySearch202112252001.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/25.
//

#import <XCTest/XCTest.h>

/*
 猜数字游戏的规则如下：

 每轮游戏，我都会从 1 到 n 随机选择一个数字。 请你猜选出的是哪个数字。
 如果你猜错了，我会告诉你，你猜测的数字比我选出的数字是大了还是小了。
 你可以通过调用一个预先定义好的接口 int guess(int num) 来获取猜测结果，返回值一共有 3 种可能的情况（-1，1 或 0）：

 -1：我选出的数字比你猜的数字小 pick < num
 1：我选出的数字比你猜的数字大 pick > num
 0：我选出的数字和你猜的数字一样。恭喜！你猜对了！pick == num
 返回我选出的数字。

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/binary-search/xee4ev/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    
    
    int guess(int num) {
        return 0;
    }
public:
    int guessNumber(int n) {
     
        int left = 1;
        int right = n;
        
        while (left <= right) {
            
            int mid = left + ((right - left)>>1);
            int ret = guess(mid);
            if (ret == 0) {
                return  mid;
            } else if (ret == -1) {
                right = mid -1;
            } else {
                left = mid +1;
            }
            
        }
        return -1;
    }
};


@interface BinarySearch202112252001 : XCTestCase

@end

@implementation BinarySearch202112252001

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
