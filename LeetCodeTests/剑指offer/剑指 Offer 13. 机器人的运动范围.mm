//
//  Offer202201061721.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/6.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <iostream>
using namespace std;
/*
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

  

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 2：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */


class Solution {
public:
    int sumOfDigit(int num) {
        return num % 10 + num / 10;
    }
    int dfs(int x, int y, int m, int n, int k, vector<vector<bool>> &visited) {
        if (x >= m || y >= n || x < 0 || y < 0 || sumOfDigit(x) + sumOfDigit(y) > k || visited[x][y]) {
            return 0;
        }
        visited[x][y] = true;
        return 1 + dfs(x+1, y, m, n, k, visited) + dfs(x, y+1, m, n, k, visited);
    }

    int movingCount(int m, int n, int k) {
        auto visited = vector<vector<bool>>(m, vector<bool>(n, false));
        return dfs(0, 0, m, n, k, visited);
    }
};
@interface Offer202201061721 : XCTestCase

@end

@implementation Offer202201061721

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    int ret = su.movingCount(3, 2, 17);
    XCTAssert(ret == 6);
    
    ret = su.movingCount(7, 2, 3);
    XCTAssert(ret == 7);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
