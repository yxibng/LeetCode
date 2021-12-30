//
//  Offer202112291040.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2021/12/29.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <queue>
using namespace std;
/*
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 */

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
 
class Solution {
public:
    vector<int> levelOrder(TreeNode* root) {
        vector<int> answer;
        BFS(root, answer);
        return answer;
    }
    
    void BFS(TreeNode *root, vector<int>&answer) {
        if (!root) {
            return;
        }
        queue<TreeNode *> nodes;
        nodes.push(root);
        while (!nodes.empty()) {
            TreeNode *node = nodes.front();
            answer.push_back(node->val);
            nodes.pop();
            
            if (node->left) {
                nodes.push(node->left);
            }
            if (node->right) {
                nodes.push(node->right);
            }
        }
    }
};





@interface Offer202112291040 : XCTestCase

@end

@implementation Offer202112291040

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
