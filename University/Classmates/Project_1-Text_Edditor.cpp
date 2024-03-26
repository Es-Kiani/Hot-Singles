#include <iostream>
using namespace std;

class Node
{
protected:
    char _data;
    Node *_next, *_prev;

public:
    Node(char, Node *, Node *);
    void setData(char);
    char readData();
    void setNext(Node *);
    Node *readNext();
    void setPrev(Node *);
    Node *readPrev();
};

//* Esfandiar Kiani

class LinkedList : protected Node
{
private:
    Node *_head, *_tail, *_pointer;
    bool _must_Add_Left;

public:
    LinkedList();
    Node *readHead();
    Node *readTail();
    bool isEmpty();
    void addFirst(char);
    void addLast(char);
    void addAtPointer(char);
    void movePointerLeft();
    void movePointerRight();
};

//* Esfandiar Kiani

class TextEditor
{
private:
    LinkedList _LL;
    unsigned long long int _max_Length;
    string *_pure_Text;
    const char _left_Key = 'L';
    const char _right_Key = 'R';

public:
    TextEditor(unsigned long long int);
    bool run();
    void setPureText();
    string getEditedText();
};

//* Esfandiar Kiani

int main()
{
    const unsigned int max_Text_Len = 1000000;
    TextEditor editor = TextEditor(max_Text_Len);

    editor.setPureText();
    editor.run();
    cout << editor.getEditedText();

    return 0;
}

//* Esfandiar Kiani

Node::Node(char got_Data = NULL, Node *got_Next = nullptr, Node *got_Prev = nullptr)
{
    _data = got_Data;
    _next = got_Next;
    _prev = got_Prev;
}

//* Esfandiar Kiani

LinkedList::LinkedList() : Node()
{
    _head = nullptr;
    _tail = nullptr;
    _pointer = _head;
    _must_Add_Left = false;
}

//* Esfandiar Kiani

TextEditor::TextEditor(unsigned long long int got_Max_Len)
{
    _LL = LinkedList();
    this->_max_Length = got_Max_Len;
    this->_pure_Text = new string[this->_max_Length + 1];
}

void Node::setData(char got_Char) { this->_data = got_Char; }

char Node::readData() { return _data; }

void Node::setNext(Node *got_Next) { this->_next = got_Next; }

//* Esfandiar Kiani

Node *Node::readNext() { return _next; }

void Node::setPrev(Node *got_Prev) { this->_prev = got_Prev; }

Node *Node::readPrev() { return _prev; }

bool LinkedList::isEmpty()
{
    if (this->_head == nullptr and this->_tail == nullptr)
        return true;
    return false;
}

//* Esfandiar Kiani

void LinkedList::addFirst(char got_Value)
{
    Node *new_Node = new Node(got_Value, _head);
    if (this->isEmpty())
    {
        _tail = new_Node;
    }
    else
        _head->setPrev(new_Node);
    _head = new_Node;
    _pointer = new_Node;

    if (_must_Add_Left)
        _must_Add_Left = false;
    return;
}

//* Esfandiar Kiani

void LinkedList::addLast(char got_Value)
{
    if (this->isEmpty())
        this->addFirst(got_Value);
    else
    {
        Node *new_Node = new Node(got_Value, _tail->readNext(), _tail);
        _tail->setNext(new_Node);
        _tail = new_Node;
    }
    return;
}

//* Esfandiar Kiani

void LinkedList::addAtPointer(char got_Value)
{
    if ((_pointer == nullptr and _head == nullptr) or (_pointer == _head and _must_Add_Left == true))
        this->addFirst(got_Value);
    else if (_pointer == _tail and _head != nullptr)
    {
        this->addLast(got_Value);
        _pointer = _pointer->readNext();
    }
    else
    {
        Node *new_Node = new Node(got_Value, _pointer->readNext(), _pointer);
        _pointer->setNext(new_Node);
        Node *tmp_Node = new_Node->readNext();
        tmp_Node->setPrev(new_Node);
        _pointer = new_Node;
    }
}

//* Esfandiar Kiani

void LinkedList::movePointerLeft()
{
    if (_pointer == _head)
        _must_Add_Left = true;
    else
        _pointer = _pointer->readPrev();
}

//* Esfandiar Kiani

void LinkedList::movePointerRight()
{
    if (_pointer == _tail)
        return;
    _pointer = _pointer->readNext();
}

//* Esfandiar Kiani

Node *LinkedList::readHead() { return this->_head; }

Node *LinkedList::readTail() { return this->_tail; }

void TextEditor::setPureText() { cin >> *_pure_Text; }

//* Esfandiar Kiani

bool TextEditor::run()
{
    unsigned long long int n = 0;
    while ((*_pure_Text)[n] != '\0')
    {
        if ((*_pure_Text)[n] == _left_Key)
            _LL.movePointerLeft();
        else if ((*_pure_Text)[n] == _right_Key)
            _LL.movePointerRight();
        else
            _LL.addAtPointer((*_pure_Text)[n]);
        n++;
    }
    return true;
}

//* Esfandiar Kiani

string TextEditor::getEditedText()
{
    Node *ptr = _LL.readHead();
    string str = "";
    while (ptr != nullptr)
    {
        str += ptr->readData();
        ptr = ptr->readNext();
    }
    return str;
}
