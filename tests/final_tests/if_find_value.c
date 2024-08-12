#include <omp.h> 
#define SIZE 100000
#define CHUNK_SIZE 1000
#define TARGET 93129

int main() {
    int arr[SIZE];
    for (int i = 0; i < SIZE; i+=1)
        arr[i] = i + 1;

    int found_index = -1;
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
                    int chunk_start, chunk_end;
                    int local_found_index = -1;

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

                    // Process the chunk
                    for (int j = chunk_start; j < chunk_end; j+=1) {
                        if (arr[j] == TARGET) {
                            local_found_index = j;
                            break; // Exit the loop as soon as the target is found
                        }
                    }

                    // Update global found_index if a target is found
                    if(local_found_index != -1){
                        #pragma omp critical
                        {
                            if (found_index == -1) {
                                found_index = local_found_index;
                            }
                        }
                    }
                }
            }
            #pragma omp taskwait
        }
    }
    return found_index;
}
