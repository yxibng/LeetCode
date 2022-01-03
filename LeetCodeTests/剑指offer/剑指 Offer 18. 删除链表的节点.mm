//
//  Offer202101030820.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/3.
//

#import <XCTest/XCTest.h>


struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
    };

class Solution {
public:
    ListNode* deleteNode(ListNode* head, int val) {
        ListNode node = ListNode(0);
        node.next = head;
        
        ListNode *p = &node;
        while (p->next) {
            if (p->next->val == val) {
                p->next = p->next->next;
                break;
            }
            p = p->next;
        }
        return node.next;
    }
};


@interface Offer202101030820 : XCTestCase

@end

@implementation Offer202101030820

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
