#include <stdio.h>
#include <string.h>
#include <ctype.h>

char input[20];
int i, error;
void E();
void T();
void Eprime();
void TPrime();
void F();

// Grammar for arithmetic expressions
// E->TE'
// E'->+TE'|E
// T->FT'
// T'->*FT'|E
// F->(E)|id

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

void E()
{
    T();
    Eprime();
}

void Eprime()
{
    if (input[i] == '+' || input[i] == '-')
    {
        i++;
        T();
        Eprime();
    }
}

void T()
{
    F();
    Tprime();
}

void Tprime()
{
    if (input[i] == '*' || input[i] == '/')
    {
        i++;
        F();
        Tprime();
    }
}

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
            error = 1;
    }
}