//
//  Easy202202042227.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/4.
//

#import <XCTest/XCTest.h>
#include <string>
#include <unordered_map>
using namespace std;

class Solution {
public:
    int firstUniqChar(string s) {
        
        unordered_map<char, int> indexMap;
        const int repeatFlag = -1;
        for (int i = 0; i< s.length(); i++) {
            char key = s[i];
            if (indexMap.find(key) != indexMap.end()) {
                indexMap[key] = repeatFlag;
            } else {
                indexMap[key] = i;
            }
        }
        
        int index = repeatFlag;
        for (auto & item : indexMap) {
            if (item.second == repeatFlag) {
                continue;
            }
            if (index == repeatFlag) {
                index = item.second;
            } else {
                index = min(index, item.second);
            }
        }
        return index;
    }
};


@interface Easy202202042227 : XCTestCase

@end

@implementation Easy202202042227

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
