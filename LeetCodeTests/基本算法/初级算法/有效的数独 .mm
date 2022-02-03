//
//  Easy202202032128.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/3.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <unordered_set>

using namespace std;

class Solution {
public:
    bool isValidSudoku(vector<vector<char>>& board) {
        
        int size = (int)board.size();
        
        for (int i = 0; i< size; i++) {
            //判断每一行
            unordered_set<char>nums;
            for (int j = 0; j < size; j++) {
                if (board[i][j] == '.') {
                    continue;
                }
                if (nums.find(board[i][j]) != nums.end()) {
                    return false;
                }
                nums.insert(board[i][j]);
            }
        }
        
        for (int j = 0; j < size; j++) {
            //判断每一列
            unordered_set<char>nums;
            for (int i = 0; i < size; i++) {
                if (board[i][j] == '.') {
                    continue;
                }
                if (nums.find(board[i][j]) != nums.end()) {
                    return false;
                }
                nums.insert(board[i][j]);
            }
        }
        
        //判断每个小方格
        
        for (int i = 0; i< 3; i++) {
            
            for (int j = 0; j < 3; j++) {
                
                unordered_set<char>nums;
                for (int k = 0; k< 3; k++) {
                    for (int l = 0; l < 3; l ++) {
                        int row = k + i * 3;
                        int col = l + j * 3;
                        
                        char c = board[row][col];
                        if (c == '.') {
                            continue;
                        }
                        
                        if (nums.find(c) != nums.end()) {
                            return false;
                        }
                        nums.insert(c);
                    }
                }
            }
        }
        return true;
    }
};


@interface Easy202202032128 : XCTestCase

@end

@implementation Easy202202032128

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
