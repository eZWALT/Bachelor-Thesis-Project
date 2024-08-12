
int main(){
	int a = 3;
	int b = 5;
	#pragma omp taskgroup
	{
		a = 10;
		b = 10;
	}
}
