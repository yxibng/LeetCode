//
//  Offer202201081328.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/8.
//

#import <XCTest/XCTest.h>
#include <string>
#include <vector>
using namespace std;

class Solution {
public:
    string minNumber(vector<int>& nums) {

        vector<string> strs;
        for (auto & num : nums) {
            strs.push_back(to_string(num));
        }
        
        sort(strs.begin(), strs.end(), [](string a, string b){
            return a + b < b + a;
        });
        
        string ans;
        for (auto &str : strs) {
            ans.append(str);
        }
        return ans;
    }
};


@interface Offer202201081328 : XCTestCase

@end

@implementation Offer202201081328

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
