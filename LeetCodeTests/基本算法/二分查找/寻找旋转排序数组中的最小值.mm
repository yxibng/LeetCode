//
//  BinarySearch202112261200.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/26.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;

/*
 
 已知一个长度为 n 的数组，预先按照升序排列，经由 1 到 n 次 旋转 后，得到输入数组。例如，原数组 nums = [0,1,2,4,5,6,7] 在变化后可能得到：
 若旋转 4 次，则可以得到 [4,5,6,7,0,1,2]
 若旋转 7 次，则可以得到 [0,1,2,4,5,6,7]
 注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 。

 给你一个元素值 互不相同 的数组 nums ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 最小元素 。

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/binary-search/xeawbd/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
public:
    int findMin(vector<int>& nums) {
        if (nums.size() == 1) {
            //只有一个元素
            return nums[0];
        }
        int length = (int)nums.size();
        //二分
        int left = 0;
        int right = length - 1;
        while (left < right) {
            int mid = left + ((right - left) >> 1);
            if (nums[mid] <= nums[right]) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return nums[left];
    }
};



@interface BinarySearch202112261200 : XCTestCase

@end

@implementation BinarySearch202112261200

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    vector<int> nums {3,4,5,1,2};
    int ret = su.findMin(nums);
    XCTAssert(ret == 1);
    
//    vector<int> nums1 {2, 1};
//    ret = su.findMin(nums1);
//    XCTAssert(ret == 1);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
