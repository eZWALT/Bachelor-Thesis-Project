
int main(){
	int b = 3;
	
	#pragma omp parallel 
	{	
		#pragma omp task 
		{
			int a = 3;
			short b = 1;
		}
	}
}
