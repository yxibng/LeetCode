//
//  Offer202112260932.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/26.
//

#import <XCTest/XCTest.h>
#include<string>

/*
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
 */


using namespace std;
class Solution {
public:
    string replaceSpace(string s) {
        int spaceCount = 0;
        for (auto &ch : s) {
            if (ch == ' ') {
                spaceCount++;
            }
        }
        int size = spaceCount * 2 + (int)s.size();
        string answer = string(size, ' ');
        int index = 0;
        for (auto &ch : s) {
            if (ch == ' ') {
                answer[index++] = '%';
                answer[index++] = '2';
                answer[index++] = '0';
            } else {
                answer[index++] = ch;
            }
        }
        return answer;
    }
};

@interface Offer202112260932 : XCTestCase

@end

@implementation Offer202112260932

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
