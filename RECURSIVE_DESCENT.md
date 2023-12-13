### Code Explanation:

1. **Header Files:**

   ```c
   #include <stdio.h>
   #include <string.h>
   #include <ctype.h>
   ```

   The code includes standard C libraries for input/output, string manipulation, and character handling.

2. **Global Variables and Function Prototypes:**

   ```c
   char input[20];
   int i, error;
   void E();
   void T();
   void Eprime();
   void TPrime();
   void F();
   ```

   - `input`: Array to store the arithmetic expression.
   - `i`: Index used to traverse the input.
   - `error`: Flag to indicate if an error is encountered.
   - Function prototypes for different parts of the grammar.

3. **Grammar Definition:**

   ```c
   // Grammar for arithmetic expressions
   // E->TE'
   // E'->+TE'| epsilon
   // T->FT'
   // T'->*FT'| epsilon
   // F->(E)|id
   ```

   Describes the context-free grammar for arithmetic expressions.

4. **Main Function:**

   ```c
   int main()
   {
       i = 0;
       error = 0;
       printf("Enter the arithmetic expression without whitespaces: ");
       scanf("%s[^\n]", input);
       E();
       if (strlen(input) == i && error == 0)
           printf("Accepted...\n");
       else
           printf("Rejected...\n");
   }
   ```

   - Initializes `i` and `error`.
   - Takes an arithmetic expression as input.
   - Calls the `E` function.
   - Checks if the entire input is consumed and no errors are encountered.

5. **Non-Terminal Functions:**

   - **E():**

     ```c
     void E()
     {
         T();
         Eprime();
     }
     ```

     Represents the non-terminal E in the grammar.

   - **Eprime():**

     ```c
     void Eprime()
     {
         if (input[i] == '+' || input[i] == '-')
         {
             i++;
             T();
             Eprime();
         }
     }
     ```

     Represents the non-terminal E' in the grammar.

   - **T():**

     ```c
     void T()
     {
         F();
         Tprime();
     }
     ```

     Represents the non-terminal T in the grammar.

   - **Tprime():**

     ```c
     void Tprime()
     {
         if (input[i] == '*' || input[i] == '/')
         {
             i++;
             F();
             Tprime();
         }
     }
     ```

     Represents the non-terminal T' in the grammar.

   - **F():**
     ```c
     void F()
     {
         if (isalnum(input[i]))
         {
             i++;
         }
         else
         {
             i++;
             E();
             if (input[i] == '(')
             {
                 i++;
                 E();
                 if (input[i] == ')')
                     i++;
                 else
                     error = 1;
             }
             else
             {
                 error = 1;
             }
         }
     }
     ```
     Represents the non-terminal F in the grammar.

### Grammar Explanation:

The provided C code checks whether an input string represents a valid arithmetic expression based on the given context-free grammar. The grammar represents expressions with addition, subtraction, multiplication, and division operators, as well as parentheses.

- **E -> TE'**: An expression consists of a term followed by an optional expression prime.
- **E' -> +TE' | ε**: Expression prime can be an addition followed by another term and expression prime or ε (empty).
- **T -> FT'**: A term consists of a factor followed by an optional term prime.
- **T' -> \*FT' | ε**: Term prime can be multiplication followed by another factor and term prime or ε.
- **F -> (E) | id**: A factor can be an expression within parentheses or an identifier.

The code uses recursive descent parsing to traverse the input string and check if it conforms to the specified grammar. If the input is accepted without errors, it prints "Accepted"; otherwise, it prints "Rejected."

### Example:

For the input string "id + id \* id", the output would be "Accepted." The expression follows the grammar rules, representing a valid arithmetic expression.
