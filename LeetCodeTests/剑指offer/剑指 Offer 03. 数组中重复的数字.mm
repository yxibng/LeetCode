//
//  Offer202112272146.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/27.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;




/*
 找出数组中重复的数字。


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


class Solution {
public:
    int findRepeatNumber(vector<int>& nums) {
        for (int i = 0; i< nums.size() -1; i++) {
            while (i != nums[i]) {
                int value = nums[i];
                if (nums[i] == nums[value]) {
                    return nums[i];
                }
                swap(nums[i], nums[value]);
            }
        }
        return -1;
    }
};



@interface Offer202112272146 : XCTestCase

@end

@implementation Offer202112272146

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
