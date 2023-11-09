final: prev:

{
  libc = prev.libc.overrideAttrs ({
    patchPhase = ''
    substituteInPlace main.cpp \
    --replace "\"c\"" "\"C\""
'';
  });
}
