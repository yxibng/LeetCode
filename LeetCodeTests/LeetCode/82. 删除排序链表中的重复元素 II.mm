//
//  LeetCode202202101406.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/10.
//

#import <XCTest/XCTest.h>
#include <list>
using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution {
public:
    ListNode* deleteDuplicates(ListNode* head) {
        if (!head) return head;
        ListNode dummy = ListNode(0, head);
        ListNode *p = &dummy;
        while (p->next && p->next->next) {
            if (p->next->val == p->next->next->val) {
                int val = p->next->val;
                while (p->next && p->next->val == val) {
                    p->next = p->next->next;
                }
            } else {
                p = p->next;
            }
        }
        return dummy.next;
    }
};

@interface LeetCode202202101406 : XCTestCase

@end

@implementation LeetCode202202101406

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    ListNode *head = new ListNode(1);
    head->next = new ListNode(2);
    head->next->next = new ListNode(2);
    
    
    auto ret = Solution().deleteDuplicates(head);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
