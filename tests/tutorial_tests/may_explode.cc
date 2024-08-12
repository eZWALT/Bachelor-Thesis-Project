int *may_explode() {
  int *p = nullptr;
  {
    int x = 0;
    p = &x;
    *p = 42;
  }
  *p = 42; 
}

int main(){
	may_explode();
}
