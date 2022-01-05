//
//  Offer202201051338.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/5.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> exchange(vector<int>& nums) {
        int left = 0;
        int right = (int)nums.size()-1;
        while (left < right) {
            
            while (nums[left] % 2 != 0 && left < right) {
                //从左到右找第一个偶数
                left++;
            }
            
            while (nums[right] % 2 == 0 && left < right) {
                //从右到左找第一个奇数
                right--;
            }
            
            if (left < right) {
                //满足条件交换
                swap(nums[left], nums[right]);
            }
        }
        return nums;
    
    }
};

@interface Offer202201051338 : XCTestCase

@end

@implementation Offer202201051338

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    Solution su;
    vector<int>arr {1, 3, 5};
    auto ret = su.exchange(arr);

    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
