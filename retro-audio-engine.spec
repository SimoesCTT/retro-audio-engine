Name:           retro-audio-engine
Version:        0.1.0
Release:        1%{?dist}
Summary:        High-performance zero-allocation Rust retro sound-chip emulator workspace

License:        MIT
URL:            https://github.com/SimoesCTT/retro-audio-workspace
Source0:        %{name}-%{version}.tar.gz
Source1:        %{name}-%{version}-vendor.tar.xz

BuildRequires:  cargo-rpm-macros >= 24
BuildRequires:  cmake
BuildRequires:  clang-devel
BuildRequires:  rust-bindgen-devel
BuildRequires:  game-music-emu-devel
BuildRequires:  zlib-devel
BuildRequires:  alsa-lib-devel
BuildRequires:  pkgconf-pkg-config
BuildRequires:  gcc-c++

Requires:       game-music-emu
Requires:       alsa-lib
Requires:       zlib

%description
A high-performance, zero-allocation Rust audio workspace designed to rescue,
wrap, and repurpose unmaintained C/C++ retro sound-chip emulation
libraries (libgme and libVGM) on Fedora Linux.

%package tests
Summary:        Test executables for %{name}
Requires:       %{name}%{?_isa} = %{version}-%{release}

%description tests
Contains internal test binaries and verification tools for %{name}.

%prep
%autosetup -c -n %{name}-%{version} -a1
%cargo_prep -v vendor

%build
%cargo_build
# Debug safety check: print found executables in target logs during build
find target -type f -executable -print

%install
# Automatically locate built binaries regardless of profile subpath (release/rpm)
install -Dpm 0755 $(find target -type f -name play_live -print -quit) %{buildroot}%{_bindir}/retro-play-live
install -Dpm 0755 $(find target -type f -name full_test -print -quit) %{buildroot}%{_bindir}/retro-full-test

%cargo_vendor_manifest

%files
%license LICENSE
%license cargo-vendor.txt
%doc README.md
%{_bindir}/retro-play-live

%files tests
%{_bindir}/retro-full-test

%changelog
* Wed Nov 18 2026 A. Simões <amexsimoes@gmail.com> - 0.1.0-1
- Initial packaging for Fedora Copr (vendored)
- Split test utilities into a separate retro-audio-engine-tests subpackage
