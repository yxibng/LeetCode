//
//  Offer202112301144.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/30.
//

#import <XCTest/XCTest.h>
/*
 https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)

 B是A的子结构， 即 A中有出现和B相同的结构和节点值。
 */

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    bool isSubStructure(TreeNode* A, TreeNode* B) {
        if (!B || !A) {
            return false;
        }
        bool ret = false;
        dfsA(A, B, ret);
        return ret;
    }
    
    void dfsA(TreeNode *root, TreeNode *B, bool &ret) {
        if (compare(root, B)) {
            ret = true;
            return;
        }
        if (!root) {
            return;
        }
        dfsA(root->left, B, ret);
        dfsA(root->right, B, ret);
    }
    
    bool compare(TreeNode *root, TreeNode *B) {
        if (root && (!B)) {
            //B 空了， A 不空
            return true;
        }
        if (B && (!root)) {
            //A 空了， B 不空
            return false;
        }
        if ((!root && !B)) {
            //A 空， B 空
            return true;
        }
        //A, B 都是非空
        bool ret = root->val == B->val;
        if (!ret) {
            return false;
        }
        return  ret && compare(root->left, B->left) && compare(root->right, B->right);
    }
};


@interface Offer202112301144 : XCTestCase

@end

@implementation Offer202112301144

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
