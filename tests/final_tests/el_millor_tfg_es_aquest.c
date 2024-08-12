#define SIZE 10000

int main() {
    int arr[SIZE];
    for (int i = 0; i < SIZE; i+=1)
        arr[i] = i + 1;

    int sum = 0;

    #pragma omp parallel
    {
        #pragma omp single
        {
            for (int i = 0; i < SIZE; i+=1) {
                #pragma omp task
                {
                    #pragma omp critical
                    {
                        sum += arr[i];
                    }
                }
            }
        }
    }

    #pragma omp barrier

    return sum;
}
