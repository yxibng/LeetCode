//
//  Offer202201111326.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/11.
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
        ans = nullptr;
        dfs(root, p, q);
        return ans;
    }
    
    bool dfs(TreeNode *root, TreeNode *p, TreeNode *q) {
        
        if (!root) {
            return false;
        }
        
        bool left = dfs(root->left, p, q);
        bool right = dfs(root->right, p, q);
        
        if ((left && right) ||
            ((root->val == p->val || root->val == q->val) && (left || right))) {
            ans = root;
            
        }
        return  left || right || (root->val == p->val || root->val == q->val);
    }
};


@interface Offer202201111326 : XCTestCase

@end

@implementation Offer202201111326

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
