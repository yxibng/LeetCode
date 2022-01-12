//
//  LinkList202201112053.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/11.
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
    ListNode* oddEvenList(ListNode* head) {
        
        if (!head || !head->next) {
            return head;
        }
        
        ListNode *p = head;
        ListNode dump = ListNode();
        ListNode *q = &dump;
        
        while (p->next) {
            
            q->next = p->next;
            q = q->next;
            if (!p->next->next) {
                //p为空
                break;
            }
            p->next = p->next->next;
            p = p->next;
            q->next = nullptr;
        }
        p->next = dump.next;
        return head;
    }
};



@interface LinkList202201112053 : XCTestCase

@end

@implementation LinkList202201112053

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    ListNode *head = new ListNode(1);
    
    ListNode *h1 = new ListNode (2);
    ListNode *h2 = new ListNode (3);
    
    ListNode *h3 = new ListNode (4);
    ListNode *h4 = new ListNode (5);
    
    
    head->next = h1;
    h1->next = h2;
    h2->next = h3;
    h3->next = h4;
    
    Solution su;
    __unused ListNode *ret = su.oddEvenList(head);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
