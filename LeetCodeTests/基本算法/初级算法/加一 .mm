//
//  Easy202202032039.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/3.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <list>
using namespace std;
class Solution {
public:
    vector<int> plusOne(vector<int>& digits) {
        list<int> nums;
        int add = 0;
        for (int i = digits.size() - 1; i >= 0; i--) {
            
            int num = digits[i] + add;
            if (i == digits.size() - 1) {
                num += 1;
            }
            add = num / 10;
            num = num % 10;
            nums.push_front(num);
        }
        if (add) {
            nums.push_front(1);
        }
        return vector<int>(nums.begin(), nums.end());
    }
};

@interface Easy202202032039 : XCTestCase

@end

@implementation Easy202202032039

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
        
    {
        vector<int> digits {1,2,3};
        auto ret = Solution().plusOne(digits);
        vector<int> ans {1, 2, 4};
        XCTAssert(ret == ans);
    }
    
    {
        vector<int> digits {9, 9, 9};
        auto ret = Solution().plusOne(digits);
        vector<int> ans {1, 0, 0, 0};
        XCTAssert(ret == ans);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
