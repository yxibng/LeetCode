//
//  Easy202202060939.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/6.
//

#import <XCTest/XCTest.h>


struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

class Solution {
    
    bool isValidBST(TreeNode* root, long min, long max) {
        if (!root) return true;
        if (root->val >= max || root->val<= min) {
            return false;
        }
        if (root->left && root->left->val >= root->val) return false;
        if (root->right && root->right->val <= root->val) return false;
        return isValidBST(root->left, min, root->val) && isValidBST(root->right, root->val, max);
    }
public:
    bool isValidBST(TreeNode* root) {
        return isValidBST(root, LONG_MIN, LONG_MAX);
    }
};


namespace tr {
    
    class Solution {
        
        TreeNode *pre = nullptr;
    public:
        bool isValidBST(TreeNode* root) {
            
            if (!root) return true;
            
            if(!isValidBST(root->left)) return false;
                        
            if (pre && pre->val >= root->val) return false;
            
            pre = root;
            
            if(!isValidBST(root->right)) return false;
            
            return true;
        }
    };
};

#include <vector>
#include <queue>
using namespace std;
class Solution1 {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        
        queue<TreeNode *> nodeQueue;
        vector<vector<int>> ret;
        nodeQueue.push(root);
        
        while (!nodeQueue.empty()) {
            queue<TreeNode *> qu;
            vector<int>nums;
            while (!nodeQueue.empty()) {
                TreeNode *head = nodeQueue.front();
                nodeQueue.pop();
                if (head) {
                    nums.push_back(head->val);
                } else {
                    continue;
                }
                if (head->left) {
                    qu.push(head->left);
                }
                if (head->right) {
                    qu.push(head->right);
                }
            }
            ret.push_back(nums);
            nodeQueue.swap(qu);
        }
        return ret;
    }
};



@interface Easy202202060939 : XCTestCase

@end

@implementation Easy202202060939

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
