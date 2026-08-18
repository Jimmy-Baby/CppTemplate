project "ProjectName"
	kind "ConsoleApp"
	language "C++"
	staticruntime "off"
	cppdialect "C++23"

	files {"src/**.h", "src/**.cpp", "src/**.inl"}

	includedirs
	{
		"../vendor/ExampleLib",
	}
	
	--externalincludedirs {}
	
	--pchheader "CorePch.h"
	--pchsource "src/CorePch.cpp"

	links {}

	targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
	objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")