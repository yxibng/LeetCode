//
//  Offer202201181740.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/18.
//

#import <XCTest/XCTest.h>
#include <stack>
#include <vector>

using namespace std;
class Solution {
public:
    bool validateStackSequences(vector<int>& pushed, vector<int>& popped) {
        if (pushed.size() != popped.size()) {
            return false;
        }
        stack<int>m_stack;
        int j = 0;
        for (int i = 0; i< pushed.size(); i++) {
            m_stack.push(pushed[i]);
            while (!m_stack.empty() && m_stack.top() == popped[j]) {
                m_stack.pop();
                j++;
            }
        }
        return m_stack.empty();
    }
};


@interface Offer202201181740 : XCTestCase

@end

@implementation Offer202201181740

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    
    {
        vector<int> pushed {1, 2, 3, 4, 5};
        vector<int> popped {4, 5, 3, 2, 1};
        bool ret = Solution().validateStackSequences(pushed, popped);
        XCTAssert(ret == true);
    }
    
    
    {
        vector<int> pushed {1, 2, 3, 4, 5};
        vector<int> popped {4, 3, 5, 1, 2};
        bool ret = Solution().validateStackSequences(pushed, popped);
        XCTAssert(ret == false);
    }

    
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
