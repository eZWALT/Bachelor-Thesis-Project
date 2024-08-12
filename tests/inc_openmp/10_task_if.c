
int main(){
	int b = 3;
	
	#pragma omp parallel 
	{	
		#pragma omp task if(3 < 4)
		{
			int a = 3;
			int * c = &a;
		}
	}
}
