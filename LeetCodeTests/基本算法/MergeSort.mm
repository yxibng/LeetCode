//
//  MergeSort.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/22.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
    
public:
    void mergeSort(vector<int>&nums, int start, int end , vector<int>&temp) {
        
        if (start == end) {
            return;
        }
        
        int mid = start + (end - start)/2;
        mergeSort(nums, start, mid, temp);
        mergeSort(nums, mid+1, end, temp);
        int i = start;
        int j = mid+1;
        int k = start;
                
        while (i<=mid && j <= end) {
            if (nums[i] <= nums[j]) {
                temp[k++] = nums[i++];
            } else {
                temp[k++] = nums[j++];
            }
        }
        
        while (i<=mid) {
            temp[k++] = nums[i++];
        }
        
        while (j<=end) {
            temp[k++] = nums[j++];
        }
        
        for (int i = start; i<= end; i++) {
            nums[i] = temp[i];
        }
        
        NSLog(@"start = %d, mid = %d, end = %d", start, mid, end);
        for (int v : temp) {
            printf("%d ", v);
        }
        printf("\n");
    }
};






@interface MergeSort : XCTestCase

@end

@implementation MergeSort

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    vector<int> nums {1, 3, 5, 2, 7, 4};
    
    vector<int> ret(nums.size());
    
    Solution().mergeSort(nums, 0, nums.size()-1, ret);
    
    
    vector<int> sorted {1, 2, 3, 4, 5, 7};
    XCTAssert(sorted == nums);
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
