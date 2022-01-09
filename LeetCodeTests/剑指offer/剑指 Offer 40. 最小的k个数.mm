//
//  Offer202201091120.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/9.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;

class Solution {
public:
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        if (k == 0) {
            return vector<int>{};
        }
        quickSelect(arr, 0, (int)arr.size()-1, k-1);
        return vector<int>(arr.begin(), arr.begin()+k);
    }
    
    int quickSelect(vector<int>&arr, int start, int end, int k) {
        int mid = partition(arr, start, end);
        if (mid == k) {
            return mid;
        } else if(mid < k) {
            return quickSelect(arr, mid+1, end, k);
        } else {
            return quickSelect(arr, start, mid-1, k);
        }
    }
    int partition(vector<int> & arr, int start, int end) {
        if (start == end) {
            return start;
        }
        int pivot = arr[end];
        int i = start;
        for (int j = start; j< end; j++) {
            if (arr[j] < pivot) {
                swap(arr[i], arr[j]);
                i++;
            }
        }
        swap(arr[end], arr[i]);
        return i;
    }

};


@interface Offer202201091120 : XCTestCase

@end

@implementation Offer202201091120

void printVector(vector<int> &nums) {
    for(auto &num : nums) {
        NSLog(@"%d", num);
    }
}


- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    
  
    vector<int>arr{0,0,2,3,2,1,1,2,0,4};
    auto ret = su.getLeastNumbers(arr, 10);
    printVector(ret);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
