solution "lunasvg"
  configurations { "Debug", "Release" }
  architecture "x86_64"
  language "C++"
  cppdialect "C++17"
  location "build"
  targetdir "out"
  floatingpoint "Fast"
  rtti "Off"

  files { "source/**", "3rdparty/**" }

  includedirs { 
    "3rdparty/stb", 
    "3rdparty/plutovg", 
    "3rdparty/software", 
    "source/geometry", 
    "source/graphics", 
    "source", 
    "include", 
    "contrib",
  }

  configuration "Debug"
    defines { "_DEBUG" }
    targetsuffix ("_d")
    symbols "On"

  configuration "Release"
    defines { "NDEBUG" }
    optimize "Speed"

  configuration "vs2019"
    defines { "_WIN32", "_WINDOWS" }
    defines { "_CRT_SECURE_NO_WARNINGS" }
    flags { "MultiProcessorCompile" }

  configuration "vs2019 and Release"
    flags { "LinkTimeOptimization" }

  project "shared"
    location "build"
    targetname ("lunasvg")
    defines { "LUNASVG_EXPORTS", "LUNASVG_SHARED" }
    targetdir ("out/shared")
    kind ("SharedLib")

  project "static"
    location "build"
    targetname ("lunasvg")
    targetdir ("out/static")
    kind ("StaticLib")
