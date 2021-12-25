//
//  Offer202112250942.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/25.
//

#import <XCTest/XCTest.h>
#import <unordered_map>

using namespace std;

class Node {
public:
    int val;
    Node* next;
    Node* random;
    
    Node(int _val) {
        val = _val;
        next = NULL;
        random = NULL;
    }
};

class Solution {

    unordered_map<Node *, Node *> cachedNode;
    
public:
    //采用递归回溯的方法
    Node* copyRandomList(Node* head) {
        if (head == NULL) {
            return NULL;
        }
        if (!cachedNode.count(head)) {
            Node *newHead = new Node(head->val);
            cachedNode[head] = newHead;
            newHead->next = copyRandomList(head->next);
            newHead->random = copyRandomList(head->random);
        }
        
        return cachedNode[head];
    }
    
    //迭代 + 节点拆分
    Node* copyRandomList_1(Node* head) {
        if (head == NULL) {
            return NULL;
        }
        //复制每一个节点，插入到新节点后面
        for (Node *p = head; p != NULL; p = p->next->next) {
            //复制节点，插入原来的节点后面
            Node *newNode = new Node(p->val);
            newNode->next = p->next;
            p->next = newNode;
        }
        
        for (Node *p = head; p != NULL; p=p->next->next) {
            //将 random 赋值
            Node *copy = p->next;
            if (p->random) {
                //注意为空的情况
                copy->random = p->random->next;
            }
        }
        
        //复制链表，不可以对原链表进行修改
        
        Node answer = Node(-1);
        Node *newHead = &answer;
        for (Node *p = head; p!= NULL; p = p->next) {
            Node *copy = p->next;
            newHead->next = copy;
            newHead = copy;
            p->next = copy->next;
        }
        return answer.next;
    }
};


@interface Offer202112250942 : XCTestCase

@end

@implementation Offer202112250942

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
