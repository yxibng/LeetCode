//
//  Offer202201011448.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/1.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;
/*
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

  

 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
  

 提示：

 0 < grid.length <= 200
 0 < grid[0].length <= 200

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/*
 dp[m][n] = max(dp[m-1][n], dp[m][n-1]) + num[m][n];
 
 dp[0][0] = nums[0][0];
 
 
 
 
 */



class Solution {
public:
    int maxValue(vector<vector<int>>& grid) {
        
        int rows = (int)grid.size();
        int columns = (int)grid[0].size();
        
        vector<vector<int>>dp(rows, vector<int>(columns));
        dp[0][0] = grid[0][0];
        
        for (int i = 1; i< rows; i++) {
            dp[i][0] = dp[i-1][0] + grid[i][0];
        }
        
        for (int j = 1; j < columns; j++) {
            dp[0][j] = dp[0][j-1] + grid[0][j];
        }
        
        for (int i = 1; i< rows; i++) {
            for (int j = 1; j< columns; j++) {
                dp[i][j] = max(dp[i -1][j], dp[i][j-1]) + grid[i][j];
            }
        }

        return dp[rows-1][columns-1];
    }
};




@interface Offer202201011448 : XCTestCase

@end

@implementation Offer202201011448

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<vector<int>> nums {
        vector<int> {
            1, 3, 1
        },
        vector<int> {
            1, 5, 1
        },
        vector<int> {
            4, 2, 1
        }
    };
    
    Solution su;
    int ret = su.maxValue(nums);
    XCTAssert(ret == 12);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
