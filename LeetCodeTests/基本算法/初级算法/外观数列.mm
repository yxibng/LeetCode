//
//  Easy202202051414.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/5.
//

#import <XCTest/XCTest.h>
#include <string>
using namespace std;

class Solution {
public:
    string countAndSay(int n) {
        if (n == 1) {
            return "1";
        }
        string str = countAndSay(n-1);
        string ret;
        char start = str[0];
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            
            if (i == 0) {
                start = str[i];
                count = 1;
            } else {
                if (start == str[i]) {
                    count++;
                } else {
                    ret.append(to_string(count));
                    ret.push_back(start);
                    start = str[i];
                    count = 1;
                }
            }
            if (i == str.length() - 1) {
                ret.append(to_string(count));
                ret.push_back(start);
            }
        }
        return ret;
    }
};


@interface Easy202202051414 : XCTestCase

@end

@implementation Easy202202051414

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    {
        string ret = Solution().countAndSay(1);
        XCTAssert(ret == "1");
    }
    {
        string ret = Solution().countAndSay(2);
        XCTAssert(ret == "11");
    }
    {
        string ret = Solution().countAndSay(3);
        XCTAssert(ret == "21");
    }
    {
        string ret = Solution().countAndSay(4);
        XCTAssert(ret == "1211");
    }


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
