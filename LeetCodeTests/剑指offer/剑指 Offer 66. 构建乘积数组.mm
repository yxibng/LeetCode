//
//  Offer202201162020.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/16.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;


class Solution {
public:
    vector<int> constructArr(vector<int>& a) {
        int size = (int)a.size();
        vector<int> start(size, 1);
        vector<int> end(size, 1);
        
        for (int i = 1; i< a.size(); i++) {
            start[i] = start[i-1] * a[i-1];
        }
        int t = 1;
        for (int j = size-2; j>=0; j--) {
            t = t * a[j+1];
            start[j] = start[j] * t;
        }
        return start;
    }
};



@interface Offer202201162020 : XCTestCase

@end

@implementation Offer202201162020

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<int> nums {1,2,3,4,5};
    
    auto ret = Solution().constructArr(nums);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
