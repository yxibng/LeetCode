//
//  LeetCode202202091335.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/9.
//

#import <XCTest/XCTest.h>
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
    vector<int> rightSideView(TreeNode* root) {
        if (!root) return {};
        queue<TreeNode *> qu;
        vector<int>ret;
        qu.push(root);
        while (!qu.empty()) {
            queue<TreeNode *>child;
            TreeNode *target = nullptr;
            while (!qu.empty()) {
                TreeNode *front = qu.front();
                qu.pop();
                target = front;
                if (front->left) {
                    child.push(front->left);
                }
                if (front->right) {
                    child.push(front->right);
                }
            }
            if (target) {
                ret.push_back(target->val);
            }
            qu.swap(child);
        }

        return ret;
    }
};



@interface LeetCode202202091335 : XCTestCase

@end

@implementation LeetCode202202091335

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
