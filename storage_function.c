// This is just a file with a singular function so that the integers aren't optimized out

volatile int storage;

void use_integer_variable(int val) {
	storage = val;
}