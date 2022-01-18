//
//  Offer202112260952.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/26.
//

#import <XCTest/XCTest.h>
#include <string>
using namespace std;

/*
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */



/*
 
 参考： https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/solution/reversehan-shu-by-festive-golickll7-wujy/
 
 
1. 整体翻转
2. 翻转 [0, k mod n-1]
3. 翻转 [k mod n, n-1]
 ab cdefg
 gfedc ba
 cdefg ab
 
 
 */

class Solution {
    
    void reverse(string &s, int start, int end) {
        int left = start;
        int right = end;
        while (left < right) {
            swap(s[left], s[right]);
            left++;
            right--;
        }
    }
public:
    string reverseLeftWords(string s, int n) {

        int length = (int)s.length();
        //整体翻转
        reverse(s, 0, length-1);
        //翻转左侧
        reverse(s, 0, length - n - 1);
        //翻转右侧
        reverse(s, length-n, length-1);
        return s;
    }
};
 



@interface Offer202112260952 : XCTestCase

@end

@implementation Offer202112260952

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
