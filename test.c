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
