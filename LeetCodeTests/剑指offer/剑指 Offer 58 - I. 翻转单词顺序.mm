//
//  Offer202201051357.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/5.
//

#import <XCTest/XCTest.h>
#include <string>
/*
 输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。

  

 示例 1：

 输入: "the sky is blue"
 输出: "blue is sky the"
 示例 2：

 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 示例 3：

 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
  

 说明：

 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


using namespace std;
class Solution {
public:
    string reverseWords(string s) {

        
        int right = (int)s.size() - 1;
        int left = right;
        
        string ret = "";
        
        while (right >= 0) {
            
            //找到第一个不为空格的字符
            if (s[right] == ' ') {
                right--;
                continue;
            }
            
            left = right;
            //找到下一个空格
            while (left >= 0 && s[left] != ' ') {
                left--;
            }
            ret.append(s.begin()+left+1, s.begin()+right+1);
            ret.append(" ");
            right = left;
        }
        //清除末尾的空格
        ret.pop_back();
        return ret;
    }
};

@interface Offer202201051357 : XCTestCase

@end

@implementation Offer202201051357

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    Solution su;
    string ret = su.reverseWords("the sky is blue");
    XCTAssert(ret == "blue is sky the");
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
