//
//  Easy202202071312.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/7.
//

#import <XCTest/XCTest.h>
#include <string>
#include <unordered_map>
using namespace std;

class Solution {
public:
    int romanToInt(string s) {
        unordered_map<string, int> numMap {
            {"I",1},
            {"IV", 4},
            {"V",5},
            {"IX", 9},
            {"X",10},
            {"XL",40},
            {"L",50},
            {"XC",90},
            {"C",100},
            {"CD",400},
            {"D",500},
            {"CM",900},
            {"M",1000}
        };
        int i = 0;
        int ret = 0;
        while (i < s.length()) {
            if (i + 1 < s.length() && numMap.find(s.substr(i, 2)) != numMap.end()) {
                ret += numMap[s.substr(i, 2)];
                i+= 2;
            } else {
                ret += numMap[string(1,s[i])];
                i++;
            }
        }
        return ret;
    }
};



@interface Easy202202071312 : XCTestCase

@end

@implementation Easy202202071312

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    int ret = Solution().romanToInt("MCMXCIV");
    XCTAssert(ret == 1994);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
