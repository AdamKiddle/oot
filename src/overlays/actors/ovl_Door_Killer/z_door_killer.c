#include "z_door_killer.h"

#define FLAGS 0x00000010

#define THIS ((DoorKiller*)thisx)



void DoorKiller_Init(Actor* thisx, GlobalContext* globalCtx);
void DoorKiller_Destroy(Actor* thisx, GlobalContext* globalCtx);
void DoorKiller_Update(Actor* thisx, GlobalContext* globalCtx);

//prototypes
void func_80995D6C();
void func_80995A50();
void func_809958E4();
void func_80995318();

extern FlexSkeletonHeader D_06001BC8;

extern temp_struct D_80996010[];

extern UNK_TYPE D_80996014;

extern ColliderCylinderInit D_80995FB0;

extern ColliderJntSphInit D_80996000;

/*
const ActorInit Door_Killer_InitVars = {
    ACTOR_DOOR_KILLER,
    ACTORTYPE_BG,
    FLAGS,
    OBJECT_DOOR_KILLER,
    sizeof(DoorKiller),
    (ActorFunc)DoorKiller_Init,
    (ActorFunc)DoorKiller_Destroy,
    (ActorFunc)DoorKiller_Update,
    NULL,
};
*/

void DoorKiller_Init(Actor *thisx, GlobalContext *globalCtx) {
    DoorKiller *this = THIS;
    f32 sp50;
    temp_struct *phi_s1;
    s32 phi_s0;
    s32 temp_v0;
    f32 sp40;
    GlobalContext *globalCtx2 = globalCtx;
    
    for (temp_v0 = -1, phi_s0 = 0; temp_v0 < 0 ; phi_s0++){
        temp_v0 = Object_GetIndex(&globalCtx2->objectCtx, D_80996010[phi_s0].objectID);
        this->unk21D = phi_s0;
    }

    osSyncPrintf((const char *) "bank_ID = %d\n", temp_v0);
    osSyncPrintf((const char *) "status = %d\n", this->unk21D);
    this->unk21C = temp_v0;
    this->unk214 = D_80996010[this->unk21D].seg_address;
    ActorShape_Init(&thisx->shape, 0.0f, NULL, 0.0f);
    Actor_SetScale(thisx, 0.01f);

    this->unk191 = this->unk190 = this->unk218 = this->unk21A = 0;

    switch ((u16)(thisx->params & 0xFF)){
        case 0:
            SkelAnime_InitFlex(globalCtx2, &this->unk14C, &D_06001BC8, NULL, &this->unk192, &this->unk192, 9);
            this->unk280 = &func_80995D6C;
            func_80995D6C(thisx, globalCtx2);
            this->unk198 = this->unk19C = 0x4000;
            Collider_InitCylinder(globalCtx, &this->collider);
            Collider_SetCylinder(globalCtx, &this->collider, thisx, &D_80995FB0);
            Collider_InitJntSph(globalCtx, &this->unk220);
            Collider_SetJntSph(globalCtx, &this->unk220, thisx, &D_80996000, &this->unk240);
            this->unk220.list[0].dim.worldSphere.radius = 80;
            this->unk220.list[0].dim.worldSphere.center.x = (s16)thisx->posRot.pos.x;
            this->unk220.list[0].dim.worldSphere.center.y = (s16)thisx->posRot.pos.y + 50;
            this->unk220.list[0].dim.worldSphere.center.z = (s16)thisx->posRot.pos.z;
            if ((((thisx->params >> 8) & 0x3F) != 0x3F) && Flags_GetSwitch(globalCtx, ((thisx->params >> 8) & 0x3F))) {
                Actor_Kill(thisx);
                return;
            }
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            this->unk280 = &func_80995D6C;
            func_80995D6C(thisx, globalCtx);
            thisx->gravity = -0.6f;
            thisx->minVelocityY = -6.0f;
            sp50 = Rand_CenteredFloat(8.0f);
            thisx->velocity.z = Rand_ZeroFloat(8.0f);
            sp40 = Math_CosS(thisx->posRot.rot.y);
            thisx->velocity.x = (Math_SinS(thisx->posRot.rot.y) * thisx->velocity.z) + (sp40 * sp50);
            sp40 = Math_SinS(thisx->posRot.rot.y);
            thisx->velocity.z = (Math_CosS(thisx->posRot.rot.y) * thisx->velocity.z) + (-sp40 * sp50);
            thisx->velocity.y = Rand_ZeroFloat(4.0f) + 4.0f;
            thisx->posRot.rot.x = Rand_CenteredFloat(4096.0f);
            thisx->posRot.rot.y = Rand_CenteredFloat(4096.0f);
            thisx->posRot.rot.z = Rand_CenteredFloat(4096.0f);
            this->unk21A = (u16)80;
            break;
    }
}

void DoorKiller_Destroy(Actor *thisx, GlobalContext *globalCtx) {
    DoorKiller *this = THIS;

    if ((thisx->params & 0xFF) == 0) {
        Collider_DestroyCylinder(globalCtx, &this->collider);
        Collider_DestroyJntSph(globalCtx, &this->unk220);
    }
}

void func_80995020(Actor *thisx, GlobalContext *globalCtx) {
    Actor_Spawn(&globalCtx->actorCtx, globalCtx, 0x1C1, thisx->posRot.pos.x, thisx->posRot.pos.y + 9.0f, thisx->posRot.pos.z, thisx->shape.rot.x, thisx->shape.rot.y, thisx->shape.rot.z, 1);
    Actor_Spawn(&globalCtx->actorCtx, globalCtx, 0x1C1, thisx->posRot.pos.x + 7.88f, thisx->posRot.pos.y + 39.8f, thisx->posRot.pos.z, thisx->shape.rot.x, thisx->shape.rot.y, thisx->shape.rot.z, 2);
    Actor_Spawn(&globalCtx->actorCtx, globalCtx, 0x1C1, thisx->posRot.pos.x - 15.86f, thisx->posRot.pos.y + 61.98f, thisx->posRot.pos.z, thisx->shape.rot.x, thisx->shape.rot.y, thisx->shape.rot.z, 3);
    Actor_Spawn(&globalCtx->actorCtx, globalCtx, 0x1C1, thisx->posRot.pos.x + 3.72f, thisx->posRot.pos.y + 85.1f, thisx->posRot.pos.z, thisx->shape.rot.x, thisx->shape.rot.y, thisx->shape.rot.z, 4);
}

void func_809951C4(Actor *thisx, GlobalContext *globalCtx) {
    DoorKiller *this = THIS;
    
    thisx->velocity.y = thisx->velocity.y + thisx->gravity;
    if (thisx->velocity.y < thisx->minVelocityY) {
        thisx->velocity.y = thisx->minVelocityY;
    }

    thisx->velocity.x *= 0.98f;
    thisx->velocity.z *= 0.98f;
    thisx->shape.rot.x += thisx->posRot.rot.x;
    thisx->shape.rot.y += thisx->posRot.rot.y;
    thisx->shape.rot.z += thisx->posRot.rot.z;
    
    if (this->unk21A != 0) {
        this->unk21A--;
    } else {
        Actor_Kill(thisx);
    }
    func_8002D7EC(thisx);
}

s32 func_80995284(Actor* thisx, GlobalContext* globalCtx){
    DoorKiller* this = THIS;
    if (((this->collider.base.acFlags & 2) != 0) && (this->collider.body.acHitItem != NULL)) {
        return 1;
    }
    return 0;
}

void func_809952B8(DoorKiller *this, GlobalContext *globalCtx) {
    Collider_CylinderUpdate(&this->actor, &this->collider);
    CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->collider.base);
    CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &this->unk220.base);
}

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995318.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995368.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995518.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_809958E4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995A50.s")

void func_80995A84(Actor *thisx, GlobalContext *globalCtx) {
    Player *player;
    Vec3f sp30;
    s32 temp_v0;
    s16 angleToFacingPlayer;
    DoorKiller *this = THIS;

    player = PLAYER;
    func_8002DBD0(thisx, &sp30, &player->actor.posRot.pos);
    if (this->unk191 != 0) {
        this->unk280 = &func_80995A50;
        this->unk21A = 10;
        this->unk191 = 0;
        return;
    }
    if (func_80995284(thisx, globalCtx) != 0) {
        temp_v0 = this->collider.body.acHitItem->toucher.flags;
        if ((temp_v0 & 0x1FFA6) != 0) {
            this->unk21A = (u16)0x10;
            this->unk280 = &func_809958E4;
        } else if ((temp_v0 & 0x48) != 0) {
            func_80995020(thisx, globalCtx);
            this->unk280 = &func_80995318;
            Audio_PlaySoundAtPosition(globalCtx, &thisx->posRot.pos, 0x14, (u16)0x39DDU);
        }
    } else {
        if (Actor_GetCollidedExplosive(globalCtx, &this->unk220.base) != 0) {
            func_80995020(thisx, globalCtx);
            this->unk280 = &func_80995318;
            Audio_PlaySoundAtPosition(globalCtx, &thisx->posRot.pos, 0x14, (u16)0x39DDU);
        } else {
            if ((Player_InCsMode(globalCtx) == 0) && (fabsf(sp30.y) < 20.0f) && (fabsf(sp30.x) < 20.0f) && (sp30.z < 50.0f) && (sp30.z > 0.0f)) {
                angleToFacingPlayer = player->actor.shape.rot.y - thisx->shape.rot.y;
                if (sp30.z > 0.0f) {
                    angleToFacingPlayer = 0x8000 - angleToFacingPlayer;
                }
                if (ABS(angleToFacingPlayer) < 0x3000) {
                    player->doorType = 3;
                    player->doorDirection = (sp30.z >= 0.0f) ? 1.0f : -1.0f;
                    player->doorActor = thisx;
                }
            }
        }
    }
    func_809952B8(this, globalCtx);
}

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995CDC.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995D6C.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/DoorKiller_Update.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995E40.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995EC4.s")

#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Door_Killer/func_80995F1C.s")
