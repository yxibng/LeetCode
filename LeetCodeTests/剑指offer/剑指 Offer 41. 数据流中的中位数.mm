//
//  Offer202201091935.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/9.
//

#import <XCTest/XCTest.h>
#include <queue>
using namespace std;
class MedianFinder {
private:
    //大顶堆，存小的一半
    priority_queue<int, vector<int>, less<int>> maxHeap;
    //小顶堆， 存大的一半
    priority_queue<int, vector<int>, greater<int>> minHeap;
public:
    /** initialize your data structure here. */
    MedianFinder() {

    }
    
    void addNum(int num) {
        if (maxHeap.size() == minHeap.size()) {
            maxHeap.push(num);
            minHeap.push(maxHeap.top());
            maxHeap.pop();
        } else if(maxHeap.size() > minHeap.size()) {
            maxHeap.push(num);
            minHeap.push(maxHeap.top());
            maxHeap.pop();
        } else {
            minHeap.push(num);
            maxHeap.push(minHeap.top());
            minHeap.pop();
        }
    }
    double findMedian() {
        if (maxHeap.size() == minHeap.size()) {
            return (maxHeap.top() + minHeap.top()) / 2.0;
        } else if (maxHeap.size() > minHeap.size()) {
            return maxHeap.top();
        } else {
            return minHeap.top();
        }
    }
};

@interface Offer202201091935 : XCTestCase

@end

@implementation Offer202201091935

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
