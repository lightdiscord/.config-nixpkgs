{ stdenv, writeText }:

let
  generic = builtins.readFile ./.vim/general.vim;
in

''
  ${generic}
''
