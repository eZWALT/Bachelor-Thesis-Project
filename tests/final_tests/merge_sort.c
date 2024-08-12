#include <omp.h> 
#define ARRAY_SIZE 100000

void merge(int *array, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;

    // Create temporary arrays
    int L[n1], R[n2];

    for (int i = 0; i < n1; i+=1) {
        L[i] = array[left + i];
    }
    for (int j = 0; j < n2; j+=1) {
        R[j] = array[mid + 1 + j];
    }

    int i = 0, j = 0, k = left;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            #pragma omp critical
            {
                array[k] = L[i];
                i+=1;
            }
        } else {
            #pragma omp critical
            {
                array[k] = R[j];
                j+=1;
            }
        }
        k+=1;
    }

    while (i < n1) {
        #pragma omp critical
        {
            array[k] = L[i];
            i+=1;
            k+=1;
        }
    }

    while (j < n2) {
        #pragma omp critical
        {
            array[k] = R[j];
            j+=1;
            k+=1;
        }
    }
}

void parallel_merge_sort(int *array, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;

        #pragma omp taskgroup
        {
            #pragma omp task
            parallel_merge_sort(array, left, mid);
            #pragma omp task
            parallel_merge_sort(array, mid + 1, right);

            // Wait for all tasks to complete
            #pragma omp taskwait

            merge(array, left, mid, right);
        }
    }
}

int is_sorted(int *array, int size) {
    for (int i = 0; i < size - 1; i+=1) {
        if (array[i] > array[i + 1]) {
            return 0;
        }
    }
    return 1;
}

int main() {
    int array[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i+=1) {
        array[i] = ARRAY_SIZE - i;
    }

    #pragma omp parallel
    {
        #pragma omp single
        parallel_merge_sort(array, 0, ARRAY_SIZE - 1);
    }

    int sorted = is_sorted(array, ARRAY_SIZE);
    return sorted;
}