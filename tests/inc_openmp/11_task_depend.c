
int main(){
	int x = 5;
	int y = 413;

	#pragma omp parallel 
	{
		#pragma omp task depend(out: x,y)
		{
			x += 1;
		}
		#pragma omp task depend(in: x,y)
		{
			x -= 1;
		}
		int * c = &x;
	}
}
