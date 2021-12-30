//
//  Offer202112301439.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/30.
//

#import <XCTest/XCTest.h>



struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    bool isSymmetric(TreeNode* root) {
        
        if (!root) {
            return true;
        }
        return equalTree(root->left, mirrorTree(root->right));
    }
    
    TreeNode* mirrorTree(TreeNode* root) {
        if (!root) {
            return nullptr;
        }
        TreeNode *left = mirrorTree(root->left);
        TreeNode *right = mirrorTree(root->right);
        root->left = right;
        root->right = left;
        return root;
    }
    
    
    bool equalTree(TreeNode *left, TreeNode *right) {
        if ((!left) && (!right)) {
            return true;
        }
        if (left && right) {
            return left->val == right->val && equalTree(left->left, right->left) && equalTree(left->right, right->right);
        }
        return false;
    }
};

@interface Offer202112301439 : XCTestCase

@end

@implementation Offer202112301439

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
