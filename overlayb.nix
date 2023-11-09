final: prev:

{
  libb = prev.libb.overrideAttrs(old: {
    patchPhase = ''
    substituteInPlace main.cpp \
    --replace "\"b\"" "\"B\""
'';
  });
}
