//
//  Test202112212155.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/21.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include <vector>

using namespace std;
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>>answer;
        if (nums.size() < 3) {
            return answer;
        }
        
        sort(nums.begin(), nums.end(), [](const int &a, const int &b){
            return a <= b;
        });
        
        for (int i = 0; i < nums.size(); i++) {
            //第一个数大于等于0
            if (nums[i] > 0) {
                break;
            }
            //找到第一个不相同的数
            
            if(i > 0 && nums[i] == nums[i-1]) {
                continue;
            } // 去重
            
            int L = i + 1;
            int R = (int)nums.size()-1;
            while (L < R) {
                int sum = nums[i] + nums[L] + nums[R];
                if ( sum < 0) {
                    //小了， L++
                    L++;
                } else if (sum > 0) {
                    //大了， R--
                    R--;
                } else {
                    vector<int> ret {nums[i], nums[L], nums[R]};
                    answer.push_back(ret);
                    //过滤掉重复的
                    while (L < R && nums[L] == nums[L+1]) { L++; }
                    while (L < R && nums[R] == nums[R-1]) { R--; }
                    L++;
                    R--;
                }
            }
        }
        return answer;
    }
};

@interface Test202112212155 : XCTestCase

@end

@implementation Test202112212155

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    vector<int> arr {-1, 0, 1, 2, -1, -4};
    vector<vector<int>>ret = su.threeSum(arr);
    vector<vector<int>> answer = {
        {-1, -1, 2},
        {-1, 0, 1}
    };
    XCTAssert(ret == answer);
    
    vector<int> test {-9,8,0,-4,6,-9,-2,-8,-6,9,6,-9,3,-3,6,6,6,4,4,-9,-9};
    ret = su.threeSum(test);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
