set CIRCLE_TAG=1.0.1
set LOCAL_NUGET_DIR=.\out
set API_KEY=oy2p5wfs4bbmnay2lvcaw2mxlbfarmsuvg24jwakir6nre

goto ka

dotnet build mylib.sln
dotnet test mylib.sln

dotnet pack ./kousay101.lib/kousay101.lib.csproj --configuration debug -p:IncludeSymbols=true -p:SymbolPackageFormat=snupkg -p:PackageVersion=%CIRCLE_TAG% -o:%LOCAL_NUGET_DIR%

dotnet nuget push .\out\kousay101.lib.%CIRCLE_TAG%.nupkg --api-key %API_KEY% --source https://api.nuget.org/v3/index.json

:ka
dotnet nuget push .\out\kousay101.lib.%CIRCLE_TAG%.snupkg --api-key %API_KEY% --source https://api.nuget.org/v3/index.json