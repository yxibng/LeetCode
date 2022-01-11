//
//  LinkList202201111537.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/11.
//

#import <XCTest/XCTest.h>

struct Node {
    int value;
    Node *next;
    Node( int v): value(v), next(nullptr) {
        
    }
};


class MyLinkedList {
    Node *head = NULL;
    int count = 0;
public:
    MyLinkedList() {
    
    }
    
    int get(int index) {
        if (index >= count) {
            return -1;
        }
        Node *p = head;
        while (p) {
            if (index == 0) {
                return p->value;
            }
            index--;
            p = p->next;
        }
        return -1;
    }
    
    void addAtHead(int val) {
        count++;
        Node *p = new Node(val);
        p->next = head;
        head = p;

    }
    
    void addAtTail(int val) {
        count++;
        if (!head) {
            addAtHead(val);
            return;
        }
        Node *p = head;
        while (p->next) {
            p = p->next;
        }
        Node *node = new Node(val);
        p->next = node;
    }
    
    void addAtIndex(int index, int val) {
        if (index >count) {
            return;
        }
        if (index <= 0) {
            addAtHead(val);
            return;
        }
        
        if (index == count) {
            addAtTail(val);
            return;
        }
        
        count++;
        Node *p = head;
        for (int i = 0; i< index-1; i++) {
            p = p->next;
        }
        Node *node =  new Node(val);
        node->next = p->next;
        p->next = node;
    }
    
    void deleteAtIndex(int index) {
        
        if (index >= count) {
            return;
        }
        count--;
        if (index == 0) {
            Node *p = head;
            head = p->next;
            delete p;
            return;
        }
        Node *p = head;
        for (int i = 0; i< index-1; i++) {
            p = p->next;
        }
        
        Node *del = p->next;
        p->next = del->next;
        delete del;
    }
};

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * MyLinkedList* obj = new MyLinkedList();
 * int param_1 = obj->get(index);
 * obj->addAtHead(val);
 * obj->addAtTail(val);
 * obj->addAtIndex(index,val);
 * obj->deleteAtIndex(index);
 */


@interface LinkList202201111537 : XCTestCase

@end

@implementation LinkList202201111537

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
//    ["MyLinkedList","addAtHead 7","addAtHead 2","addAtHead 1","addAtIndex 3, 0","deleteAtIndex 2","addAtHead 6","addAtTail 4","get 4","addAtHead4","addAtIndex 5,0","addAtHead 6"]
//    [[],[7],[2],[1],[3,0],[2],[6],[4],[4],[4],[5,0],[6]]
    
//    ["MyLinkedList","addAtHead 2","deleteAtIndex 1","addAtHead 2","addAtHead7","addAtHead3","addAtHead2","addAtHead5","addAtTail5","get5","deleteAtIndex6","deleteAtIndex4"]
//    [[],[2],[1],[2],[7],[3],[2],[5],[5],[5],[6],[4]]
    
    
    MyLinkedList *obj = new MyLinkedList();
    obj->addAtHead(2);
    
    
    

    
    
    
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
