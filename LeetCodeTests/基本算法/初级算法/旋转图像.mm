//
//  Easy202202032245.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/3.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

/*
 首先整体沿着对角线反转，然后再左右交换
 */


class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int len = matrix.size();
        if(len == 1) return;
        //首先沿着对角线反转
        for(int i = 0;i < len;i++)
            for(int j = i + 1;j < len;j++)
                swap(matrix[i][j], matrix[j][i]);
        //然后左右进行交换
        for(int j = 0;j <= len / 2 - 1;j++)
            for(int i = 0;i < len;i++)
                swap(matrix[i][j], matrix[i][len - j - 1]);
    }
};



@interface Easy202202032245 : XCTestCase

@end

@implementation Easy202202032245

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
