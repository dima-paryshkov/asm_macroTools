#include <iostream>

extern "C" void func(char*, char*, int);

void main() 
{
	const int N = 255;
	char* unputStr, *result;
	unputStr = new char[N];
	result = new char[N];
	std::cout << "Input string: ";
	std::cin.getline(unputStr, 49);
	std::cout << "Result:\n";
	func(unputStr, result, strlen(unputStr));
	std::cout << unputStr << "\n";
	system("pause");
}
