rd /s build

set CC="C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Tools\MSVC\14.10.25017\bin\HostX64\x64\cl.exe"
set CXX="C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Tools\MSVC\14.10.25017\bin\HostX64\x64\cl.exe"
set MSBuild="C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBuild.exe"
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" amd64

meson --backend vs2017 --buildtype release ^
-Dispc_native_only=false ^
-Dpopcnt=false ^
-Dcudnn=true ^
-Dopencl=false ^
-Dcudnn_libdirs="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.2\lib\x64" ^
-Dcudnn_include="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.2\include" ^
-Ddefault_library=static build/

pause

cd build

%MSBuild%  ^
/p:Configuration=Release ^
/p:Platform=x64 ^
/p:PreferredToolArchitecture=x64 lc0.sln ^
/filelogger