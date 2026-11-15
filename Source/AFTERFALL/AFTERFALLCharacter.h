#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "AFTERFALLCharacter.generated.h"

class UCameraComponent;
class USpringArmComponent;

UCLASS()
class AFTERFALL_API AAFTERFALLCharacter : public ACharacter
{
    GENERATED_BODY()

public:
    AAFTERFALLCharacter();

protected:
    virtual void SetupPlayerInputComponent(UInputComponent* PlayerInputComponent) override;

private:
    void MoveForward(float Value);
    void MoveRight(float Value);
    void Turn(float Value);
    void LookUp(float Value);

    UPROPERTY(VisibleAnywhere, Category = "Camera")
    TObjectPtr<USpringArmComponent> CameraBoom;

    UPROPERTY(VisibleAnywhere, Category = "Camera")
    TObjectPtr<UCameraComponent> FollowCamera;
};
