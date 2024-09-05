
#include <iostream>

int s[200];
using namespace std;
#include <chrono>
using namespace std::chrono;

int power2(int num, int power)
{
    __asm
    {
        mov eax, num; Get first argument
        mov ecx, power; Get second argument
        shl eax, cl; EAX = EAX * (2 to the power of CL)
    }
    // Return with result in EAX
}



int main()
{
    for (int j = 0; j < 10; j++)
    {

   
    int myarray[ 30000];

    int sum{0};

    const unsigned int arrsize = sizeof(myarray) / sizeof(int);
    for (int i = 0; i < arrsize; i++)
    {
        myarray[i] = rand();
    }


    auto start = high_resolution_clock::now();
    for (int i = 0; i < arrsize; i++)
    {

        sum = sum + myarray[i];
        
    }


    auto stop = high_resolution_clock::now();
    printf("Sum is (C++): %d\n", sum);
    auto duration = duration_cast<microseconds>(stop - start);
    cout << "Time, C++: ";

    cout << duration.count() << endl;

    sum = 0;
    auto startasm = high_resolution_clock::now();
    _asm{
        mov ecx, 0
        mov eax, 0
        lea esi,[myarray]
        mov ebx, 0
        add ebx, TYPE myarray
        


        L1:
        mov eax,[esi]
        add esi, ebx
        add [sum],eax
        inc ecx
        cmp ecx, arrsize
        jl L1
     
    };
    auto stopasm = high_resolution_clock::now();
    auto durationasm = duration_cast<microseconds>(stopasm - startasm);
    cout << "Time, assembler: ";
    cout << durationasm.count() << endl;
   

    printf("Sum is (Assembler): %d\n", sum);
    cout << "------------" << endl;
    }
    return 0;
}
