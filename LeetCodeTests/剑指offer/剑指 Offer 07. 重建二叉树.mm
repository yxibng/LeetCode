//
//  Offer202201121813.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/12.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        TreeNode *root = buildTree(preorder, inorder, 0, (int)preorder.size()-1, 0, (int)inorder.size()-1);
        return root;
    }
    
    
    TreeNode *buildTree(vector<int> & preorder, vector<int> &inorder, int pre_start, int pre_end, int in_start, int in_end) {
        if (pre_start > pre_end) {
            return nullptr;
        }
        
        TreeNode *root = new TreeNode(preorder[pre_start]);
        //左子树节点数
        int leftCount = 0;
        for (int i = in_start; i <= in_end; i++) {
            if (inorder[i] != root->val) {
                leftCount ++;
                continue;
            } else {
                break;
            }
        }
        TreeNode *left = buildTree(preorder, inorder, pre_start + 1, pre_start + leftCount, in_start, in_start + leftCount-1);
        TreeNode *right = buildTree(preorder, inorder, pre_start + leftCount+1, pre_end, in_start+leftCount+1, in_end);
        root->left = left;
        root->right = right;
        return root;
    }
};


@interface Offer202201121813 : XCTestCase

@end

@implementation Offer202201121813

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    vector<int> preOrder {3,9,20,15,7};
    vector<int> inOrder {9,3,15,20,7};
    
    TreeNode *root = Solution().buildTree(preOrder, inOrder);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
