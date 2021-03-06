#include "structures.h"

id_token *create_token(char *id, int line, int col);
table_element* insert_symbol(table_element **symtab, table_element* new_symbol);
table_element *insert_func(table_element **symtab, id_token* id, is_parameter * ip, parameter_type return_type, is_func_dec*);
table_element *insert_var(table_element **symtab, id_token* id, parameter_type return_type);
table_element *search_symbol(table_element *symtab, char *str);
table_element * search_func(table_element * , char *);
table_element * search_var(table_element *, char*);
void symbol_print_type(parameter_type type);
void print_symbol_tables(is_program* ip);
void print_global_table(table_element *symtab);
void print_function_table(table_element *symtab);
table_element* get_function_table(is_program* ip, char* str);
is_func_dec * get_function_declaration(is_program* ip, char* str);
void print_never_used_errors (table_element* symtab);
next_oper* create_next_oper(int line, int col);
location * create_location(int line, int col);

