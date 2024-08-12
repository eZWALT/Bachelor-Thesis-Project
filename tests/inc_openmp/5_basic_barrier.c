int omp_barrier_1(){
	#pragma omp barrier
	return 1;
}

void omp_barrier_2(){
	#pragma omp barrier
}

int main(){
	omp_barrier_2();
}
