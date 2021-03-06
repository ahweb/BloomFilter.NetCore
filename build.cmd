set artifacts=%~dp0artifacts

if exist %artifacts%  rd /q /s %artifacts%

set /p ver=<VERSION

dotnet restore src/BloomFilter
dotnet restore src/BloomFilter.Redis

dotnet pack src/BloomFilter -c release -p:Ver=%ver% -o %artifacts%
dotnet pack src/BloomFilter.Redis -c release  -p:Ver=%ver% -o %artifacts%

pause