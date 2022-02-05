//
//  Easy202202051438.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/5.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <string>

using namespace std;
class Solution {
    string commonPrefix(const string &str1, const string &str2) {
        if (str1.empty() || str2.empty()) {
            return "";
        }
        int len = min(str1.length(), str2.length());
        string ret;
        for (int i = 0; i< len; i++) {
            if (str1[i] != str2[i]) {
                break;
            } else {
                ret.push_back(str1[i]);
            }
        }
        return ret;
    }
public:
    string longestCommonPrefix(vector<string>& strs) {
        
        if (strs.empty()) {
            return "";
        }
        string ret = strs[0];
        for (int i = 1; i< strs.size(); i++) {
            ret = commonPrefix(ret, strs[i]);
            if (ret.empty()) {
                return ret;
            }
        }
        return ret;
    }
};


@interface Easy202202051438 : XCTestCase

@end

@implementation Easy202202051438

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    {
        vector<string> strs {"flower","flow","flight"};
        string ret = Solution().longestCommonPrefix(strs);
        XCTAssert(ret == "fl");
    }
    {
        vector<string> strs {"dog","racecar","car"};
        string ret = Solution().longestCommonPrefix(strs);
        XCTAssert(ret == "");
    }


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
