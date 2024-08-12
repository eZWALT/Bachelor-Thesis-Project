void SpMV_ref(double *a, long *ia, long *ja, double *x, double *y, int nrows) {
  int row, idx;
  for (row = 0; row < nrows; row++) {
    double sum = 0.0;
    for (idx = ia[row]; idx < ia[row + 1]; idx++) {
      sum += a[idx] * x[ja[idx]];
    }
    y[row] = sum;
  }
}

int main(){
	return 0;
}
