//
//  Offer202201100955.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/10.
//

#import <XCTest/XCTest.h>
#include <algorithm>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
 
class Solution {
public:
    int maxDepth(TreeNode* root) {
        return dfs(root);
    }
    
    int dfs(TreeNode *root) {
        if (!root) {
            return 0;
        }
        if ((!root->left) && (!root->right)) {
            return 1;
        }
        return 1 + std::max(dfs(root->left), dfs(root->right));
    }
};

@interface Offer202201100955 : XCTestCase

@end

@implementation Offer202201100955

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
