srpm:
	rpmbuild -bs --define "_sourcedir $(PWD)" retro-audio-engine.spec
	cp /builddir/build/SRPMS/*.src.rpm . || cp ~/rpmbuild/SRPMS/*.src.rpm . || true
