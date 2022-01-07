//
//  Offer202201071139.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/7.
//

#import <XCTest/XCTest.h>
class Node {
public:
    int val;
    Node* left;
    Node* right;

    Node() {}

    Node(int _val) {
        val = _val;
        left = NULL;
        right = NULL;
    }

    Node(int _val, Node* _left, Node* _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};

class Solution {
    Node *head = nullptr;
    Node *tail = nullptr;
public:
    Node* treeToDoublyList(Node* root) {
        if (!root) {
            return root;
        }
        head = nullptr;
        tail = nullptr;
        inOrderDFS(root);
        head->left = tail;
        tail->right = head;
        return head;
    }
    
    void inOrderDFS(Node *root) {
        if (!root) {
            return;
        }
        inOrderDFS(root->left);
        if (!head) {
            head = root;
            tail = root;
        } else {
            tail->right = root;
            root->left = tail;
            tail = root;
        }
        inOrderDFS(root->right);
    }
};



@interface Offer202201071139 : XCTestCase

@end

@implementation Offer202201071139

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
