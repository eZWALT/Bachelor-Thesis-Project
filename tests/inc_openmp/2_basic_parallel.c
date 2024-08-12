
int main(){
	#pragma omp parallel
	{
		int x = 2;
		x = 3;	
	}
}
