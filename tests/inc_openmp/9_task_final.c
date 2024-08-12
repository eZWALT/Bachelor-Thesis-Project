
int main(){
	int b = 3;
	int a = -3;
	#pragma omp parallel 
	{
		int condition = (a+b) == 0;
		#pragma omp task final(condition)
		{
			int a = 33;
			int * c = &a;
		}
	}
}
