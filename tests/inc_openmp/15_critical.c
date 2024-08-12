//#include <stdio.h>

int main() {
    int sum = 0;

    #pragma omp parallel
    {
        // Simulate some work
        int local_sum = 0;
        for (int i = 0; i < 100; i+=1) {
            local_sum += i;
        }

        // Critical section to update the shared variable `sum`
        #pragma omp critical
        {
            sum += local_sum;
        }
    }

    //printf("Sum: %d\n", sum);
    return sum;
}
