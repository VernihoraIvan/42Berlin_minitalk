#include <stdio.h>

void sendString(const char *str) {
    // Iterate through each character in the string
    while (*str != '\0') {
        char ch = *str;  // Get the current character
        // Send the character bitwise
        for (int i = 7; i >= 0; i--) {
            putchar((ch & (1 << i)) ? '1' : '0'); // Print '1' if the bit is set, '0' otherwise
        }
        str++;  // Move to the next character
    }
}

int main() {
    char *message = "Hello, World!";
    sendString(message);
    return 0;
}



// 01001000
// 00000001
// 00000010
// 00000100
// 00001000
// 00010000
// 00100000
// 01000000
// 10000000

//

// 01001000
