{ lib, rustPlatform, fetchFromGitHub, pkg-config, openssl, alsa-lib }:

rustPlatform.buildRustPackage {
  pname = "spotify-dl";
  version = "0.9.2";

  src = fetchFromGitHub {
    owner = "flxo";
    repo = "spotify-dl";
    rev = "e0dbe12c3e53b211bc6834ce27bf8a996b1905e2"; # bump-librespot branch head
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
