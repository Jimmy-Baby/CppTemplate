workspace "ProjectName"
	architecture "x64"
	configurations { "Debug", "Release", "Dist" }
	startproject "App"
	externalanglebrackets "On"
	externalwarnings "Off"

	filter "system:windows"
		buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }
		defines {}
		
	filter { "system:windows", "action:vs*" }
		multiprocessorcompile "On"

    filter "configurations:Debug"
        defines { "DEBUG" }
		runtime "Debug"
		optimize "Off"
		symbols "Full"

    filter "configurations:Release"
        defines { "NDEBUG" }
		runtime "Release"
		optimize "On"
		symbols "On"
		
	filter "configurations:Distribution"
        defines { "NDEBUG" }
		runtime "Release"
		optimize "Full"
		symbols "On"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Build-External.lua"
include "ProjectName/Build-ProjectName.lua"