
int main(){
	int b = 3;
	
	#pragma omp parallel 
	{	
		#pragma omp task priority(10)
		{
			int a = 3;
			int * c = &a;
		}
	}
}
