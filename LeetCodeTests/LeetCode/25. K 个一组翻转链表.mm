//
//  leetcode202202051929.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/5.
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
        ListNode dummy = ListNode();
        while (head) {
            ListNode *next = head->next;
            head->next = dummy.next;
            dummy.next = head;
            head = next;
        }
        return dummy.next;
    }
    
    
public:
    ListNode* reverseKGroup(ListNode* head, int k) {
        
        ListNode *nextHead = nullptr;
        ListNode *pHead = head;
        int i = 0;
        while (pHead) {
            i++;
            if (i == k) {
                nextHead = pHead->next;
                break;
            } else {
                pHead = pHead->next;
            }
        }
        if (i < k) {
            return head;
        }
        pHead->next = nullptr;
        ListNode *preHead = head;
        head = reverseList(head);
        preHead->next = reverseKGroup(nextHead, k);
        return head;
    }
};


@interface leetcode202202051929 : XCTestCase
@end

@implementation leetcode202202051929

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
