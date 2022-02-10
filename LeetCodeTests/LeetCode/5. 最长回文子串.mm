//
//  LeetCode202202101132.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/10.
//

#import <XCTest/XCTest.h>
#include <string>
using namespace std;
class Solution {
    std::pair<int, int> expandCenter(string &s, int left, int right) {
        while (left >= 0 && right < s.length() && s[left] == s[right]) {
            left--;
            right++;
        }
        return {left+1, right-1};
    }
public:
    string longestPalindrome(string s) {
        if (s.empty()) {
            return "";
        }
        int start = 0;
        int end = 0;
        for (int i = 0; i< s.length(); i++) {
            //单个字符为中心
            auto [left1, right1] = expandCenter(s, i, i);
            //两个字符为中心
            auto [left2, right2] = expandCenter(s, i, i+1);
            
            if (right1 - left1 > end - start) {
                end = right1;
                start = left1;
            }
            
            if (right2 - left2 > end - start) {
                end = right2;
                start = left2;
            }
        }
        return s.substr(start, end-start+1);
    }
};


@interface LeetCode202202101132 : XCTestCase

@end

@implementation LeetCode202202101132

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
