//
//  LinkList202201111637.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/11.
//

#import <XCTest/XCTest.h>

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    bool hasCycle(ListNode *head) {
        if (!head) {
            return false;
        }
        ListNode *slow = head;
        ListNode *fast = head;
        do {
            if (fast->next == nullptr || fast->next->next == nullptr) {
                return false;
            }
            fast = fast->next->next;
            slow = slow->next;
        } while (fast != slow);
        return true;
    }
};


@interface LinkList202201111637 : XCTestCase

@end

@implementation LinkList202201111637

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
