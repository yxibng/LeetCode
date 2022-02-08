//
//  Easy202202081025.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/8.
//

#import <XCTest/XCTest.h>
#include <string>
#include <unordered_map>
#include <stack>


/*
 ()[]{}
 */

using namespace std;

class Solution {
public:
    bool isValid(string s) {
        //如果是奇数个，肯定不对
        if (s.size() %2 != 0) return false;

        unordered_map<char, char> dic{
            {')', '('},
            {']', '['},
            {'}', '{'},
        };
        stack<char>st;
        for (char ch : s) {
            if (ch == '(' || ch == '[' || ch == '{') {
                st.push(ch);
            } else {
                if (st.empty()) {
                    return false;
                }
                char top = st.top();
                if (top == dic[ch]) {
                    st.pop();
                } else {
                    return false;
                }
            }
        }
        return st.empty();
    }
};

@interface Easy202202081025 : XCTestCase

@end

@implementation Easy202202081025

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
