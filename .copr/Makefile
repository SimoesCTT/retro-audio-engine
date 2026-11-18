srpm:
	rpmbuild -bs --define "_sourcedir $(PWD)" retro-audio-engine.spec
	cp /builddir/build/SRPMS/*.src.rpm $(outdir)/ || cp ~/rpmbuild/SRPMS/*.src.rpm $(outdir)/ || cp *.src.rpm $(outdir)/ || true
