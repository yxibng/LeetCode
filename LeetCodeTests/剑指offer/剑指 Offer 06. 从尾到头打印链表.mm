//
//  Offer202112250931.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/25.
//

#import <XCTest/XCTest.h>
#include <stack>
#include <vector>

using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
    stack<int> ret;
public:
    vector<int> reversePrint(ListNode* head) {
        
        while (head) {
            ret.push(head->val);
            head = head->next;
        }
        vector<int> answer(ret.size());
        int index = 0;
        while (!ret.empty()) {
            int val = ret.top();
            answer[index] = val;
            ret.pop();
            index++;
        }
        return answer;
    }
};


@interface Offer202112250931 : XCTestCase

@end

@implementation Offer202112250931

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
