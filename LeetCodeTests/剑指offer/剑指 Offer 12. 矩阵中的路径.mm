//
//  Offer202201061420.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/6.
//

#import <XCTest/XCTest.h>
#include<vector>
#include<string>
using namespace std;


class Solution {
public:
    bool exist(vector<vector<char>>& board, string word) {
        int row = (int)board.size();
        int column = (int)board[0].size();
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < column; j++) {
                if (findMatch(board, word, i, j, 0)) {
                    return true;
                }
            }
        }
        return false;
    }

    bool findMatch(vector<vector<char>> &board, string &word, int x, int y, int index) {
        
        if (x< 0 || y < 0 || x >= board.size() || y >= board[0].size()) {
            return false;
        }

        if (board[x][y] != word[index]) {
            return false;
        }
        
        //已经完全匹配了
        if (index == word.size()-1) {
            return true;
        }
        
        char ch = board[x][y];
        board[x][y] = '*';
        
        bool ret =  findMatch(board, word, x-1, y, index+1) ||
                    findMatch(board, word, x+1, y, index+1) ||
                    findMatch(board, word, x, y-1, index+1) ||
                    findMatch(board, word, x, y+1, index+1);
        
        board[x][y] = ch;
        return ret;
    }
};



@interface Offer202201061420 : XCTestCase

@end

@implementation Offer202201061420

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    Solution su;
    auto board = vector<vector<char>> {
        {'A','B','C','E'},
        {'S','F','C','S'},
        {'A','D','E','E'}
    };
    
    bool ret = su.exist(board, "ABCCED");
    XCTAssert(ret);
    
    board = {
        {'a','b'},
        {'c','d'}
    };
    ret = su.exist(board, "abcd");
    XCTAssert(ret == false);
    
    
    
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
