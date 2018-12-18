#include <lua.h>
#include <stdio.h>

int main() {
  printf("const LUA_EXTRASPACE     = %lu" "\n"
         "const LUA_TNONE          = %d"  "\n"
         "const LUA_TNIL           = %d"  "\n"
         "const LUA_TBOOLEAN       = %d"  "\n"
         "const LUA_TLIGHTUSERDATA = %d"  "\n"
         "const LUA_TTABLE         = %d"  "\n"
         "const LUA_TFUNCTION      = %d"  "\n"
         "const LUAI_MAXSTACK      = %d"  "\n"
         "const LUA_REGISTRYINDEX  = %d"  "\n"
         "const LUA_RIDX_GLOBALS   = %d"  "\n",
         LUA_EXTRASPACE, LUA_TNONE, LUA_TNIL, LUA_TBOOLEAN, LUA_TLIGHTUSERDATA,
         LUA_TTABLE, LUA_TFUNCTION, LUAI_MAXSTACK, LUA_REGISTRYINDEX,
         LUA_RIDX_GLOBALS);
}
