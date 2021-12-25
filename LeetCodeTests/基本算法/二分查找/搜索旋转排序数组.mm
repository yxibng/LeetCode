//
//  BinarySearch202112252010.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/25.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;

/*
 整数数组 nums 按升序排列，数组中的值 互不相同 。

 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/binary-search/xeog5j/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 */

class Solution {
    
    int searchHelper(vector<int> &nums, int start, int end, int target){
        
        if (start > end) {
            return -1;
        }
        
        int mid = start + ((end - start)>>1);
        
        int leftValue = nums[start];
        int rightValue = nums[end];
        int midValue = nums[mid];
        
        if (leftValue == target) {
            return start;
        }
        
        if (rightValue == target) {
            return end;
        }
        
        if (midValue == target) {
            return mid;
        }
        
        
        if (leftValue < midValue) {
            //左侧有序
            if (leftValue < target && target < midValue) {
                //在左侧区间
                return searchHelper(nums, start+1, mid-1, target);
            } else {
                //去右侧寻找
                return searchHelper(nums, mid+1, end-1, target);
            }
        } else {
            //右侧有序
            if (midValue < target && target < rightValue) {
                //在右侧区间
                return searchHelper(nums, mid+1, end-1, target);
            } else {
                //去左侧区间寻找
                return searchHelper(nums, start+1, mid-1, target);
            }
        }
    }
public:
    int search(vector<int>& nums, int target) {
        return searchHelper(nums, 0, (int)nums.size()-1, target);
    }
};




@interface BinarySearch202112252010 : XCTestCase

@end

@implementation BinarySearch202112252010

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Solution su;
    vector<int> nums{4,5,6,7,0,1,2};
    int target = su.search(nums, 0);
    XCTAssert(target == 4);
    
    target = su.search(nums, 3);
    XCTAssert(target == -1);
    
    vector<int> nums1{1};
    target = su.search(nums1, 0);
    XCTAssert(target == -1);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
