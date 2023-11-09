final: prev:

{
  libd = prev.libd.overrideAttrs ({
    patchPhase = ''
    substituteInPlace main.cpp \
    --replace "\"d\"" "\"D\""
'';
  });
}
