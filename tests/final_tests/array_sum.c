#include <omp.h> 
#define SIZE 100000
#define CHUNK_SIZE 1000

int main() {
    int arr[SIZE];
    for (int i = 0; i < SIZE; i+=1)
        arr[i] = i + 1;

    int sum = 0;
    int num_chunks = (SIZE + CHUNK_SIZE - 1) / CHUNK_SIZE;
    int chunk_indices[num_chunks];
    int current_chunk = 0;

    // Initialize chunk indices
    for (int i = 0; i < num_chunks; i+=1) {
        chunk_indices[i] = i * CHUNK_SIZE;
    }

    #pragma omp parallel 
    {
        #pragma omp single
        {
            for (int i = 0; i < num_chunks; i+=1) {
                #pragma omp task
                {
                    int local_sum = 0;
                    int chunk_start, chunk_end;

                    // Get the next chunk to process
                    int local_current_chunk;
                    #pragma omp critical
                    {
                        local_current_chunk = current_chunk;
                        current_chunk+=1;
                    }

                    // Calculate chunk bounds
                    chunk_start = chunk_indices[local_current_chunk];
                    chunk_end = chunk_start + CHUNK_SIZE;
                    if (chunk_end > SIZE) chunk_end = SIZE;

                    // Process the chunk and compute local sum
                    for (int j = chunk_start; j < chunk_end; j+=1) {
                        local_sum += arr[j];
                    }

                    #pragma omp critical
                    {
                        sum += local_sum;
                    }
                }
            }
            #pragma omp taskwait
        }
    }

    return sum;
}