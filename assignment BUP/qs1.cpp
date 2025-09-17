#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
char *keywords[] = {"int", "float", "return", "if", "else", "while", "for", "main", "void",
                    NULL};
int isKeyword(const char *word)
{
    for (int i = 0; keywords[i] != NULL; i++)
    {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
int isOperator(char ch)
{
    return (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '=' || ch == '<' || ch == '>');
}
int isPunctuation(char ch)
{
    return (ch == '(' || ch == ')' || ch == '{' || ch == '}' || ch == ',' || ch == ';');
}
int main()
{
    FILE *fp;
    char ch, word[100];
    int i = 0;
    fp = fopen("input1.txt", "r"); // Input file with C code
    if (!fp)
    {
        printf("Cannot open file.\n");
        return 1;
    }
    printf("Tokens:\n");
    while ((ch = fgetc(fp)) != EOF)
    {
        if (isalnum(ch) || ch == '_')
        {
            word[i++] = ch;
        }
        else
        {
            if (i > 0)
            {
                word[i] = '\0';
                i = 0;
                if (isKeyword(word))
                    printf("KEYWORD : %s\n", word);
                else if (isdigit(word[0]))
                    printf("NUMBER : %s\n", word);
                else
                    printf("IDENTIFIER : %s\n", word);
            }
            if (isOperator(ch))
            {
                printf("OPERATOR : %c\n", ch);
            }
            else if (isPunctuation(ch))
            {
                printf("PUNCTUATION : %c\n", ch);
            }
            else if (isspace(ch))
            {
                // Ignore
            }
            else if (!isalnum(ch) && ch != '\n' && ch != ' ')
            {
                printf("UNKNOWN : %c\n", ch);
            }
        }
    }
    fclose(fp);
    return 0;
}
