$ErrorActionPreference = "Stop"
# Replacement for empty_char.patch, which fails to apply on Windows because of a
# conda-build patch line-ending issue.
$f = Join-Path $env:SRC_DIR "src\kml\base\file_win32.cc"
$c = [System.IO.File]::ReadAllText($f)
$c = $c.Replace("std::wstring wstr(str.length(), L'');", "std::wstring wstr(str.length(), L'\0');")
[System.IO.File]::WriteAllText($f, $c)
