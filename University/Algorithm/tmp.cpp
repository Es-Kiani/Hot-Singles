int pop(int heap[], int &n)
{
    int i = 1, result, temp, min;

    result = heap[1];

    heap[1] = heap[n--];

    while (2 * i <= n)
    {
        min = 2 * i;

        if (min + 1 <= n && heap[min + 1] < heap[min])
            min++;

        if (heap[i] <= heap[min])
            break;

        temp = heap[i];

        heap[i] = heap[min];

        heap[min] = temp;

        i = min;
    }
    return result;
    // Esfandiar Kiani
}