Name:           retro-audio-engine
Version:        0.1.0
Release:        1%{?dist}
Summary:        High-performance zero-allocation Rust retro sound chip emulation workspace

License:        MIT
URL:            https://github.com/SimoesCTT/retro-audio-workspace
Source0:        %{name}-%{version}.tar.gz
Source1:        %{name}-%{version}-vendor.tar.xz

BuildRequires:  cargo-rpm-macros
BuildRequires:  cmake
BuildRequires:  clang-devel
BuildRequires:  rust-bindgen-devel
BuildRequires:  game-music-emu-devel
BuildRequires:  zlib-devel
# Note: alsa-lib-devel is usually needed by cpal
BuildRequires:  alsa-lib-devel

%description
A high-performance, zero-allocation Rust audio workspace designed to rescue,
wrap, and repurpose unmaintained C/C++ retro sound chip emulation libraries
(libgme and libVGM) on Fedora Linux.

%prep
%autosetup -c -n %{name}-%{version} -a1
%cargo_prep -v vendor

# Do NOT call %cargo_generate_buildrequires when vendoring

%build
%cargo_build
# Optional but recommended for proper bundled Provides
%cargo_vendor_manifest

%install
install -Dpm 0755 target/rpm/play_live %{buildroot}%{_bindir}/retro-play-live
install -Dpm 0755 target/rpm/full_test %{buildroot}%{_bindir}/retro-full-test

%files
%license LICENSE
%license cargo-vendor.txt
%doc README.md
%{_bindir}/retro-play-live
%{_bindir}/retro-full-test

%changelog
* Thu Nov 19 2026 A. Simões <amexsimoes@gmail.com> - 0.1.0-1
- Initial packaging for Fedora Copr (vendored)
