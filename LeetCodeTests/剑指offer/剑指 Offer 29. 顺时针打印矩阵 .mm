//
//  Offer202201171531.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/17.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {

        if (matrix.empty() || matrix[0].empty()) {
            return {};
        }
        
        vector<int>ret{};
        
        int lt = 0; //左上边界
        int rt = (int)matrix[0].size() - 1; //右上边界
        int rb = (int)matrix.size() - 1;//右下边界
        int lb = 0;//左下边界
        while (1) {
            
            if (lt > rt) {
                break;
            }
            
            //从左到右
            for (int col = lt; col <= rt; col++) {
                ret.push_back(matrix[lt][col]);
            }
            
            if (lt + 1 > rb) {
                break;
            }
            
            //从上到下
            for (int row = lt+1 ; row <= rb; row++ ) {
                ret.push_back(matrix[row][rt]);
            }
            
            if (rt-1 < lb) {
                break;
            }
            //从右到左
            for (int col = rt-1 ; col >= lb; col --) {
                ret.push_back(matrix[rb][col]);
            }
            
            if (rb-1 < lt+1) {
                break;
            }
            //从下到上
            for (int row = rb-1; row >= lt+1; row--) {
                ret.push_back(matrix[row][lb]);
            }
            //收缩
            lt++;
            lb++;
            rb--;
            rt--;
        }
        
        return ret;
    }
};


@interface Offer202201171531 : XCTestCase

@end

@implementation Offer202201171531

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
//    vector<vector<int>> matrix {
//        {1, 2, 3},
//        {4, 5, 6},
//        {7, 8, 9}
//    };
//
    
//    vector<vector<int>> matrix {
//        {1, 2, 3, 4},
//        {5, 6, 7, 8},
//        {9, 10, 11, 12},
//        {13, 14, 15, 16}
//    };
    
        vector<vector<int>> matrix {
            {1, 11},
            {2, 12},
            {3, 13},
            {4, 14},
            {5, 15},
            {6, 16},
            {7, 17},
            {8, 18},
            {9, 19},
            {10, 20}
        };
    
    auto ret = Solution().spiralOrder(matrix);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
