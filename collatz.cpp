#include <iostream>
using namespace std;

class Collatz{
public:
  int num;

  int collatz(){
    cout<<"Please enter a number: ";
    cin>>num;
    while (num != 1){
      if (num%2 == 0){
        num /= 2;
        cout<<num<<endl;
      }else {
        num = (3*num)+ 1;
        cout<<num<<endl;
      }
    }
    return 0;
  }
};

int main(){
  Collatz m;
  m.collatz();
}
