//
//  Offer202112242154.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/24.
//

#import <XCTest/XCTest.h>
#include <stack>
using namespace std;
class CQueue {
    stack<int> stack1;
    stack<int> stack2;
public:
    CQueue() {
        
    }

    void appendTail(int value) {
        //压入第一个栈
        stack1.push(value);
    }
    
    int deleteHead() {
        if (stack2.empty()) {
            //第二个栈为空， 将第一个栈元素出栈，压入第二个栈
            while (!stack1.empty()) {
                int top = stack1.top();
                stack2.push(top);
                stack1.pop();
            }
        }
        //将第二个栈顶元素出栈
        if (!stack2.empty()) {
            int value = stack2.top();
            stack2.pop();
            return value;
        }
        //队列为空
        return -1;
    }
};


@interface Offer202112242154 : XCTestCase

@end

@implementation Offer202112242154

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
