#include "z_en_encount2.h"
#include "overlays/actors/ovl_En_Fire_Rock/z_en_fire_rock.h"
#include "vt.h"

#define FLAGS 0x00000030

#define THIS ((EnEncount2*)thisx)

typedef enum {
    /* 0x0 */ INACTIVE,
    /* 0x1 */ ACTIVE_DEATH_MOUNTAIN,
    /* 0x2 */ ACTIVE_GANONS_TOWER
} EnTiteAction;

void EnEncount2_Init(Actor* thisx, GlobalContext* globalCtx);
void EnEncount2_Update(Actor* thisx, GlobalContext* globalCtx);
void EnEncount2_Draw(Actor* thisx, GlobalContext* globalCtx);

void EnEncount2_Wait(EnEncount2* this, GlobalContext* globalCtx);
void EnEncount2_SpawnRocks(EnEncount2* this, GlobalContext* globalCtx);

void EnEncount2_ParticleInit(EnEncount2* this, Vec3f* particlePos, f32 scale);
void EnEncount2_ParticleDraw(Actor* thisx, GlobalContext* globalCtx);
void EnEncount2_ParticleUpdate(EnEncount2* this, GlobalContext* globalCtx);

extern Gfx* D_06000DE0[];

const ActorInit En_Encount2_InitVars = {
    ACTOR_EN_ENCOUNT2,
    ACTORCAT_ENEMY,
    FLAGS,
    OBJECT_EFC_STAR_FIELD,
    sizeof(EnEncount2),
    (ActorFunc)EnEncount2_Init,
    NULL,
    (ActorFunc)EnEncount2_Update,
    (ActorFunc)EnEncount2_Draw,
};

void EnEncount2_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnEncount2* this = THIS;

    if (globalCtx->sceneNum != SCENE_SPOT16) {
        this->isNotDeathMountain = true;
    }
    if (!this->isNotDeathMountain) {
        osSyncPrintf("\n\n");
        // "☆☆☆☆☆ Death Mountain Encount2 set ☆☆☆☆☆"
        osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ デスマウンテンエンカウント２セットされました ☆☆☆☆☆ %d\n" VT_RST,
                     thisx->params);
        if (LINK_IS_ADULT && (gSaveContext.eventChkInf[4] & 0x200)) { // flag for having used fire temple blue warp
            Actor_Kill(thisx);
        }
    } else {
        osSyncPrintf("\n\n");
        // "☆☆☆☆☆ Ganon Tower Escape Encount2 set ☆☆☆☆☆"
        osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ ガノンタワー脱出エンカウント２セットされました ☆☆☆☆☆ %d\n" VT_RST,
                     thisx->params);
    }
    this->actionFunc = EnEncount2_Wait;
}

void EnEncount2_Wait(EnEncount2* this, GlobalContext* globalCtx) {
    s32 pad;
    s16 quakeIndex;
    s16 spawnerState;
    Player* player = PLAYER;

    spawnerState = INACTIVE;
    if (!this->isNotDeathMountain) {
        if ((player->actor.world.pos.y > 1500.0f) && (player->actor.world.pos.x > -700.0f) &&
            (player->actor.world.pos.x < 100.0f) && (player->actor.world.pos.z < -1290.0f) &&
            (player->actor.world.pos.z > -3600.0f)) {
            spawnerState = ACTIVE_DEATH_MOUNTAIN;
        }
    } else if ((this->actor.xzDistToPlayer < 700.0f) && (Flags_GetSwitch(globalCtx, 0x37))) {
        s16 scene = globalCtx->sceneNum;
        if (((scene == SCENE_GANON_DEMO) || (scene == SCENE_GANON_FINAL) || (scene == SCENE_GANON_SONOGO) ||
             (scene == SCENE_GANONTIKA_SONOGO)) &&
            (!this->collapseSpawnerInactive)) {
            spawnerState = ACTIVE_GANONS_TOWER;
        }
    }
    switch (spawnerState) {
        case INACTIVE:
            this->isQuaking = false;
            this->envEffectsTimer--;
            if (this->envEffectsTimer <= 0) {
                this->envEffectsTimer = 0;
            }
            break;
        case ACTIVE_DEATH_MOUNTAIN:
            if ((this->deathMountainSpawnerTimer == 1) || (!this->isQuaking)) {
                quakeIndex = Quake_Add(ACTIVE_CAM, 1);
                Quake_SetSpeed(quakeIndex, 0x7FFF);
                Quake_SetQuakeValues(quakeIndex, 50, 0, 0, 0);
                Quake_SetCountdown(quakeIndex, 0x12C);
                this->isQuaking = true;
            }
        case ACTIVE_GANONS_TOWER:
            this->envEffectsTimer++;
            if (this->envEffectsTimer > 60) {
                this->envEffectsTimer = 60;
            }
            if (this->deathMountainSpawnerTimer == 0) {
                this->deathMountainSpawnerTimer = 200;
                this->numSpawnedRocks = 0;
                this->actionFunc = EnEncount2_SpawnRocks;
            }
            break;
    }
    return;
}

void EnEncount2_SpawnRocks(EnEncount2* this, GlobalContext* globalCtx) {
    Player* player = PLAYER;
    EnFireRock* spawnedRock;
    f32 tempVec1X;
    f32 tempVec1Y;
    f32 tempVec1Z;
    f32 magnitude;
    f32 tempVec2X;
    f32 tempVec2Y;
    f32 tempVec2Z;
    f32 particleScale;
    Vec3f particlePos;
    s16 spawnedRockType;
    s16 spawnerState;
    s16 maxRocks;

    this->envEffectsTimer++;
    if (this->envEffectsTimer > 60) {
        this->envEffectsTimer = 60;
    }
    spawnerState = INACTIVE;
    if (!this->isNotDeathMountain) {
        if (this->deathMountainSpawnerTimer == 0) {
            this->deathMountainSpawnerTimer = 100;
            this->actionFunc = &EnEncount2_Wait;
            return;
        }
        if ((player->actor.world.pos.y > 1500.0f) && (player->actor.world.pos.x > -700.0f) &&
            (player->actor.world.pos.x < 100.0f) && (player->actor.world.pos.z < -1290.0f) &&
            (player->actor.world.pos.z > -3860.0f)) {
            maxRocks = 2;
            spawnerState = ACTIVE_DEATH_MOUNTAIN;
        }
        Audio_PlayActorSound2(&this->actor, NA_SE_EV_VOLCANO - SFX_FLAG);
    } else if ((this->actor.xzDistToPlayer < 700.0f) && (Flags_GetSwitch(globalCtx, 0x37) != 0)) {
        s16 scene = globalCtx->sceneNum;
        if (((scene == SCENE_GANON_DEMO) || (scene == SCENE_GANON_FINAL) || (scene == SCENE_GANON_SONOGO) ||
             (scene == SCENE_GANONTIKA_SONOGO)) &&
            (!this->collapseSpawnerInactive)) {
            maxRocks = 1;
            spawnerState = ACTIVE_GANONS_TOWER;
        }
    }
    if (spawnerState != INACTIVE) {
        // Direction vector for the direction the camera is facing
        tempVec1X = globalCtx->view.lookAt.x - globalCtx->view.eye.x;
        tempVec1Y = globalCtx->view.lookAt.y - globalCtx->view.eye.y;
        tempVec1Z = globalCtx->view.lookAt.z - globalCtx->view.eye.z;

        // Normalised direction vector for the direction the camera is facing
        magnitude = sqrtf(SQ(tempVec1X) + SQ(tempVec1Y) + SQ(tempVec1Z));
        tempVec2X = tempVec1X / magnitude;
        tempVec2Y = tempVec1Y / magnitude;
        tempVec2Z = tempVec1Z / magnitude;

        // Position between 160 and 300 units ahead of camera depending on camera pitch, plus a 400 unit offset in +y
        tempVec1X = globalCtx->view.eye.x + (tempVec2X * 300.0f);
        tempVec1Y = globalCtx->view.eye.y + (tempVec2Y * 160.0f) + 400.0f;
        tempVec1Z = globalCtx->view.eye.z + (tempVec2Z * 300.0f);

        // Position between 160 and 200 units ahead of camera depending on camera pitch, plus a 400 unit offset in +y
        // (plus some random variation)
        particlePos.x = Rand_CenteredFloat(200.0f) + (globalCtx->view.eye.x + (tempVec2X * 200.0f));
        particlePos.y = Rand_CenteredFloat(50.0f) + tempVec1Y;
        particlePos.z = Rand_CenteredFloat(200.0f) + (globalCtx->view.eye.z + (tempVec2Z * 200.0f));
        particleScale = Rand_CenteredFloat(0.005f) + 0.007f;
        if (spawnerState == 1) {
            EnEncount2_ParticleInit(this, &particlePos, particleScale);
        } else if (this->particleSpawnTimer == 0) {
            EnEncount2_ParticleInit(this, &particlePos, particleScale);
            this->particleSpawnTimer = 5;
        }

        if ((this->numSpawnedRocks < maxRocks) && (this->timerBetweenRockSpawns == 0)) {
            if (spawnerState == ACTIVE_DEATH_MOUNTAIN) {
                this->timerBetweenRockSpawns = 4;
                spawnedRockType = FIRE_ROCK_SPAWNED_FALLING1;
                if ((Rand_ZeroFloat(1.99f) < 1.0f) && (LINK_IS_CHILD)) {
                    // rock spawn pos X, Z near player
                    tempVec2X = Rand_CenteredFloat(10.0f) + player->actor.world.pos.x;
                    tempVec2Z = Rand_CenteredFloat(10.0f) + player->actor.world.pos.z;
                } else {
                    if (player->linearVelocity != 0.0f) {
                        // rock spawn pos is between 300 and 600 units from the camera depending on the camera yaw.
                        // Rocks will generally spawn closer to the camera in the X axis than in the Z axis.
                        tempVec2X = Rand_CenteredFloat(200.0f) + (globalCtx->view.eye.x + (tempVec2X * 300.0f));
                        tempVec2Z = Rand_CenteredFloat(50.0f) + (globalCtx->view.eye.z + (tempVec2Z * 600.0f));
                    } else {
                        // rock spawn pos X, Z near player
                        tempVec2X = Rand_CenteredFloat(10.0f) + player->actor.world.pos.x;
                        tempVec2Z = Rand_CenteredFloat(10.0f) + player->actor.world.pos.z;
                    }
                    spawnedRockType = FIRE_ROCK_SPAWNED_FALLING2;
                }
            } else {
                this->timerBetweenRockSpawns = 50;
                spawnedRockType = FIRE_ROCK_SPAWNED_FALLING2;
                // rock spawn pos X,Z at a random position roughly 300 units ahead of camera
                tempVec2X = Rand_CenteredFloat(100.0f) + tempVec1X;
                tempVec2Z = Rand_CenteredFloat(100.0f) + tempVec1Z;
                if (Rand_ZeroFloat(3.99f) < 1.0f) {
                    // rock spawn pos X,Z at a random position near player
                    tempVec2X = Rand_CenteredFloat(70.0f) + player->actor.world.pos.x;
                    tempVec2Z = Rand_CenteredFloat(70.0f) + player->actor.world.pos.z;
                }
            }
            spawnedRock =
                (EnFireRock*)Actor_SpawnAsChild(&globalCtx->actorCtx, &this->actor, globalCtx, ACTOR_EN_FIRE_ROCK,
                                                tempVec2X, tempVec1Y, tempVec2Z, 0, 0, 0, spawnedRockType);
            if (spawnedRock != NULL) {
                spawnedRock->spawner = this;
                this->numSpawnedRocks++;
                return;
            }
            // "☆☆☆☆☆ Can't occur! ☆☆☆☆☆"
            osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 発生できません！ ☆☆☆☆☆\n" VT_RST);
            osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 発生できません！ ☆☆☆☆☆\n" VT_RST);
            osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 発生できません！ ☆☆☆☆☆\n" VT_RST);
            osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 発生できません！ ☆☆☆☆☆\n" VT_RST);
            osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ 発生できません！ ☆☆☆☆☆\n\n" VT_RST);
        }
    }
}

void EnEncount2_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnEncount2* this = THIS;
    GlobalContext* globalCtx2 = globalCtx;

    DECR(this->deathMountainSpawnerTimer);
    DECR(this->timerBetweenRockSpawns);
    DECR(this->particleSpawnTimer);
    this->actionFunc(this, globalCtx);
    EnEncount2_ParticleUpdate(this, globalCtx);
    if (!this->isNotDeathMountain) {
        this->unk17C = this->envEffectsTimer / 60.0f;
        this->unk160 = this->unk17C * -50.0f;
        globalCtx2->envCtx.unk_8C[0][0] = (s16)this->unk160 * -1.5f;
        globalCtx2->envCtx.unk_8C[0][1] = globalCtx2->envCtx.unk_8C[0][2] = this->unk160;
        this->unk168 = this->unk17C * -20.0f;
        globalCtx2->envCtx.unk_8C[1][0] = (s16)this->unk168 * -1.5f;
        globalCtx2->envCtx.unk_8C[1][1] = globalCtx2->envCtx.unk_8C[1][2] = this->unk168;
        this->unk170 = this->unk17C * -50.0f;
        globalCtx2->envCtx.unk_9E = this->unk170;
        globalCtx2->envCtx.unk_8C[2][0] = (u8)((160.0f - globalCtx2->envCtx.unk_CF[0]) * this->unk17C);
        globalCtx2->envCtx.unk_8C[2][1] = (u8)((160.0f - globalCtx2->envCtx.unk_CF[1]) * this->unk17C);
        globalCtx2->envCtx.unk_8C[2][2] = (u8)((150.0f - globalCtx2->envCtx.unk_CF[2]) * this->unk17C);
    }
}

void EnEncount2_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnEncount2* this = THIS;
    EnEncount2_ParticleDraw(&this->actor, globalCtx);
}

void EnEncount2_ParticleInit(EnEncount2* this, Vec3f* particlePos, f32 scale) {
    EnEncount2Particle* particle = this->particles;
    s16 i;

    for (i = 0; i < ARRAY_COUNT(this->particles); i++, particle++) {
        if (!particle->isAlive) {
            particle->pos = *particlePos;
            particle->scale = scale;
            particle->rot.x = 0.0f;
            particle->rot.y = 0.0f;
            particle->rot.z = 0.0f;
            particle->moveDirection.x = Rand_CenteredFloat(20.0f);
            particle->moveDirection.y = -20.0f;
            particle->moveDirection.z = Rand_CenteredFloat(20.0f);
            particle->isAlive = 1;
            break;
        }
    }
}

void EnEncount2_ParticleUpdate(EnEncount2* this, GlobalContext* globalCtx) {
    s16 i;
    EnEncount2Particle* particle = this->particles;
    Player* player = PLAYER;
    Vec3f targetPos;

    for (i = 0; i < ARRAY_COUNT(this->particles); particle++, i++) {
        if (particle->isAlive) {
            particle->rot.x += Rand_ZeroOne() * 500.0f;
            particle->rot.y += Rand_ZeroOne() * 500.0f;
            particle->rot.z += Rand_ZeroOne() * 500.0f;
            targetPos.x = particle->pos.x + particle->moveDirection.x;
            targetPos.y = particle->pos.y + particle->moveDirection.y;
            targetPos.z = particle->pos.z + particle->moveDirection.z;
            Math_ApproachF(&particle->pos.x, targetPos.x, 0.3f, 30.0f);
            Math_ApproachF(&particle->pos.y, targetPos.y, 0.8f, 250.0f);
            Math_ApproachF(&particle->pos.z, targetPos.z, 0.3f, 30.0f);
            Math_ApproachF(&particle->moveDirection.y, -20.0f, 0.9f, 1.0f);
            if (globalCtx->sceneNum != SCENE_SPOT16) {
                if (particle->pos.y < (player->actor.floorHeight - 50.0f)) {
                    particle->isAlive = 0;
                }
            } else if (particle->pos.y < 1500.0f) {
                particle->isAlive = 0;
            }
        }
    }
}

void EnEncount2_ParticleDraw(Actor* thisx, GlobalContext* globalCtx) {
    EnEncount2* this = THIS;
    EnEncount2Particle* particle = this->particles;
    GraphicsContext* gfxCtx = globalCtx->state.gfxCtx;
    s16 i;
    s32 objBankIndex;

    OPEN_DISPS(gfxCtx, "../z_en_encount2.c", 642);
    objBankIndex = Object_GetIndex(&globalCtx->objectCtx, OBJECT_EFC_STAR_FIELD);
    if (objBankIndex >= 0) {
        gDPPipeSync(POLY_XLU_DISP++);
        gSPSegment(POLY_OPA_DISP++, 0x06, globalCtx->objectCtx.status[objBankIndex].segment);
        for (i = 0; i < ARRAY_COUNT(this->particles); particle++, i++) {
            if (particle->isAlive) {
                Matrix_Translate(particle->pos.x, particle->pos.y, particle->pos.z, 0);
                Matrix_RotateX(particle->rot.x * (M_PI / 180), 1);
                Matrix_RotateY(particle->rot.y * (M_PI / 180), 1);
                Matrix_RotateZ(particle->rot.z * (M_PI / 180), 1);
                Matrix_Scale(particle->scale, particle->scale, particle->scale, 1);
                gDPSetPrimColor(POLY_OPA_DISP++, 0, 0, 255, 155, 55, 255);
                gDPSetEnvColor(POLY_OPA_DISP++, 155, 255, 55, 255);
                gSPMatrix(POLY_OPA_DISP++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_en_encount2.c", 669),
                          G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
                gSPDisplayList(POLY_OPA_DISP++, D_06000DE0);
            }
        }
    }
    CLOSE_DISPS(gfxCtx, "../z_en_encount2.c", 678);
}
