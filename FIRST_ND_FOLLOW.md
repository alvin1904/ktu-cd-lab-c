Sure, let's go through the code step by step:

```c
#include<stdio.h>
#include<math.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>
```

This section includes various standard C libraries for input/output, mathematical operations, string manipulation, character type checking, and memory allocation.

```c
int n, m = 0, p, i = 0, j = 0;
char a[10][10], f[10];
```

Here, variables `n`, `m`, `p`, `i`, and `j` are declared as integers, and arrays `a` and `f` are declared as characters. `a` is a two-dimensional array to store productions, and `f` is an array to store the first and follow sets.

```c
void follow(char c);
void first(char c);
```

Function prototypes for the `follow` and `first` functions are declared. These functions will be defined later in the code.

```c
int main() {
    int i, z;
    char c, ch;
    printf("Enter the no of productions:\n");
    scanf("%d", &n);
    printf("Enter the productions:\n");
    for (i = 0; i < n; i++)
        scanf("%s%c", a[i], &ch);
```

The `main` function begins. It prompts the user to input the number of productions (`n`) and then reads the productions into the array `a`.

```c
    do {
        m = 0;
        printf("Enter the elements whose first & follow is to be found:");
        scanf("%c", &c);
```

A `do-while` loop starts, prompting the user to enter elements for which the first and follow sets need to be found. The character entered is stored in variable `c`.

```c
        first(c);
        printf("First(%c)={", c);
        for (i = 0; i < m; i++)
            printf("%c", f[i]);
        printf("}\n");
        strcpy(f, " ");
        m = 0;
        follow(c);
        printf("Follow(%c)={", c);
        for (i = 0; i < m; i++)
            printf("%c", f[i]);
        printf("}\n");
        printf("Continue(0/1)?");
        scanf("%d%c", &z, &ch);
    } while (z == 1);
    return 0;
}
```

Inside the loop, the `first` and `follow` functions are called for the entered element `c`. The computed sets are then printed. The loop continues as long as the user inputs '1' to continue.

```c
void first(char c) {
    int k;
    if (!isupper(c))
        f[m++] = c;
    for (k = 0; k < n; k++) {
        if (a[k][0] == c) {
            if (a[k][2] == '$')
                follow(a[k][0]);
            else if (islower(a[k][2]))
                f[m++] = a[k][2];
            else
                first(a[k][2]);
        }
    }
}
```

The `first` function calculates the first set for a given symbol `c`. It checks if `c` is not an uppercase letter (terminal), and if so, it is added to the first set. Then, it iterates through the productions to find productions with `c` as the first symbol and computes the first set accordingly.

```c
void follow(char c) {
    if (a[0][0] == c)
        f[m++] = '$';
    for (i = 0; i < n; i++) {
        for (j = 2; j < strlen(a[i]); j++) {
            if (a[i][j] == c) {
                if (a[i][j + 1] != '\0')
                    first(a[i][j + 1]);
                if (a[i][j + 1] == '\0' && c != a[i][0])
                    follow(a[i][0]);
            }
        }
    }
}
```

The `follow` function computes the follow set for a given symbol `c`. It checks if `c` is the starting symbol, and if so, it adds '$' to the follow set. Then, it iterates through the productions to find occurrences of `c` and computes the follow set based on the next symbols in those productions.

This code seems to be related to the computation of First and Follow sets in a context-free grammar.
