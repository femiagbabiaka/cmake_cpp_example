final: prev:

{
  liba = prev.liba.overrideAttrs (old: {
    patchPhase = ''
    substituteInPlace main.cpp \
    --replace "\"a\"" "\"A\"" \
    --replace "std::tolower" ""
'';
  });
}
