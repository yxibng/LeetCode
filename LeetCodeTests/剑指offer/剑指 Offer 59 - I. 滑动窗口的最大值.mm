//
//  Offer202201192126.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/19.
//

#import <XCTest/XCTest.h>
#include <vector>
#include <deque>

using namespace std;

class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        
        vector<int>ans;
        
        deque<int>m_queue;
        
        for (int i = 0; i< nums.size(); i++) {
            
            if (i< k-1) {
                //窗口未形成
                if (m_queue.empty()) {
                    //队列为空，直接添加
                    m_queue.push_back(nums[i]);
                    continue;
                } else {
                    if (m_queue.back() >= nums[i]) {
                        //满足单调递减，添加
                        m_queue.push_back(nums[i]);
                    } else {
                        //队尾出队，保证单调递减
                        while (!m_queue.empty() && m_queue.back() < nums[i]) {
                            m_queue.pop_back();
                        }
                        m_queue.push_back(nums[i]);
                    }
                }
                continue;
            }
            
            //窗口形成了
            if (m_queue.empty()) {
                //队列为空，直接添加
                m_queue.push_back(nums[i]);
            } else {
                //最大元素被移除了
                if (i-k >= 0 && m_queue.front() == nums[i-k]) {
                    m_queue.pop_front();
                }
                if (m_queue.back() >= nums[i]) {
                    //满足单调递减，添加
                    m_queue.push_back(nums[i]);
                } else {
                    //队尾出队，保证单调递减
                    while (!m_queue.empty() && m_queue.back() < nums[i]) {
                        m_queue.pop_back();
                    }
                    m_queue.push_back(nums[i]);
                }
            }
            //将队头元素添加
            ans.push_back(m_queue.front());
        }
        return ans;
    }
};
@interface Offer202201192126 : XCTestCase

@end

@implementation Offer202201192126

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
        vector<int> nums {1,3,-1,-3,5,3,6,7};

        auto ret = Solution().maxSlidingWindow(nums, 3);

        vector<int>ans{3,3,5,5,6,7};
        XCTAssert(ret == ans);

    }
    
    {
        
        vector<int> nums {1,3,1,2,0,5};
        
        auto ret = Solution().maxSlidingWindow(nums, 3);
        
        vector<int>ans{3,3,2,5};
        XCTAssert(ret == ans);
        
    }
    

    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
