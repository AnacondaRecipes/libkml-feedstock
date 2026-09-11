set CMAKE_POLICY_VERSION_MINIMUM=3.5
powershell -NoProfile -ExecutionPolicy Bypass -File "%RECIPE_DIR%\fix_win_cc.ps1"
if errorlevel 1 exit 1
mkdir build
cd build

cmake -G "NMake Makefiles" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_BUILD_TYPE=Release ^
      %SRC_DIR%
if errorlevel 1 exit 1

ctest
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
