#include <lua.h>
#include <lauxlib.h>
#include <stdio.h>

int main() {
  printf("const LUAI_MAXSTACK      = %d"  "\n"
         "const LUAL_BUFFERSIZE    = %d"  "\n"
         "const LUAL_NUMSIZES      = %lu" "\n"
         "const LUA_EXTRASPACE     = %lu" "\n"
         "const LUA_IDSIZE         = %d"  "\n"
         "const LUA_MULTRET        = %d"  "\n"
         "const LUA_REGISTRYINDEX  = %d"  "\n"
         "const LUA_RIDX_GLOBALS   = %d"  "\n"
         "const LUA_TBOOLEAN       = %d"  "\n"
         "const LUA_TFUNCTION      = %d"  "\n"
         "const LUA_TLIGHTUSERDATA = %d"  "\n"
         "const LUA_TNIL           = %d"  "\n"
         "const LUA_TNONE          = %d"  "\n"
         "const LUA_TTABLE         = %d"  "\n"
         "const LUA_VERSION_NUM    = %d"  "\n",
         LUAI_MAXSTACK, LUAL_BUFFERSIZE, LUAL_NUMSIZES, LUA_EXTRASPACE,
         LUA_IDSIZE, LUA_MULTRET, LUA_REGISTRYINDEX, LUA_RIDX_GLOBALS,
         LUA_TBOOLEAN, LUA_TFUNCTION, LUA_TLIGHTUSERDATA, LUA_TNIL, LUA_TNONE,
         LUA_TTABLE, LUA_VERSION_NUM);
}
