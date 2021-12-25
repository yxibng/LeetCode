//
//  Offer202112250937.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/25.
//

#import <XCTest/XCTest.h>

  
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode node = ListNode(-1);
        while (head) {
            //save head's next
            ListNode *next = head->next;
            
            //inser head
            head->next = node.next;
            node.next = head;
            head = next;
        }
        return node.next;
    }
};


@interface Offer202112250937 : XCTestCase

@end

@implementation Offer202112250937

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
