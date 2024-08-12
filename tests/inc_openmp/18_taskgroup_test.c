void omp_taskgroup_2() {
    int y = 0;
    #pragma omp taskgroup
    {
    int x = 1;
    y = x + 1;
    }
}

/*
void omp_taskgroup_2(){

}
*/

int main(){
    omp_taskgroup_2();
}
