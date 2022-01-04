//
//  Offer202201041125.m
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
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        
        if (!headA || !headB) {
            return nullptr;
        }
        
        ListNode *p = headA;
        ListNode *q = headB;
        while (p != q) {
            p = p != nullptr ? p->next : headB;
            q = q != nullptr ? q->next : headA;
        }
        return p;
    }
};



@interface Offer202201041125 : XCTestCase

@end

@implementation Offer202201041125

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
