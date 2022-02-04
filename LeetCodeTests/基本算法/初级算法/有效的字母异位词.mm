//
//  Easy202202042249.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/4.
//

#import <XCTest/XCTest.h>
#include <string>
using namespace std;

class Solution {
public:
    bool isAnagram(string s, string t) {
        
        if (s.length() != t.length()) {
            return false;
        }
        
        const int count = 26;
        
        int arr_a[count];
        int arr_b[count];
        memset(arr_a, 0, count * sizeof(int));
        memset(arr_b, 0, count * sizeof(int));
        
        for (int i = 0; i< s.length(); i++) {
            //a
            int index_a = s[i] - 'a';
            arr_a[index_a]++;
            //b
            int index_b = t[i] - 'a';
            arr_b[index_b]++;
        }
        for (int i = 0; i< count; i++) {
            if (arr_a[i] != arr_b[i]) {
                return false;
            }
        }
        return true;
    }
};
@interface Easy202202042249 : XCTestCase

@end

@implementation Easy202202042249

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    int ret = Solution().isAnagram("anagram", "nagaram");
    XCTAssert(ret);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
