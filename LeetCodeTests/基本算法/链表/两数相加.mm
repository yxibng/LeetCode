//
//  LinkList202201131533.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/13.
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
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        
        ListNode dummy = ListNode();
        ListNode *head = &dummy;
        
        int  carry = 0;
        while (l1 && l2) {
            
            int val = l1->val + l2->val + carry;
            if (val >= 10) {
                val = val % 10;
                carry = 1;
            }  else {
                carry = 0;
            }
            
            l1->val = val;
            head->next = l1;
            head = head->next;
            
            l1 = l1->next;
            l2 = l2->next;
        }
        
        ListNode *p = l1 != nullptr ? l1 : l2;
        
        while (p) {
            int val = p->val + carry;
            if (val >= 10) {
                val = val % 10;
                carry = 1;
            }  else {
                carry = 0;
            }
            p->val = val;
            head->next = p;
            head = head->next;
            p = p->next;
        }
        if (carry == 1) {
            ListNode *node = new ListNode(1);
            head->next = node;
        }
        
        return dummy.next;
    }
};

@interface LinkList202201131533 : XCTestCase

@end

@implementation LinkList202201131533

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
