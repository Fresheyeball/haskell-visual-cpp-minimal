#include <iostream>
#include "HsFFI.h"
#include "Foozle_stub.h"
#include <stdio.h>

extern "C" {
	void HsStart();
	void HsEnd();
}

int main()
{
	HsStart();
	std::cout << "Hello World!" << foo(3) << std::endl;
	HsEnd();
	return 0;
}