//
//  Offer202201221647.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/22.
//

#import <XCTest/XCTest.h>
#include <string>
#include <list>
using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Codec {
    string dfs(TreeNode *root) {
        if (!root) {
            return "null";
        }
        string root_str = to_string(root->val);
        return root_str + "," + dfs(root->left) + "," + dfs(root->right);
    }
    
    TreeNode *rdeserialize(list<string> &nodes) {
        
        if (nodes.empty()) {
            return nullptr;
        }
        
        if (nodes.front() == "null") {
            nodes.erase(nodes.begin());
            return nullptr;
        }
        
        int val = std::atoi(nodes.front().c_str());
        TreeNode *root = new TreeNode(val);
        nodes.erase(nodes.begin());
        root->left = rdeserialize(nodes);
        root->right = rdeserialize(nodes);
        return root;
        
    }
    
public:

    // Encodes a tree to a single string.
    string serialize(TreeNode* root) {
        return dfs(root);
    }
    
    // Decodes your encoded data to tree.
    TreeNode* deserialize(string data) {
        
        if (data.empty()) {
            return nullptr;
        }
        char delimiter = ',';
        list<std::string>nodes;
        int start = 0;
        for (int i = 0; i< data.length(); i++) {
            if (data[i] == delimiter) {
                nodes.push_back(data.substr(start,i-start));
                start = i+1;
            }
        }
        return rdeserialize(nodes);
    }
};




@interface Offer202201221647 : XCTestCase

@end

@implementation Offer202201221647

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    {
        TreeNode *root = new TreeNode(1);
        
        TreeNode *left = new TreeNode(2);
        TreeNode *right = new TreeNode(3);
        
        TreeNode *r1 = new TreeNode(4);
        TreeNode *r2 = new TreeNode(5);
        
        root->left = left;
        root->right = right;
        
        right->left = r1;
        right->right = r2;
        
        
        Codec c = Codec();
        
        string ret = c.serialize(root);
        
        NSLog(@"%s",ret.c_str());
        
        TreeNode *tree = c.deserialize(ret);
        
        ret = c.serialize(tree);
        NSLog(@"%s",ret.c_str());
        
        
        
    }
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
