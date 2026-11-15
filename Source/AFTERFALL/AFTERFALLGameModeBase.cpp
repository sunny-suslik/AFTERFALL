#include "AFTERFALLGameModeBase.h"

#include "AFTERFALLCharacter.h"

AAFTERFALLGameModeBase::AAFTERFALLGameModeBase()
{
    DefaultPawnClass = AAFTERFALLCharacter::StaticClass();
}
