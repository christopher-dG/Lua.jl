#include <lua.h>
#include <lauxlib.h>
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
         "const LUA_RIDX_GLOBALS   = %d"  "\n"
         "const LUA_VERSION_NUM    = %d"  "\n"
         "const LUA_MULTRET        = %d"  "\n"
         "const LUAL_NUMSIZES      = %lu" "\n"
         "const LUAL_BUFFERSIZE    = %d"  "\n",
         LUA_EXTRASPACE, LUA_TNONE, LUA_TNIL, LUA_TBOOLEAN, LUA_TLIGHTUSERDATA,
         LUA_TTABLE, LUA_TFUNCTION, LUAI_MAXSTACK, LUA_REGISTRYINDEX,
         LUA_RIDX_GLOBALS, LUA_VERSION_NUM, LUA_MULTRET, LUAL_NUMSIZES,
         LUAL_BUFFERSIZE);
}
