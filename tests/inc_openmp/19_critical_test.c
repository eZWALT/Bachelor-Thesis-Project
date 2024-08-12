void omp_critical_2() {
    int y = 0;
    #pragma omp critical
    {
    int x = 1;
    y = x + 1;
    }
}

int main(){
    omp_critical_2();
}
