//
//  Offer202201022031.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/2.
//

#import <XCTest/XCTest.h>
#include<string>
#include<unordered_map>

/*
 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

  

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
  

 提示：

 s.length <= 40000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */


using namespace std;

class Solution {
public:
    int lengthOfLongestSubstring(string s) {

        unordered_map<char, int> indexSet;
        int start = 0;
        int res = 0;
        for (int i = 0; i < s.size(); i++) {
            char key = s[i];
            int length = 0;
            if (indexSet.find(key) == indexSet.end()) {
                indexSet[key] = i;
                length = i - start + 1;
            } else {
                //找到了相同的
                int index = indexSet[key];
                if (index >= start) {
                    length = i - index;
                    start = index + 1;
                } else {
                    length = i - start + 1;
                }
                indexSet[key] = i;
            }
            res = max(res, length);
        }
        return res;
    }
};

@interface Offer202201022031 : XCTestCase

@end

@implementation Offer202201022031

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    int ret = su.lengthOfLongestSubstring("abcabcbb");
    XCTAssert(ret == 3);
    ret = su.lengthOfLongestSubstring("bbbbb");
    XCTAssert(ret == 1);
    ret = su.lengthOfLongestSubstring("pwwkew");
    XCTAssert(ret == 3);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
