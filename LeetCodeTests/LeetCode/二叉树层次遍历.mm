//
//  Test202112191901.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/19.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include <vector>
#include <queue>

using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};
 
class Solution {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {

        vector<vector<int>> answer;
        if (!root) {
            return answer;
        }
        
        int queueSize = 1;
        queue<TreeNode *> levelQueue;
        levelQueue.push(root);
        while (levelQueue.size()) {
            vector<int>levelList;
            for (int i = 0; i < queueSize; i++) {
                TreeNode *top = levelQueue.front();
                levelQueue.pop();
                levelList.push_back(top->val);
                
                if (top->left) {
                    levelQueue.push(top->left);
                }
                if (top->right) {
                    levelQueue.push(top->right);
                }
            }
            queueSize = (int)levelQueue.size();
            answer.push_back(levelList);
        }
        return answer;
    }
};


@interface Test202112191901 : XCTestCase

@end

@implementation Test202112191901

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
