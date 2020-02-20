		extern int MAX_2(int x, int y);

		int main(){
			int a[5] = {1,20,600,500,700};
			int max = a[0];
			int i = 0;
			for (i = 1; i < 5; i++){
			max = MAX_2(a[i] , max);
			 
			}
			return max;
}
