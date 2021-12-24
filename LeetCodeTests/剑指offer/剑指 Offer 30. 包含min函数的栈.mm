//
//  Offer202112242208.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/24.
//

#import <XCTest/XCTest.h>
#include <stack>
using namespace std;
class MinStack {
    stack<int> theStack;
    stack<int> minStack;
public:
    /** initialize your data structure here. */
    MinStack() {
        
    }
    void push(int x) {
        theStack.push(x);
        if (minStack.empty()) {
            minStack.push(x);
        } else {
            int top = minStack.top();
            if (x <= top) {
                minStack.push(x);
            }
        }
    }
    
    void pop() {
        if (theStack.empty()) {
            return;
        }
        int top = theStack.top();
        if (top == minStack.top()) {
            minStack.pop();
        }
        theStack.pop();
    }
    
    int top() {
        return theStack.top();
    }
    int getMin() {
        return minStack.top();
    }
};



@interface Offer202112242208 : XCTestCase

@end

@implementation Offer202112242208

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
