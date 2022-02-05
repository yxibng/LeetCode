//
//  Easy202202050921.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/5.
//

#import <XCTest/XCTest.h>
#include <string>
using namespace std;
class Solution {
    
    const int ignoreFlag = -1;
    int ch2Int(char ch) {
        if (ch >= 'a' && ch <= 'z') {
            return ch - 'a';
        }
        
        if (ch >= 'A' && ch <= 'Z') {
            return ch - 'A';
        }
        
        if (ch >= '0' && ch <= '9') {
            return ch;
        }
        return ignoreFlag;;
    }
public:
    bool isPalindrome(string s) {
        
        if (s.empty()) {
            return true;
        }
        
        int i = 0;
        int j = (int)s.length() - 1;
        while (i < j) {
            
            int left = ch2Int(s[i]);
            int right = ch2Int(s[j]);
            
            if (left == ignoreFlag) {
                i++;
                continue;
            }
            
            if (right == ignoreFlag) {
                j--;
                continue;
            }
            
            if (left == right) {
                i++;
                j--;
            } else {
                return false;
            }
        }
        return true;
    }
};


@interface Easy202202050921 : XCTestCase

@end

@implementation Easy202202050921

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
//    {
//        int ret = Solution().isPalindrome("ab_a");
//        XCTAssert(ret);
//
//    }
    
    {
        int ret = Solution().isPalindrome(" apG0i4maAs::sA0m4i0Gp0");
        XCTAssert(ret == false);
    }
    
    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
