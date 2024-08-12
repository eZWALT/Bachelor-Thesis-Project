void omp_master_2() {
    int y = 0;
    #pragma omp master
    {
    int x = 1;
    y = x + 1;
    }
}

int main(){
    omp_master_2();
}