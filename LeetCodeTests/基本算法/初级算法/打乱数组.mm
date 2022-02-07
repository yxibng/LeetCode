//
//  Easy202202070944.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/7.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {

private:
    vector<int>data;
public:
    Solution(vector<int>& nums) {
        data = nums;
    }
    
    vector<int> reset() {
        return data;
    }
    
    vector<int> shuffle() {
        vector<int> ret(data);
        for (int i = (int)data.size()-1; i>0; i--) {
            int index = rand()%(i+1);
            if (index != i) {
                swap(ret[i], ret[index]);
            }
        }
        return ret;
    }
};



@interface Easy202202070944 : XCTestCase

@end

@implementation Easy202202070944

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
