//
//  202202061501.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/6.
//

#import <XCTest/XCTest.h>
#include <stack>
#include <vector>

using namespace std;
struct TreeNode{
    int val;
    TreeNode *left;
    TreeNode *right;
    
    TreeNode(int val): val(val), left(nullptr), right(nullptr) {
        
    };
};


class Solution{
public:
    vector<int> preorder(TreeNode *root) {
        if (!root) {
            return {};
        }
        stack<TreeNode *> st;
        //根节点入栈
        st.push(root);
        vector<int>ret;
        while (!st.empty()) {
            TreeNode *node = st.top();
            st.pop();
            //访问根节点
            ret.push_back(node->val);
            //右子树入栈
            if (node->right) {
                st.push(node->right);
            }
            //左子树入栈
            if (node->left) {
                st.push(node->left);
            }
        }
        return ret;
    }
    
    vector<int> inorder(TreeNode *root) {
        
        if (!root) {
            return {};
        }
        stack<TreeNode *>st;
        TreeNode *cur = root;
        vector<int>ret;
        while (cur || !st.empty()) {
            if (cur) {
                st.push(cur);
                //一路向左
                cur = cur->left;
            } else {
                cur = st.top();
                st.pop();
                ret.push_back(cur->val);
                //向右
                cur = cur->right;
            }
        }
        return ret;
    }
    
    vector<int> postorder(TreeNode *root) {
        if (!root) {
            return {};
        }
        stack<TreeNode *> st;
        //跟节点入栈
        st.push(root);
        vector<int>ret;
        while (!st.empty()) {
            TreeNode *node = st.top();
            st.pop();
            //遍历
            ret.push_back(node->val);
            //左子树入栈
            if (node->left) {
                st.push(node->left);
            }
            //右子树入栈
            if (node->right) {
                st.push(node->right);
            }
        }
        reverse(ret.begin(), ret.end());
        return ret;
    }
};



@interface _02202061501 : XCTestCase

@end

@implementation _02202061501

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    TreeNode *root = new TreeNode(1);
    
    
    TreeNode *left = new TreeNode(2);
    TreeNode *right = new TreeNode(3);
    
    root->left = left;
    root->right = right;
    
    
    TreeNode *l1 = new TreeNode(4);
    TreeNode *l2 = new TreeNode(5);
    
    left->left = l1;
    left->right = l2;
    
    auto ret1 = Solution().preorder(root);
    auto ret2 = Solution().inorder(root);
    auto ret3 = Solution().postorder(root);
    
    
    vector<int> pre {1, 2, 4, 5, 3};
    vector<int> inorder {4, 2, 5, 1, 3};
    vector<int> post {4, 5, 2, 3, 1};
    
    XCTAssert(ret1 == pre);
    XCTAssert(ret2 == inorder);
    XCTAssert(ret3 == post);
    
    
    



}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
