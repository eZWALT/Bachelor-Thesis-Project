#include <omp.h> 
#define N 500
#define M 500
#define P 500
#define CHUNK_SIZE 50  

int main() {
    int A[N][M], B[M][P], C[N][P];

    for (int i = 0; i < N; i+=1)
        for (int j = 0; j < M; j+=1)
            A[i][j] = i + j;

    for (int i = 0; i < M; i+=1)
        for (int j = 0; j < P; j+=1)
            B[i][j] = i - j;

    for (int i = 0; i < N; i+=1)
        for (int j = 0; j < P; j+=1)
            C[i][j] = 0;

    // Calculate chunk indices for rows of C
    int num_chunks_i = (N + CHUNK_SIZE - 1) / CHUNK_SIZE;
    int chunk_indices_i[num_chunks_i];
    for (int i = 0; i < num_chunks_i; i+=1) {
        chunk_indices_i[i] = i * CHUNK_SIZE;
    }

    // Calculate chunk indices for columns of C
    int num_chunks_j = (P + CHUNK_SIZE - 1) / CHUNK_SIZE;
    int chunk_indices_j[num_chunks_j];
    for (int j = 0; j < num_chunks_j; j+=1) {
        chunk_indices_j[j] = j * CHUNK_SIZE;
    }

    #pragma omp parallel 
    {
        #pragma omp single
        {
            // Loop over chunk indices for rows of C
            for (int ci = 0; ci < num_chunks_i; ci+=1) {
                int start_i = chunk_indices_i[ci];
                int end_i = start_i + CHUNK_SIZE;
                if (end_i > N) end_i = N;

                // Loop over chunk indices for columns of C
                for (int cj = 0; cj < num_chunks_j; cj+=1) {
                    int start_j = chunk_indices_j[cj];
                    int end_j = start_j + CHUNK_SIZE;
                    if (end_j > P) end_j = P;

                    // Task to compute elements of C for the current chunk
                    #pragma omp task 
                    {
                        for (int i = start_i; i < end_i; i+=1) {
                            for (int j = start_j; j < end_j; j+=1) {
                                int local_sum = 0;
                                for (int k = 0; k < M; k+=1) {
                                    local_sum += A[i][k] * B[k][j];
                                }
                                // Critical section to update C[i][j]
                                #pragma omp critical
                                {
                                    C[i][j] += local_sum;
                                }
                            }
                        }
                    }
                }
            }
            // Wait for all tasks to complete
            #pragma omp taskwait
        }
    }

    int sum = 0;
    for (int i = 0; i < N; i+=1) {
        for (int j = 0; j < P; j+=1) {
            sum += C[i][j];
        }
    }
    return sum;
}
