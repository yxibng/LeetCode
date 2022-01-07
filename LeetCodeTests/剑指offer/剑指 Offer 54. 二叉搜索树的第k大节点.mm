//
//  Offer202201071612.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/7.
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
    int kthLargest(TreeNode* root, int k) {
        int value = 0;
        dfs(root, k, value);
        return value;
    }

    void dfs(TreeNode *node, int &k, int &value) {
        
        if (!node) {
            return;
        }
        dfs(node->right, k, value);
        k--;
        if (k == 0) {
            value = node->val;
            return;
        }
        dfs(node->left, k, value);
    }
};

@interface Offer202201071612 : XCTestCase

@end

@implementation Offer202201071612

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
