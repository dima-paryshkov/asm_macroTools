#include <iostream>
extern "C" void func(char*, char*, int);
#pragma warning(disable : 4996)
void main() 
{
	const int N = 255;
	char* unputStr, *result;
	unputStr = new char[N];
	result = new char[N];
	std::cout << "Input string: ";
	std::cin.getline(unputStr, 49);
	std::cout << "Result:\n";
	strcpy(result, unputStr);
	func(unputStr, result, strlen(unputStr));
	std::cout << result << "\n";
	system("pause");
}
