//
//  Offer202201041119.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/4.
//

#import <XCTest/XCTest.h>


struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
        
        ListNode node = ListNode(0);
        ListNode *p = &node;
        
        while (l1 && l2) {
            if (l1->val >= l2->val) {
                p->next = l2;
                l2 = l2->next;
            } else {
                p->next = l1;
                l1 = l1->next;
            }
            p = p->next;
        }
            
        if (l1) {
            p->next = l1;
        }
        
        if (l2) {
            p->next = l2;
        }
        return node.next;
    }
};



@interface Offer202201041119 : XCTestCase

@end

@implementation Offer202201041119

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
