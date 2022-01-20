//
//  Offer202201202221.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/20.
//

#import <XCTest/XCTest.h>

#include <deque>
#include <queue>
using namespace std;
class MaxQueue {
    deque<int>m_deque;
    queue<int>m_queue;
public:
    MaxQueue() {

    }
    
    int max_value() {
        if (m_queue.empty()) {
            return -1;
        }
        return m_deque.front();
    }
    void push_back(int value) {
        
        //维持单调递减
        while (!m_deque.empty() && m_deque.back() < value) {
            m_deque.pop_back();
        }
        //插入元素
        m_deque.push_back(value);
        m_queue.push(value);
    }
    
    int pop_front() {

        if (m_queue.empty()) {
            return -1;
        }
        int top = m_queue.front();
        m_queue.pop();
        
        if (m_deque.front() == top) {
            m_deque.pop_front();
        }
        return top;
    }
};


@interface Offer202201202221 : XCTestCase

@end

@implementation Offer202201202221

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    {
        MaxQueue *obj = new MaxQueue();
        obj->push_back(1);
        obj->push_back(2);
        
        XCTAssert(obj->max_value() == 2);
        XCTAssert(obj->pop_front() == 1);
        XCTAssert(obj->max_value() == 2);
    }
    
    {
        MaxQueue *obj = new MaxQueue();
        XCTAssert(obj->pop_front() == -1);
        XCTAssert(obj->max_value() == -1);

    }

    
    
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
