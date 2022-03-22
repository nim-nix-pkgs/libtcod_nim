{
  description = ''Wrapper of the libtcod library for the Nim language.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-libtcod_nim-v0_98.flake = false;
  inputs.src-libtcod_nim-v0_98.owner = "Vladar4";
  inputs.src-libtcod_nim-v0_98.ref   = "v0_98";
  inputs.src-libtcod_nim-v0_98.repo  = "libtcod_nim";
  inputs.src-libtcod_nim-v0_98.type  = "github";
  
  inputs."sdl1".owner = "nim-nix-pkgs";
  inputs."sdl1".ref   = "master";
  inputs."sdl1".repo  = "sdl1";
  inputs."sdl1".dir   = "";
  inputs."sdl1".type  = "github";
  inputs."sdl1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."sdl1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-libtcod_nim-v0_98"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-libtcod_nim-v0_98";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}