//
//  Easy202202050942.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/5.
//

#import <XCTest/XCTest.h>
#include <string>
using namespace std;

class Solution {
    
    bool isNum(char ch) {
        return ch >= '0' && ch <= '9' ;
    }
    
    bool isNumPrefix(char ch) {
        return ch == '+' || ch == '-';
    }
public:
    int myAtoi(string s) {
        
        bool positive = true;
        
        //1. 去掉前面的空格
        int start = 0;
        for (int i = 0; i< s.length(); i++) {
            if (s[i] == ' ') {
                continue;
            } else {
                start = i;
                break;
            }
        }
        
        
        if (start == s.length()) {
            return 0;
        }
        
        //不是数字也不是加减号
        if ( !isNum(s[start]) && !isNumPrefix(s[start])) {
            return 0;
        }
               
        //判断正负号
        if (isNumPrefix(s[start])) {
            if (s[start] == '+') {
                positive = true;
            } else {
                positive = false;
            }
            start++;
        }
        
        //找数字
        long ret = 0;
        for (int i = start; i< s.length(); i++) {
            if (!isNum(s[i])) {
                break;
            }
            ret = ret * 10 + s[i] - '0';
            
            if (positive && ret > INT_MAX) {
                return INT_MAX;
            }
            
            if (!positive && (-ret) < INT_MIN) {
                return INT_MIN;
            }
        }
        //计算结果
        if (positive) {
            return (int)ret;
        } else {
            return (int)-ret;
        }
    }
};


@interface Easy202202050942 : XCTestCase

@end

@implementation Easy202202050942

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    {
        int ret = Solution().myAtoi("42");
        XCTAssert(ret == 42);
    }

    {
        int ret = Solution().myAtoi("   -42");
        XCTAssert(ret == -42);
    }

    {
        int ret = Solution().myAtoi("4193 with words");
        XCTAssert(ret == 4193);
    }
    
    {
        int ret = Solution().myAtoi("words and 987");
        XCTAssert(ret == 0);
    }
    
    {
        int ret = Solution().myAtoi("-91283472332");
        XCTAssert(ret == -2147483648);
    }
    
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
