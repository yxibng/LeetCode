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

        if (matrix.empty() || matrix[0].empty()) return {};

        int rows = (int)matrix.size();
        int columns = (int)matrix[0].size();

        int left = 0, right = columns - 1;
        int top = 0, bottom = rows -1;

        vector<int>ans;
        while (left <= right && top <= bottom) {
            for (int i = left; i <= right; i++) {
                //从左到右
                ans.push_back(matrix[top][i]);
            }
            for (int j = top+1; j <= bottom; j++) {
                //从上到下
                ans.push_back(matrix[j][right]);
            }

            if (left < right && top < bottom) {
                for (int k = right-1; k > left; k--) {
                    //从右到左
                    ans.push_back(matrix[bottom][k]);
                }
                for (int m = bottom; m > top; m--) {
                    //从下到上
                    ans.push_back(matrix[m][left]);
                }
            }
            left++;
            right--;
            top++;
            bottom--;
        }
        return ans;
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
    
    
    
    {
        vector<vector<int>> matrix {
            vector<int>{3},
            vector<int>{2}
        };
        auto ret = Solution().spiralOrder(matrix);
        vector<int> ans {3, 2};
        XCTAssert(ans == ret);
    }

    
    
    {
        vector<vector<int>> matrix {
            {3, 2},
        };
        auto ret = Solution().spiralOrder(matrix);
        vector<int> ans {3, 2};
        XCTAssert(ans == ret);
    }

    
    {
        
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
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
