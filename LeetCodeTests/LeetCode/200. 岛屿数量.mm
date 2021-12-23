//
//  Test202112231726.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/23.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    
    void dfs(vector<vector<char>> &grid, int x, int y) {
        
        int row = (int)grid.size();
        int column = (int)grid[0].size();
        
        if (x < 0 || x >= row) {
            return;
        }
        
        if (y < 0 || y >= column) {
            return;
        }
        
        if (grid[x][y] == '1') {
            grid[x][y] = '0';
        } else {
            return;
        }
        dfs(grid, x, y+1);
        dfs(grid, x, y-1);
        dfs(grid, x+1, y);
        dfs(grid, x-1, y);
    }
    
    int numIslands(vector<vector<char>>& grid) {

        if (grid.empty()) {
            return 0;
        }
        int row = (int)grid.size();
        int column = (int)grid[0].size();
        int count = 0;
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < column ; j++) {
                if (grid[i][j] == '1') {
                    count++;
                    dfs(grid, i, j);
                }
            }
        }
        return count;
    }
};


@interface Test202112231726 : XCTestCase

@end

@implementation Test202112231726

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
