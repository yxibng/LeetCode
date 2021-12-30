//
//  Offer202112291108.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2021/12/29.
//

#import <XCTest/XCTest.h>
#include<vector>
#include <deque>
#include <queue>
using namespace std;

/*
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。
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
        bool reverse = false;
        while (!nodes.empty()) {
            vector<int> elements;
            queue<TreeNode *>temp;
            while (!nodes.empty()) {
                TreeNode *head = nodes.front();
                if (reverse) {
                    elements.insert(elements.begin(), head->val);
                } else {
                    elements.push_back(head->val);
                }
                nodes.pop();
                if (head->left) {
                    temp.push(head->left);
                }
                if (head->right) {
                    temp.push(head->right);
                }
            }
            nodes = std::move(temp);
            answer.push_back(elements);
            reverse = !reverse;
        }
        return answer;
    }
};


@interface Offer202112291108 : XCTestCase

@end

@implementation Offer202112291108

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
