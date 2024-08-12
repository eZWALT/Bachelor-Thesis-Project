
int main(){
	int b = 3;
	
	#pragma omp parallel 
	{	
		#pragma omp task untied mergeable 
		{
			int a = 3;
			int * c = &a;
		}
	}
}
