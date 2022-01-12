//
//  Offer202201121936.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/12.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
class Solution {
public:
    bool verifyPostorder(vector<int>& postorder) {
        return recur(postorder, 0, (int)postorder.size()-1);
    }
    
    bool recur(vector<int> &nums, int start, int end) {
        if (start >= end) {
            return true;
        }
        //最后一个是根
        int root = nums[end];
        //向前遍历划分左右子树
        int p = start;
        while (nums[p] < root) {
            p++;
        }
        int mid = p;
        while (nums[p] > root) {
            p++;
        }
        return p == end && recur(nums, start, mid-1) && recur(nums, mid, end-1);
    }
};


@interface Offer202201121936 : XCTestCase

@end

@implementation Offer202201121936

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<int> nums{1,6,3,2,5};
    vector<int> nums1{1,3,2,6,5};
    
    int ret = Solution().verifyPostorder(nums);
    XCTAssert(ret == false);
    
    ret = Solution().verifyPostorder(nums1);
    XCTAssert(ret);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
