
int main(){
	int a = 3;
	int b = 5;
	#pragma omp taskgroup
	{
		#pragma omp task
		{
			a = 10;
		}

		#pragma omp task
		{
			b = 10;
		}
	}
}
