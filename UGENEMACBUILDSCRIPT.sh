# Works with MacOS 10.13.6, gfortran 6.3.0 (https://github.com/fxcoudert/gfortran-for-macOS/releases/tag/6.3), gcc --version:
# Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
# Apple LLVM version 10.0.0 (clang-1000.11.45.5)
# Target: x86_64-apple-darwin17.7.0
# Thread model: posix
# InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

# These command should be replaced by Make/CMake

# boxplot_ng ct_boxplot_ng overlay_boxplot_ng sir_graph are C lang binaries, so there was no problem with them build, just use what generated from ordinary `./configure --prefix=... && make && make install`

mkdir build
cd build

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o distance-distance.o ../src/distance.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o distance-bpin.o ../src/bpin.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o distance-bpsrch.o ../src/bpsrch.f
ld -o distance -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a distance-distance.o distance-bpin.o distance-bpsrch.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o ct2bp-ct2bp.o ../src/ct2bp.f
ld -o ct2bp -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a ct2bp-ct2bp.o


gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o ct_compare-ct_compare.o ../src/ct_compare.f
ld -o ct_compare -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a ct_compare-ct_compare.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o efn-efn.o ../src/efn.f
ld -o efn -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a efn-efn.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o newtemp-newtemp.o ../src/newtemp.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o newtemp-ion.o ../src/ion.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o newtemp-dc.o ../src/dc.f
ld -o newtemp -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a newtemp-newtemp.o newtemp-ion.o newtemp-dc.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o scorer-scorer.o ../src/scorer.f
ld -o scorer -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a scorer-scorer.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o auxgen-auxgen.o ../src/auxgen.f
ld -o auxgen -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a auxgen-auxgen.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o sav2plot-sav2plot.o ../src/sav2plot.f
ld -o sav2plot -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a sav2plot-sav2plot.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o sav2p_num-sav2p-num.o ../src/sav2p-num.f
ld -o sav2p_num -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a sav2p_num-sav2p-num.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o h_num-h-num.o ../src/h-num.f
ld -o h_num -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a h_num-h-num.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o ss_count-ss-count.o ../src/ss-count.f
ld -o ss_count -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a ss_count-ss-count.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o add_dHdSTm-add-dHdSTm.o ../src/add-dHdSTm.f
ld -o add_dHdSTm -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a add_dHdSTm-add-dHdSTm.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-main.o ../src/main.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-rna.o ../src/rna.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-misc.o ../src/misc.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-efiles.o ../src/efiles.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-sort.o ../src/sort.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-dc.o ../src/dc.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-bits-gnu.o ../src/bits-gnu.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-formid.o ../src/formid.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o nafold-multid.o ../src/multid.f
ld -o nafold -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a nafold-main.o nafold-rna.o nafold-misc.o nafold-efiles.o nafold-sort.o nafold-dc.o nafold-bits-gnu.o nafold-formid.o nafold-multid.o

gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o quikfold-quik.o ../src/quik.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o quikfold-rna-quik.o ../src/rna-quik.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o quikfold-misc-quik.o ../src/misc-quik.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o quikfold-dc.o ../src/dc.f
gfortran -C -O3 -Wall -fno-automatic -ffixed-line-length-none  -static-libgfortran -static-libgcc -mmacosx-version-min=10.12   -c -o quikfold-multid.o ../src/multid.f
ld -o quikfold -no_compact_unwind -arch x86_64 -macosx_version_min 10.12 -lSystem /usr/local/gfortran/lib/libgfortran.a /usr/local/gfortran/lib/libquadmath.a /usr/local/gfortran/lib/gcc/x86_64-apple-darwin16/6.3.0/libgcc.a quikfold-quik.o quikfold-rna-quik.o quikfold-misc-quik.o quikfold-dc.o quikfold-multid.o

