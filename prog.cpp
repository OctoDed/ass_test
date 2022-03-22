#include <iostream>
using namespace std;

int main()
{
	int arr[5]{1,2,3,4,5};
	int b = 3;
	cout<<"Array:"<<endl;
	for(auto i : arr)
	{
	cout<<i<<endl;
	}
	cout<<"b="<<b<<endl;
	int sum_less=0;
	int sum_gr=0;
	for(auto i : arr)
	{
	if (i>b) sum_gr=sum_gr+i;
	else if (i<b) sum_less++;
	}
	cout<<"Quantity of lesser elements: "<<sum_less<<endl;
	cout<<"Summ of greater elements: "<<sum_gr<<endl;
}
