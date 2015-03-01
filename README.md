# This is a minimal complete example of Haskell being called from Visual C++
(or atleast its intended to be)

### Motivation:

Needed to learn how to do this. Hopefully this will help someone out there trying to get Haskell from C++ running in visual studio.

### Prerequists:

- Haskell Plaform Installed
- Visual Studio 2013
- Windows
- Patience

### Usage:

Simply run `packageHS.bat` to get the what we need as `.h` and `.lib` files.

```bat
ghc -c Foozle.hs
ghc -c HsStartEnd.c
ghc -shared -o Foozle.dll Foozle.o HsStartEnd.o
lib /DEF:Foozle.def /OUT:Foozle.lib /MACHINE:x64
```

1. Compile `Foozle.hs` into `Foozle.o` and `Foozle_stub.h`
2. Compile `HsStartEnd.c` into `HsStartEnd.o` and `HsStartEnd.h` this is necissary because the commands to start and stop the STG (Spineless Tagless Graph Machine, (The thing that executes Haskell code)) cannot be called directly from C++, but they can be called form C.
3. Compile it all together into `Foozle.dll`
4. Generate `Foozle.lib` and `Foozle.exp` based on `Foozle.def` which can finally be called from C++

```C++
int main()
{
	HsStart(); // Start the STG
	std::cout << "Hello World!" << foo(3) << std::endl; // call foo from foozle.hs
	HsEnd(); // End the STG
	return 0; // Set a breakpoint here or something so you can see the result
}
```

You will also need to ensure that your `VC++ Directories` contains Haskell Platform, and that Your `Linker > General > Input` has `Foozle.lib`.
