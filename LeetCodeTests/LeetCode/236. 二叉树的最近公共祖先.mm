//
//  Test202112231642.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/23.
//

#import <XCTest/XCTest.h>


struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
    TreeNode *ans = nullptr;
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        if (root->val == p->val || root->val == q->val) {
            return root;
        }
        dfs(root, p->val, q->val);
        return ans;
        
    }
    
    bool dfs(TreeNode *root, int p, int q) {
        
        if (!root) {
            return false;
        }
            
        bool left = dfs(root->left, p, q);
        bool right = dfs(root->right, p, q);
            
        if (left && right) {
            // p,q 分别在左右子树上
            // 此时 root 节点即为所求
            ans = root;
            return true;
        }
        if (root->val == p || root->val == q) {
            // p, q 有一个在root 节点
            if (left || right) {
                // 同时p, q 另一个在左右子树
                // 此时 root 节点即为所求
                ans = root;
            }
            return true;
        }
        return left || right;
    }
};

@interface Test202112231642 : XCTestCase

@end

@implementation Test202112231642

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
