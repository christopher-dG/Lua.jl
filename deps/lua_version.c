#include <lua.h>
#include <stdio.h>

int main() {
    printf("%d\n", (int)*lua_version(NULL));
}
