using UnrealBuildTool;
using System.Collections.Generic;

public class AFTERFALLEditorTarget : TargetRules
{
    public AFTERFALLEditorTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Editor;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        IncludeOrderVersion = EngineIncludeOrderVersion.Unreal5_0;
        ExtraModuleNames.Add("AFTERFALL");
    }
}
