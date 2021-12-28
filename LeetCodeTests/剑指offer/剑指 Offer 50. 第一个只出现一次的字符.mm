//
//  Offer202112281752.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/28.
//

#import <XCTest/XCTest.h>
#include <string>
#include <unordered_map>
using namespace std;
class Solution {
    
public:
    char firstUniqChar(string s) {
        unordered_map<char, int> map;
        
        
        for (int i =0; i< s.size(); i++) {
            char key = s[i];
            if (map.find(key) != map.end()) {
                map[key] = -1;
            } else {
                map[key] = i;
            }
        }
        
        int first = s.size();
        for (auto &element : map) {
            int position = element.second;
            
            if (position != -1 && position < first) {
                first = position;
            }
            
        }
        return  first == s.size() ? ' ' : s[first];
    }
};

@interface Offer202112281752 : XCTestCase

@end

@implementation Offer202112281752

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    Solution su;
    char c = su.firstUniqChar("leetcode");
    XCTAssert(c == 'l');
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
