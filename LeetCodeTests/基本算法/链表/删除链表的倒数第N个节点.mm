//
//  LinkList202201111741.m
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
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode *dummy = new ListNode(0, head);
        int i = 0;
        ListNode *post = nullptr;
        ListNode *pre = dummy;
        while (pre) {
            if (i == n) {
                post = post ? post->next: dummy;
            } else {
                i++;
            }
            pre = pre->next;
        }
        post->next = post->next->next;
        return dummy->next;
        
    }
};


@interface LinkList202201111741 : XCTestCase

@end

@implementation LinkList202201111741

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
