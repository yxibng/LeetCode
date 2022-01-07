//
//  Offer202201071107.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/7.
//

#import <XCTest/XCTest.h>
#import <vector>
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
    vector<vector<int>> pathSum(TreeNode* root, int target) {
        vector<vector<int>> ans;
        if (!root) {
            return ans;
        }
        vector<int> v {};
        dfs(root, target, ans, v, 0);
        return ans;
    }
    
    void dfs(TreeNode *root, int target, vector<vector<int>> &ret, vector<int>& nodes, int sum) {
        
        if (!root) {
            return;
        }
        bool isLeaf = (!root->left) && (!root->right);
        if (isLeaf) {
            if (sum + root->val == target) {
                nodes.push_back(root->val);
                ret.push_back(nodes);
                nodes.pop_back();
            }
            return;
        }
                
        sum += root->val;
        nodes.push_back(root->val);
        dfs(root->left, target, ret, nodes, sum);
        dfs(root->right, target, ret, nodes, sum);
        nodes.pop_back();
    }
};



@interface Offer202201071107 : XCTestCase

@end

@implementation Offer202201071107

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
