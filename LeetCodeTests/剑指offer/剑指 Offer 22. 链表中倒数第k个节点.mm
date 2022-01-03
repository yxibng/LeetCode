//
//  Offer202201030826.m
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
    ListNode* getKthFromEnd(ListNode* head, int k) {
        
        if (!head) {
            return nullptr;
        }
        ListNode *left = nullptr;
        ListNode *right = head;
        int count = 1;
        while (right) {
            if (count == k) {
                if (!left) {
                    left = head;
                } else {
                    left = left->next;
                }
            } else {
                count++;
            }
            right = right->next;
        }
        return left;
    }
};


@interface Offer202201030826 : XCTestCase

@end

@implementation Offer202201030826

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
