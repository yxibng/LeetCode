//
//  QuickSort.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/19.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include <vector>
using namespace std;

namespace ts {
    int partation(vector<int> &array, int start, int end) {
        if (start == end) {
            return start;
        }
        
        int pivot = array[end];
        int i = start;
        
        for (int j = start; j < end; j++) {
            //比 pivot 小的，全部换到前面去
            if (array[j] < pivot) {
                //可以是小于，也可以是等于
                swap(array[j], array[i]);
                i++;
            }
        }
        swap(array[end], array[i]);
        return i;
    }
    
    void quickSort(vector<int> &array, int start, int end) {
        if (start >= end) {
            return;
        }
        int mid = partation(array, start, end);
        quickSort(array, start, mid-1);
        quickSort(array, mid+1, end);
    }
    
    void printArray(const vector<int> &array) {
        std::cout<<"-------"<<std::endl;
        for (auto &v : array) {
            std::cout<<v<<",";
        }
        std::cout<<std::endl<<"-------"<<std::endl;
    }
};





@interface QuickSort : XCTestCase

@end

@implementation QuickSort

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    vector<int> arr1 {1, 0, -1, 3, 5, 100};
    ts::quickSort(arr1, 0, (int)arr1.size()-1);
    ts::printArray(arr1);
}




- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
