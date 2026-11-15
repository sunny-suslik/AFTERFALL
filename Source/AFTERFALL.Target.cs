using UnrealBuildTool;
using System.Collections.Generic;

public class AFTERFALLTarget : TargetRules
{
    public AFTERFALLTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Game;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        IncludeOrderVersion = EngineIncludeOrderVersion.Unreal5_0;
        ExtraModuleNames.Add("AFTERFALL");
    }
}
