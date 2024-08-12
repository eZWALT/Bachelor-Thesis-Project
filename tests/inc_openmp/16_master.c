//#include <stdio.h>
//#include <omp.h>

int main() {
    int sum = 0;
    int result;
    #pragma omp parallel
    {
        // Simulate some work
        int local_sum = 0;
        for (int i = 0; i < 100; i+=1) {
            local_sum += i;
        }

        // Reduction clause to sum up local sums
        #pragma omp critical 
	{
        	sum += local_sum;
	}

        // Master section to print the result
        #pragma omp master
        {
	    	result = sum*sum;
        }
    }

    return result;
}
