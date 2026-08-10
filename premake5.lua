
outputdir = "%{cfg.buildcfg}_%{cfg.system}_%{cfg.architecture}"

IncludeDirs = {}
LibDirs = {}

-- Replace None with Name and paths

workspace "None"
    architecture "x64"
    startproject "None"

    configurations 
    {
        "Debug",
        "Release"
    }

project "None"
    location "%{wks.location}/None"
    targetname "None"

    kind "None"
    language "C++"
    cppdialect "C++20"
    systemversion "latest"
    multiprocessorcompile "On"

    targetdir (".bin/" .. outputdir .. "/%{prj.name}")
    objdir (".bin/.int/" .. outputdir .. "/%{prj.name}")
    debugdir (".bin/.int/" .. outputdir .. "/%{prj.name}")

	pchheader "None"
	pchsource "%{prj.name}/src/Private/None.cpp"

	buildoptions 
	{ 
		"/utf-8" 
	}
    
    files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",

	}

	includedirs
	{
		"%{prj.name}/src/Public",
	}

	libdirs
	{
		
	}


	links
    {
		
    }

    filter "configurations:Debug"
		defines "NONE_DEBUG"
		optimize "Off"
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		defines "NONE_RELEASE"
		optimize "On"
		symbols "On"
		runtime "Release"

	filter "system:windows"
		defines
		{
			"PLATFORM_WINDOWS",
		}
	
	filter "system:linux"
		defines 
		{ 
			"PLATFORM_LINUX" 
		}

	