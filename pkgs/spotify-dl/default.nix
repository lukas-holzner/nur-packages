{ lib, rustPlatform, fetchFromGitHub, pkg-config, openssl, alsa-lib }:

rustPlatform.buildRustPackage {
  pname = "spotify-dl";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "flxo";
    repo = "spotify-dl";
    rev = "bump-librespot";
    hash = "sha256-X9+2w8Frj3qOEwTgT3dBqtvffLcmgq52BZYx0i7ZJ0Q=";
  };

  cargoHash = "sha256-ggFHiGLpEMEv7q+vRCvOw6rhcn++Jy2woNxtbF+HNHQ=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl alsa-lib ];

  meta = {
    description = "A command line utility to download songs, podcasts, playlists and albums directly from Spotify";
    homepage = "https://github.com/flxo/spotify-dl";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
  };
}
