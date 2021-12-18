//
//  Test20211218.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/18.
//

#import <XCTest/XCTest.h>
#include <list>
#include <unordered_map>
#include <iostream>

/*
 实现思路，双向链表+ hash 表
 头部最新， 尾部最旧， 双向链表删除方便
 hash 表 （key, value） value 指向双向列表的节点地址
 */

using namespace std;
class LRUCache {
    struct ListNode {
        int value = 0;
        int key = 0;
        ListNode(int key, int value) {
            this->key = key;
            this->value = value;
            next = nullptr;
            front = nullptr;
        }
        ListNode *next = nullptr;
        ListNode *front = nullptr;
    };
    int capacity = 0;
    unordered_map<int, ListNode *> keyToNodeMap;
    ListNode *head = nullptr;
    ListNode *tail = nullptr;
    
    bool isFull() {
        return keyToNodeMap.size() == capacity;
    }
    
    void insertToHead(ListNode *node) {
        std::cout<<"before insert"<<endl;
        printList(head);
        //在头部插入
        node->next = head->next;
        head->next = node;
        node->front = head;
        node->next->front = node;
        //保存到hash 表
        keyToNodeMap[node->key] = node;
        std::cout<<"after insert"<<endl;
        printList(head);
    }
    
    void remove(ListNode *node) {
        std::cout<<"before remove"<<endl;
        printList(head);
        //从双向链表中移除
        ListNode *front = node->front;
        ListNode *next = node->next;
        
        front->next = next;
        next->front = front;
        //从map 中移除
        keyToNodeMap.erase(node->key);
        //释放内存
        delete node;
        std::cout<<"after remove"<<endl;
        printList(head);
    }
    
    void moveToHead(ListNode *node) {
        std::cout<<"before move"<<endl;
        printList(head);
        //从原链表中移除
        ListNode *front = node->front;
        ListNode *next = node->next;
        front->next = next;
        next->front = front;
        
        
        //插入到头部
        node->next = head->next;
        node->front = head;
        node->next->front = node;
        head->next = node;
        std::cout<<"after move"<<endl;
        printList(head);
        
    }
    
    void printList(ListNode *node) {
        std::cout<<"---------"<<std::endl;
        while (node) {
            std::cout<<"key: " << node->key << "value: " << node->value << std::endl;
            node = node->next;
        }
    }
    
    
public:
    
    ~LRUCache() {
        cout<<__PRETTY_FUNCTION__<<endl;
        while (head) {
            ListNode *p = head->next;
            delete head;
            head = p;
        }
    }
    LRUCache(int capacity) {
        this->capacity = capacity;
        head = new ListNode(0, 0);
        tail = new ListNode(0, 0);
        head->next = tail;
        tail->front = head;
        
        std::cout<<__PRETTY_FUNCTION__<<__LINE__<<std::endl;
        printList(head);
    }
    
    int get(int key) {
        
        if (this->keyToNodeMap.find(key) != this->keyToNodeMap.end()) {
            //找到了
            ListNode *node = this->keyToNodeMap[key];
            moveToHead(node);
            return node->value;
        } else {
            //没找到
            return -1;
        }
    }
    
    void put(int key, int value) {

        if (this->keyToNodeMap.find(key) != this->keyToNodeMap.end()) {
            //找到了
            ListNode *node = this->keyToNodeMap[key];
            node->value = value;
            moveToHead(node);
        } else {
            //没找到
            if (isFull()) {
                remove(tail->front);
            }
            /*
             1. 创建新节点
             2. 插入链表头部
             3. 保存到hash表
             */
            ListNode *node = new ListNode(key, value);
            insertToHead(node);
        }
    }
};



@interface Test20211218 : XCTestCase

@end

@implementation Test20211218

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    LRUCache *lRUCache = new LRUCache(2);
    lRUCache->put(1, 1); // 缓存是 {1=1}
    lRUCache->put(2, 2); // 缓存是 {1=1, 2=2}
    int value = lRUCache->get(1);    // 返回 1
    XCTAssert(value == 1);
    lRUCache->put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
    value = lRUCache->get(2);    // 返回 -1 (未找到)
    XCTAssert(value == -1);
    lRUCache->put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
    value = lRUCache->get(1);    // 返回 -1 (未找到)
    XCTAssert(value == -1);
    value = lRUCache->get(3);    // 返回 3
    XCTAssert(value == 3);
    value = lRUCache->get(4);    // 返回 4
    XCTAssert(value == 4);

    delete lRUCache;
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
