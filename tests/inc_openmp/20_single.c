int work1(unsigned int n){
    if(n <= 1) return n;
    else return work1(n-1) + work1(n-2);
}

int work2(unsigned int n){
    return n*n + n*n*n + n % n;
}

int main(){
    #pragma omp parallel 
    {
        unsigned int x,y;
        #pragma omp single 
        {
            x = work1(5);
        }

        #pragma omp single 
        {
            y = work2(420);
        }
    }
    
}