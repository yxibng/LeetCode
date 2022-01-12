//
//  LinkList202201121651.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/12.
//

#import <XCTest/XCTest.h>

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution {
    
    ListNode *reverseList(ListNode *head) {
        if (!head) {
            return nullptr;
        }
        ListNode dummy= ListNode();
        ListNode *node = &dummy;
        ListNode *p = head;
        while (p) {
            ListNode *next = p->next;
            p->next = node->next;
            node->next = p;
            p = next;
        }
        return node->next;
    }
public:
    bool isPalindrome(ListNode* head) {
        
        ListNode *fast = head->next;
        ListNode *slow = head;
        //遍历找到中间节点
        while (fast && fast->next) {
            slow = slow->next;
            fast = fast->next->next;
        }
        
        slow = reverseList(slow);
        ListNode *p = slow;
        ListNode *q = head;
        //开始对比
        while (p && q) {
            if (p->val != q->val) {
                return false;
            }
            p = p->next;
            q = q->next;
        }
        return true;
    }
};



@interface LinkList202201121651 : XCTestCase

@end

@implementation LinkList202201121651

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    
    ListNode *h = new ListNode(1);
    ListNode *h1 = new ListNode(2);
    ListNode *h2 = new ListNode(2);
    ListNode *h3 = new ListNode(1);
    ListNode *h4 = new ListNode(3);
    
    h->next = h1;
    h1->next = h2;
    h2->next = h3;
//    h3->next = h4;
    
    
    Solution su;
    bool ret = su.isPalindrome(h);
    XCTAssert(ret);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
