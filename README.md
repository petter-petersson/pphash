# pphash
simple hash store written in c

Based largely on https://gist.github.com/tonious/1377667
 - added destroy method 
 - addedd support for generic value obj
 - added tests

Running tests:

```
$> make test
$> valgrind --tool=memcheck --leak-check=yes ./pphash_test

```
