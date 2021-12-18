//
//  test20211217.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/17.
//

#import <XCTest/XCTest.h>
#include<string>
#include<iostream>

using namespace std;
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int indexMap[256];
        memset(indexMap, -1, sizeof(indexMap));
        int maxLength = 0;
        int startIndex = 0;
        for (int i = 0; i< s.length(); i++) {
            int key = s[i];
            int lastIndex = indexMap[key];
            int length = 0;
            if (lastIndex == -1) {
                length = i - startIndex + 1;
            } else {
                if (lastIndex >= startIndex) {
                    length = i - lastIndex;
                    startIndex = lastIndex + 1;
                } else {
                    length = i - startIndex + 1;
                }
            }
            maxLength = std::max(maxLength, length);
            indexMap[key] = i;
        }
        return maxLength;
    }
};


@interface test20211217 : XCTestCase

@end

@implementation test20211217

- (void)setUp {
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    Solution su{};
    int length  = su.lengthOfLongestSubstring("");
    XCTAssert(length == 0);
    length = su.lengthOfLongestSubstring("bbbb");
    XCTAssert(length == 1);
    length = su.lengthOfLongestSubstring("abcabcbb");
    XCTAssert(length == 3);
    length = su.lengthOfLongestSubstring(" ");
    XCTAssert(length == 1);
    
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
