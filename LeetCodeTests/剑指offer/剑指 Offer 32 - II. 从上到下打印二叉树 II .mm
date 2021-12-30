//
//  Offer202112291059.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2021/12/29.
//

#import <XCTest/XCTest.h>
#include<vector>
#include <queue>
using namespace std;
/*
 剑指 Offer 32 - II. 从上到下打印二叉树 II
*/


struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
 
class Solution {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> answer;
        
        if (!root) {
            return answer;
        }
        queue<TreeNode *> nodes;
        nodes.push(root);
        while (!nodes.empty()) {
            vector<int> elements;
            queue<TreeNode *>temp;
            while (!nodes.empty()) {
                TreeNode *head = nodes.front();
                elements.push_back(head->val);
                nodes.pop();
                if (head->left) {
                    temp.push(head->left);
                }
                if (head->right) {
                    temp.push(head->right);
                }
            }
            answer.push_back(elements);
            nodes = std::move(temp);
        }
        return answer;
    }
};


@interface Offer202112291059 : XCTestCase

@end

@implementation Offer202112291059

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
