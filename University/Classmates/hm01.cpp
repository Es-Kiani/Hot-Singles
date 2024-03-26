Node* multiply(Node* poly1, Node* poly2, Node* result)
{
    Node *ptr1 = poly1, *ptr2 = poly2;

    while (ptr1 != NULL) {
        while (ptr2 != NULL) {
            int data, power;
            data = ptr1->data * ptr2->data;
            power = ptr1->power + ptr2->power;
            res = push(poly3, data, power);
            ptr2 = ptr2->next;
        }
        
        ptr2 = poly2;
        ptr1 = ptr1->next;
    }

    return poly3;
}


int main()
{
    int x = 0, k = 9, n = 5;             //?    Repetition
                                         //
    for (int i = 2; i <= n; i++){        //         n
        if (k % i == 0){                 //       n - 1
            for (int j = i; j <= n; j++) //     k%i * sum(n-i) 0->n-2
                x = x + 1; }}            //      sum(i) 1->n-1
                                         //
                            //* T ≈ n+(n-1)(k%i)(sum(n-i))(sum(i))

    return 0;
}
