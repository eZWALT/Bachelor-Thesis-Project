
void omp_taskyield_1(){
	#pragma omp taskyield
	return;
}

int main(){
	omp_taskyield_1();
	return 0;
}
