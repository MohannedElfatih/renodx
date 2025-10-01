/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <deps/imgui/imgui.h>
#include <embed/shaders.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/date.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/random.hpp"
#include "./shared.h"

namespace {

float unityTonemapper = 0.f; // 1 = none, 2 = neutral/sapphire/custom, 3 = ACES
float g_use_swapchain_proxy = 0.f;
float countMid = 0.f;
float countOffset = 0.f;
float count2Mid = 0.f;
float count2Offset = 0.f;
float gammaSpace = 0.f;
bool gammaSpaceLock = false;
float blitCopyHack = 0.f;
float blitCopyCheck = 0.f;
bool forceDetect = false;
float FSRcheck = 0.f;
bool lutSampler = false;
bool lutBuilder = false;
bool sneakyBuilder = false;
float InternalLutCheck = 0.f;

ShaderInjectData shader_injection;

bool Fsr1(reshade::api::command_list* cmd_list) {
  FSRcheck = 1.f;
  return true;
}
  #define fsr1NoReplace(value)                                  \
  {                                                               \
      value,                                                      \
      {                                                           \
          .crc32 = value,                                         \
          .on_drawn = [](auto cmd_list) {                         \
            FSRcheck = 1.f; return;            \
          },                                                      \
      },                                                          \
  }

// LutGen, LutBuilder3D
// can hide
bool SneakyBuilderTonemap1(reshade::api::command_list* cmd_list) {
  //unityTonemapper = 1.5f;
  unityTonemapper = unityTonemapper <= 1.f ? 1.5f : unityTonemapper;
  forceDetect = true;
  sneakyBuilder = true;
  lutBuilder = true;
  return true;
}
bool SneakyBuilderTonemap2(reshade::api::command_list* cmd_list) {
  unityTonemapper = 2;
  forceDetect = true;
  sneakyBuilder = true;
  lutBuilder = true;
  return true;
}
bool SneakyBuilderTonemap3(reshade::api::command_list* cmd_list) {
  unityTonemapper = 3;
  forceDetect = true;
  sneakyBuilder = true;
  lutBuilder = true;
  return true;
}
// LutBuilderHdr NoTonemap, Lut3DBaker NoTonemap, Lut2DBaker, LutBuilderLdr,
// can have multiple draws
bool LutBuilderTonemap1(reshade::api::command_list* cmd_list) {
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  forceDetect = true;
  lutBuilder = true;
  return true;
}
bool LutBuilderTonemap2(reshade::api::command_list* cmd_list) {
  unityTonemapper = 2;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  forceDetect = true;
  lutBuilder = true;
  return true;
}
bool LutBuilderTonemap3(reshade::api::command_list* cmd_list) {
  unityTonemapper = 3;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  forceDetect = true;
  lutBuilder = true;
  return true;
}
bool Count(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  return true;
}
bool CountClamped(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  return true;
}
bool CountLinear(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  return true;
}
bool CountGamma(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  forceDetect = true;
  return true;
}
bool CountTonemap1(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  forceDetect = true;
  return true;
}
bool CountTonemap1Clamped(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  return true;
}
bool CountTonemap1Lut(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountLinearTonemap1(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  forceDetect = true;
  return true;
}
bool CountLinearTonemap1Lut(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountGammaTonemap1(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  forceDetect = true;
  return true;
}
bool CountGammaTonemap1Lut(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  shader_injection.count2New += 1.f;
  count2Mid += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  unityTonemapper = unityTonemapper <= 1.f ? 1 : unityTonemapper;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountLinearTonemap2(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  unityTonemapper = 2;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountLinearTonemap2LuminanceLut(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  unityTonemapper = 2.5f;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountLinearTonemap3(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  unityTonemapper = 3;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountGammaTonemap2Lut(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  unityTonemapper = 2;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}
bool CountLinearTonemap2Lut(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  unityTonemapper = 2;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  forceDetect = true;
  return true;
}

// HDRP Uber
bool UberHDRP(reshade::api::command_list* cmd_list) {
  /*countMid += 1.f;
  shader_injection.countNew += 1.f;*/
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? (unityTonemapper >= 2.f ? 1.f : shader_injection.isClamped) : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberHDRPfsr1(reshade::api::command_list* cmd_list) {
  /*countMid += 1.f;
  shader_injection.countNew += 1.f;*/
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? (unityTonemapper >= 2.f ? 1.f : shader_injection.isClamped) : shader_injection.isClamped;
  lutSampler = true;
  FSRcheck = 1.f;
  return true;
}
// PostFX Uber
bool UberPFXLinear(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}

bool UberPFXGamma(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}

// Uberpost
bool Uberpost(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? (unityTonemapper >= 2.f ? 1.f : shader_injection.isClamped) : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberpostLinear(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? (unityTonemapper >= 2.f ? 1.f : shader_injection.isClamped) : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberpostGamma(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? (unityTonemapper >= 2.f ? 1.f : shader_injection.isClamped) : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
// Uber
bool UberLinear(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberGamma(reshade::api::command_list* cmd_list) {
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberNeutralLinear(reshade::api::command_list* cmd_list) {
  unityTonemapper = 2;
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberNeutralGamma(reshade::api::command_list* cmd_list) {
  unityTonemapper = 2;
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberACESLinear(reshade::api::command_list* cmd_list) {
  unityTonemapper = 3;
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 0.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}
bool UberACESGamma(reshade::api::command_list* cmd_list) {
  unityTonemapper = 3;
  countMid += 1.f;
  shader_injection.countNew += 1.f;
  gammaSpace = 1.f;
  gammaSpaceLock = true;
  forceDetect = true;
  shader_injection.isClamped = shader_injection.isClamped == 0.f ? 1.f : shader_injection.isClamped;
  lutSampler = true;
  return true;
}

renodx::mods::shader::CustomShaders custom_shaders = {
    ////// HDRP START //////
    CustomShaderEntryCallback(0x45C0BC06, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x59A9259E, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x7158A819, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x2248992F, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x18151718, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xA7F94682, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xA53F9357, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xB9857DFB, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xE59F5A45, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xF6574655, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x29F16183, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x17E28214, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x96F6F68C, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xAE389F39, &UberHDRPfsr1),
    CustomShaderEntryCallback(0xE37D7F68, &UberHDRPfsr1),
    CustomShaderEntryCallback(0x0DCDFAE0, &UberHDRP),
    CustomShaderEntryCallback(0x1D15C861, &UberHDRP),
    CustomShaderEntryCallback(0x1DD23EA0, &UberHDRP),
    CustomShaderEntryCallback(0x3BD8B8FD, &UberHDRP),
    CustomShaderEntryCallback(0x3F04EE8D, &UberHDRP),
    CustomShaderEntryCallback(0x5F120263, &UberHDRP),
    CustomShaderEntryCallback(0x6A47E083, &UberHDRP),
    CustomShaderEntryCallback(0x8FEBA362, &UberHDRP),
    CustomShaderEntryCallback(0x9A3E18AA, &UberHDRP),
    CustomShaderEntryCallback(0x9A994A5E, &UberHDRP),
    CustomShaderEntryCallback(0x9B5C1401, &UberHDRP),
    CustomShaderEntryCallback(0x9F0BEDCA, &UberHDRP),
    CustomShaderEntryCallback(0x16F88A15, &UberHDRP),
    CustomShaderEntryCallback(0x23F1EC4F, &UberHDRP),
    CustomShaderEntryCallback(0x744F5F34, &UberHDRP),
    CustomShaderEntryCallback(0x802BDE1D, &UberHDRP),
    CustomShaderEntryCallback(0x3530AC89, &UberHDRP),
    CustomShaderEntryCallback(0x6983BFA7, &UberHDRP),
    CustomShaderEntryCallback(0x44791CF0, &UberHDRP),
    CustomShaderEntryCallback(0x490447DA, &UberHDRP),
    CustomShaderEntryCallback(0x10525777, &UberHDRP),
    CustomShaderEntryCallback(0xA322A00F, &UberHDRP),
    CustomShaderEntryCallback(0xB81F1E24, &UberHDRP),
    CustomShaderEntryCallback(0xC6F22BEE, &UberHDRP),
    CustomShaderEntryCallback(0xC52310D2, &UberHDRP),
    CustomShaderEntryCallback(0xCF6E0603, &UberHDRP),
    CustomShaderEntryCallback(0xD6B5AD4A, &UberHDRP),
    CustomShaderEntryCallback(0xD36BB165, &UberHDRP),
    CustomShaderEntryCallback(0xDB01F22E, &UberHDRP),
    CustomShaderEntryCallback(0xE363E5C8, &UberHDRP),
    CustomShaderEntryCallback(0xECEF72F5, &UberHDRP),
    CustomShaderEntryCallback(0xF1A75575, &UberHDRP),
    CustomShaderEntryCallback(0xF8BA0FA2, &UberHDRP),
    CustomShaderEntryCallback(0xF110C44D, &UberHDRP),
    CustomShaderEntryCallback(0xFDF96092, &UberHDRP),
    CustomShaderEntryCallback(0x87DFDDEA, &UberHDRP),
    CustomShaderEntryCallback(0x00E804D9, &UberHDRP),
      // final
    CustomShaderEntryCallback(0x0CF3B8B8, &CountLinear),
    CustomShaderEntryCallback(0x0E1A7B34, &CountLinear),
    CustomShaderEntryCallback(0x0E6EFF3C, &CountLinear),
    CustomShaderEntryCallback(0x0FA783B7, &CountLinear),
    CustomShaderEntryCallback(0x1B6B4125, &CountLinear),
    CustomShaderEntryCallback(0x002A3518, &CountLinear),
    CustomShaderEntryCallback(0x02AB22C6, &CountLinear),
    CustomShaderEntryCallback(0x3D8F662C, &CountLinear),
    CustomShaderEntryCallback(0x3DA6127F, &CountLinear),
    CustomShaderEntryCallback(0x4BD9F109, &CountLinear),
    CustomShaderEntryCallback(0x4DE06BC3, &CountLinear),
    CustomShaderEntryCallback(0x4E2A63EE, &CountLinear),
    CustomShaderEntryCallback(0x5A977943, &CountLinear),
    CustomShaderEntryCallback(0x08F6AF40, &CountLinear),
    CustomShaderEntryCallback(0x31B9B1AB, &CountLinear),
    CustomShaderEntryCallback(0x38B55FCE, &CountLinear),
    CustomShaderEntryCallback(0x44D2D279, &CountLinear),
    CustomShaderEntryCallback(0x54D67961, &CountLinear),
    CustomShaderEntryCallback(0x55D603B1, &CountLinear),
    CustomShaderEntryCallback(0x067F6831, &CountLinear),
    CustomShaderEntryCallback(0x68B1161B, &CountLinear),
    CustomShaderEntryCallback(0x73F01A45, &CountLinear),
    CustomShaderEntryCallback(0x78C63EB0, &CountLinear),
    CustomShaderEntryCallback(0x78ED6152, &CountLinear),
    CustomShaderEntryCallback(0x85DF4472, &CountLinear),
    CustomShaderEntryCallback(0x91D61E3F, &CountLinear),
    CustomShaderEntryCallback(0x110E8EE6, &CountLinear),
    CustomShaderEntryCallback(0x222AC31F, &CountLinear),
    CustomShaderEntryCallback(0x810A1D59, &CountLinear),
    CustomShaderEntryCallback(0x1310A22D, &CountLinear),
    CustomShaderEntryCallback(0x3069A872, &CountLinear),
    CustomShaderEntryCallback(0x8883FAEA, &CountLinear),
    CustomShaderEntryCallback(0x27812EF8, &CountLinear),
    CustomShaderEntryCallback(0x28075F34, &CountLinear),
    CustomShaderEntryCallback(0x40072B90, &CountLinear),
    CustomShaderEntryCallback(0x44080C9A, &CountLinear),
    CustomShaderEntryCallback(0x774090A7, &CountLinear),
    CustomShaderEntryCallback(0x2548186A, &CountLinear),
    CustomShaderEntryCallback(0x78363901, &CountLinear),
    CustomShaderEntryCallback(0xA5CF0E57, &CountLinear),
    CustomShaderEntryCallback(0xA6DA2B34, &CountLinear),
    CustomShaderEntryCallback(0xA73C3123, &CountLinear),
    CustomShaderEntryCallback(0xA5809BF4, &CountLinear),
    CustomShaderEntryCallback(0xAB2CD6E2, &CountLinear),
    CustomShaderEntryCallback(0xAC34C8D9, &CountLinear),
    CustomShaderEntryCallback(0xAC51C144, &CountLinear),
    CustomShaderEntryCallback(0xAE7EE10F, &CountLinear),
    CustomShaderEntryCallback(0xB2B44A63, &CountLinear),
    CustomShaderEntryCallback(0xB26F4E2D, &CountLinear),
    CustomShaderEntryCallback(0xBDA2DF56, &CountLinear),
    CustomShaderEntryCallback(0xBF447ED7, &CountLinear),
    CustomShaderEntryCallback(0xCE6260A3, &CountLinear),
    CustomShaderEntryCallback(0xD0BF0A3A, &CountLinear),
    CustomShaderEntryCallback(0xD4E338C4, &CountLinear),
    CustomShaderEntryCallback(0xD22CD417, &CountLinear),
    CustomShaderEntryCallback(0xDD2F76F2, &CountLinear),
    CustomShaderEntryCallback(0xED0AF2E7, &CountLinear),
    CustomShaderEntryCallback(0xEEFA69A4, &CountLinear),
    CustomShaderEntryCallback(0xF9FE3D5A, &CountLinear),
    CustomShaderEntryCallback(0xFFB14DDC, &CountLinear),
    CustomShaderEntryCallback(0xA7E4A5B2, &CountLinear),
    ////// HDRP END //////
    ////// CUSTOM START //////
    CustomShaderEntryCallback(0x459D4153, &CountLinear),    // Colour Correction
    CustomShaderEntryCallback(0xB0826385, &CountLinear),
    CustomShaderEntryCallback(0x07FD3D55, &CountLinearTonemap1),   // Neva
    CustomShaderEntryCallback(0xECED3960, &CountLinearTonemap1),    // PostProcess
    CustomShaderEntryCallback(0xB0E8A766, &CountLinearTonemap1),    // PostProcess
    //CustomShaderEntry(0x144BC65C),
    CustomShaderEntryCallback(0x4C1E450F, &Count),    // RetroPixelPro
    CustomShaderEntryCallback(0x918C7E0C, &Count),    // ScreenRender
    CustomShaderEntryCallback(0x4C6C9444, &Count),    // Blend MorganTweak
    CustomShaderEntryCallback(0xBD332C3A, &CountLinearTonemap1),   // PostFx GlowComposite
    CustomShaderEntryCallback(0x3E8A6AF2, &CountLinearTonemap1),   // CameraFilterPack 2Lut
    CustomShaderEntryCallback(0x12F06F96, &CountLinearTonemap1),   // CameraFilterPack Lut Plus
    //CustomShaderEntryCallback(0xB47E4A58, &CountLinear),    // Water Effect
    CustomShaderEntryCallback(0xFE4139AC, &CountLinearTonemap2),    // TLSA
    /*CustomShaderEntry(0xB63D2C4A),
    CustomShaderEntry(0xD665F9CB),*/
    CustomShaderEntryCallback(0x21AB084F, &CountLinearTonemap1),  // Gamma (Republique)
    //CustomShaderEntry(0x5BDBDECE),
    CustomShaderEntryCallback(0x0D0F308B, &CountLinearTonemap2),    // Kyoto PostProcess
    CustomShaderEntryCallback(0x50962AFA, &CountGammaTonemap1),    // EtG gammagamma
    CustomShaderEntryCallback(0xB7AFA999, &CountGammaTonemap1),    // EtG pixelator
    CustomShaderEntryCallback(0xB587B9F9, &CountLinearTonemap3),    // Frame Composite (Wheel World)
    CustomShaderEntryCallback(0x2CD4F51E, &UberACESLinear),    // BT ToneMapping
    CustomShaderEntryCallback(0x60F16875, &UberACESLinear),    // BT ToneMapping
    CustomShaderEntryCallback(0xF143281D, &UberACESLinear),    // BT ToneMapping
    CustomShaderEntryCallback(0xFDD23A9F, &CountGamma),      // Owlcat FinalBlit
    CustomShaderEntryCallback(0x08D3C61F, &CountGamma),      // Owlcat FinalBlit
    CustomShaderEntryCallback(0x7614050A, &CountGamma),      // Owlcat FinalBlit
    CustomShaderEntryCallback(0x082EFBB5, &CountGamma),      // Owlcat FinalBlit
    CustomShaderEntryCallback(0xDCD93B86, &CountGamma),      // Owlcat postfinal
    CustomShaderEntryCallback(0xA9BA06AC, &CountGamma),      // Owlcat postfinal
    CustomShaderEntryCallback(0x837E8B2F, &CountLinear),      // Owlcat FinalBlit
    CustomShaderEntryCallback(0x49FD2384, &CountLinear),      // Owlcat FinalBlit
    CustomShaderEntryCallback(0x6738FBF0, &CountLinear),    // eternal threads
    CustomShaderEntryCallback(0x733AC097, &CountLinear),      // pp tonemap
    CustomShaderEntryCallback(0x2975BCA8, &CountLinear),  // SEB
    CustomShaderEntryCallback(0xF2CD9B88, &CountLinear),  // SEB
    CustomShaderEntryCallback(0xCE4A6EDF, &CountLinearTonemap2),  // ShNecro, no need count
    CustomShaderEntryCallback(0x7A4615AA, &CountLinearTonemap2),  // ShNecro
    CustomShaderEntryCallback(0xF3110A04, &CountGammaTonemap1),    // NOAH Blur
    CustomShaderEntryCallback(0x5DBC623F, &CountGammaTonemap1),    // urpcustom Uberpost
    CustomShaderEntryCallback(0x80C692FC, &CountGammaTonemap1),    // urpcustom Uberpost
    //CustomShaderEntryCallback(0x7A4615AA, &CountLinear),  // ShNecro
    CustomShaderEntryCallback(0xD8341E94, &CountLinearTonemap1Lut), // RedHook pp LUT
    CustomShaderEntryCallback(0x64031CB8, &CountLinearTonemap1Lut), // RedHook pp LUT
    CustomShaderEntryCallback(0x99E1B419, &CountGamma), // EndlessLegends encode
    CustomShaderEntryCallback(0xD0434E6B, &CountTonemap1), // TintedVignette
    CustomShaderEntryCallback(0xCEEF2538, &CountClamped), // CRT
    CustomShaderEntryCallback(0x8B223C82, &CountLinearTonemap2),    // Squire tonemap
    //CustomShaderEntryCallback(0x90ED3547, &CountTonemap1Lut),  // TGB ColorGrading3D
    CustomShaderEntryCallback(0xEF459349, [](reshade::api::command_list* cmd_list) {    // ClampShader
    shader_injection.isClamped = 1.f;
    return true;
    }),
    /*CustomShaderEntry(0x6CA6AD34),  // FinalVisualAdjustments
    CustomShaderEntry(0x3D4B34E8),*/
    //CustomShaderEntry(0x25AD4F0D),
    ////// CUSTOM END //////
    ////// DIVISION START //////
      // Chromatic Aberration
    CustomShaderEntryCallback(0xEEE589B3, &CountTonemap1),
    CustomShaderEntryCallback(0x937A4C13, &CountTonemap1),
    CustomShaderEntryCallback(0x3F6031DA, &CountTonemap1),
    CustomShaderEntryCallback(0x0E6D86E9, &CountTonemap1),
    CustomShaderEntryCallback(0x0FE990F5, &CountTonemap1),
    CustomShaderEntryCallback(0x0343CDEF, &CountTonemap1),
    CustomShaderEntryCallback(0xEA78C466, &CountTonemap1),
      // Vignetting
    CustomShaderEntryCallback(0x1BA9B943, &CountTonemap1),
    CustomShaderEntryCallback(0x23E39077, &CountTonemap1),
    CustomShaderEntryCallback(0x28A6A0C0, &CountTonemap1),
    CustomShaderEntryCallback(0x35E7772D, &CountTonemap1),
    CustomShaderEntryCallback(0x88608A73, &CountTonemap1),
    CustomShaderEntryCallback(0x85285389, &CountTonemap1),
    CustomShaderEntryCallback(0x8A9A33D9, &CountTonemap1),
    CustomShaderEntryCallback(0xB1186381, &CountTonemap1),
      // Bloom
    CustomShaderEntryCallback(0x5D9A0B26, &CountTonemap1),       // Fast Bloom
    CustomShaderEntryCallback(0x9CE6441F, &CountTonemap1),       // Fast Bloom
    //CustomShaderEntry(0x831FCA18),
    CustomShaderEntryCallback(0xAC07576C, &CountTonemap1),       // SENaturalBloom
    CustomShaderEntryCallback(0x5D511B6E, &CountTonemap1),       // SENaturalBloom
    CustomShaderEntryCallback(0xE9CA44CE, &CountTonemap1),       // SENaturalBloom
    CustomShaderEntryCallback(0xAEFFC61C, &CountTonemap1),       // Blend for bloom
    CustomShaderEntryCallback(0xB9321BA4, &CountTonemap1),       // Blend for bloom
    CustomShaderEntryCallback(0xBFB24DA6, &CountTonemap1),       // Blend for bloom
    CustomShaderEntryCallback(0xE60F40B0, &CountTonemap1),       // Blend for bloom
    CustomShaderEntryCallback(0xB7ED38A4, &CountTonemap1),       // Blend for bloom
    CustomShaderEntryCallback(0x34CE249A, &CountTonemap1Clamped),       // Blend for bloom
    CustomShaderEntryCallback(0xA588D1CD, &CountTonemap1Clamped),       // PostBloomRich
    CustomShaderEntryCallback(0xD7C38DB2, [](reshade::api::command_list* cmd_list) {    // Blend for bloom (build)
    if(shader_injection.isClamped == 0.f){}
    else if(shader_injection.isClamped == 1.f){
      shader_injection.isClamped = 1.5f;
    } else if(shader_injection.isClamped == 1.5f){
      shader_injection.isClamped = 1.f;
    } else {}
    return true;
    }),
    CustomShaderEntryCallback(0xEB56F7CB, [](reshade::api::command_list* cmd_list) {    // Blend for bloom (build)
    if(shader_injection.isClamped == 0.f){}
    else if(shader_injection.isClamped == 1.f){
      shader_injection.isClamped = 1.5f;
    } else if(shader_injection.isClamped == 1.5f){
      shader_injection.isClamped = 1.f;
    } else {}
    return true;
    }),
    CustomShaderEntryCallback(0xBFBBCB6C, &CountTonemap1),    // PostProcessing Bloom
    //CustomShaderEntry(0x7976D6A7),
    //CustomShaderEntry(0x5830BEA5),      // Blend for bloom
    //CustomShaderEntry(0x05A07123),      // XULMREDUX bloom
    // Color Correction
    CustomShaderEntryCallback(0x488FE86B, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x116B98EA, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x5E9BB86D, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x1EFD76DD, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x13345F57, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x046341CB, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x04AB98F4, &CountTonemap1Lut),       // Curves Simple
    CustomShaderEntryCallback(0x9B1835E7, &CountTonemap1Lut),       // Curves
    CustomShaderEntryCallback(0x481EBC17, &CountTonemap1Lut),       // Curves
    CustomShaderEntryCallback(0x775F62CB, &CountTonemap1Lut),       // Effect
    /*CustomShaderEntry(0x9B1835E7),
    CustomShaderEntry(0x42C5ADCE),*/
    CustomShaderEntryCallback(0x4F6C23CE, &CountTonemap1Lut),       // LUT
    CustomShaderEntryCallback(0x7FDF2753, &CountTonemap1Lut),       // 3d LUT
    CustomShaderEntryCallback(0xCCF1CAE8, &CountTonemap1Lut),       // 3d LUT
    CustomShaderEntryCallback(0x7EA242C9, &CountLinearTonemap1Lut),       // 3d LUT
    //
    CustomShaderEntryCallback(0x0BF02D38, &CountClamped),               // Noise and Grain
    CustomShaderEntryCallback(0x9954D6B3, &CountClamped),               // Noise and Grain
    CustomShaderEntryCallback(0x9591A1F5, &Count),               // Noise Shader RGB
    CustomShaderEntryCallback(0xED7E59E5, &CountTonemap1),               // Image Filter
    CustomShaderEntryCallback(0x29ED5553, &CountLinearTonemap2),               // tonemapper
    CustomShaderEntryCallback(0xB02DE8EC, &Count),               // Gamma Effect
    //CustomShaderEntry(0x1AF93E2F),  // Noise and Grain
    CustomShaderEntryCallback(0xB55175D9, &CountGammaTonemap1),  // Screen Sobel Outline
    CustomShaderEntryCallback(0x2C9E24A9, &Count),          // ColorsBrightness (CameraFilterPack)
    CustomShaderEntryCallback(0x4A979145, &CountLinearTonemap1),       // brightness
    CustomShaderEntryCallback(0xADFFB914, &Count),    // CRT/PostProcess
    CustomShaderEntryCallback(0xEB5B9780, &Count),    // CRT/FinalPostProcess
    CustomShaderEntryCallback(0x33503511, &CountGamma), // crt filter
    CustomShaderEntryCallback(0x81E0C934, &CountTonemap1),  // fxaa3
    CustomShaderEntryCallback(0x2020F088, &CountLinearTonemap2LuminanceLut),  // TonemappingColorGrading
    CustomShaderEntryCallback(0x1F2DBC68, &CountLinearTonemap2LuminanceLut),  // TonemappingColorGrading
    //CustomShaderEntryCallback(0x9EFFF420, &CountGammaTonemap2Lut),  // TonemappingColorGrading
    CustomShaderEntryCallback(0x208798AE, &CountLinearTonemap1Lut),  // TonemappingColorGrading
    //CustomShaderEntryCallback(0x398D8E38, &CountLinearTonemap2Lut),  // TonemappingColorGrading
    CustomShaderEntryCallback(0x9311D7EE, &Count),    // ContrastComposite
    CustomShaderEntryCallback(0xB8B6A6D1, &Count),    // Lens Aberrations (vignette)
    //CustomShaderEntryCallback(0x10D5D9E2, &Count),    // Lens Aberrations (vignette)
    //CustomShaderEntry(0x953D591D),    // Motion Vectors
    CustomShaderEntryCallback(0xCE378E1B, &CountTonemap1),    // ImageEffects RetroFX
    CustomShaderEntryCallback(0x9325D090, &CountTonemap1),          // sunshafts composite
    //CustomShaderEntry(0x103B8DEE),  // SunShaftsComposite
    CustomShaderEntryCallback(0x2D5EAC88, &CountTonemap1),    // SunShaftsComposite
    CustomShaderEntryCallback(0x920023D7, &CountTonemap1),    // SunShaftsComposite
    CustomShaderEntryCallback(0x3F2260DA, &CountTonemap1),    // SunShaftsComposite
    CustomShaderEntryCallback(0xD1C9755F, &CountTonemap1),    // SunShaftsComposite
    CustomShaderEntryCallback(0xD698A33C, &CountTonemap1),    // SunShaftsComposite
    CustomShaderEntryCallback(0xD3757677, &CountTonemap1),       // Pixelate
    CustomShaderEntryCallback(0xCFF050AD, &CountTonemap1),       // Snapshot Bloom
    CustomShaderEntryCallback(0x3E73EC75, &CountTonemap1),       // Gamma Effect
    CustomShaderEntryCallback(0x3177F565, &Count),       // Motion Effect
    CustomShaderEntryCallback(0x9B572899, &CountLinearTonemap2),  //PugRP Color Resolve
    //CustomShaderEntryCallback(0xA6AE1DEC, &CountTonemap1),       // Depth Gray Scale
      // Colorful
    CustomShaderEntryCallback(0x7108F19B, &CountTonemap1),       // BCG
    CustomShaderEntryCallback(0xB103EAA6, &Count),       // BCG
    CustomShaderEntryCallback(0xD2FB319D, &Count),    // BCG
    CustomShaderEntryCallback(0x080159F7, &CountLinear),    // LookupFilter3D
    CustomShaderEntryCallback(0xFD95CDDE, &CountTonemap1),       // HSV (maybe gamma ?)
    CustomShaderEntryCallback(0xB2C03C2D, &CountTonemap1),       // Photo Filter
    CustomShaderEntryCallback(0xCFF050AD, &CountTonemap1),       // Photo Filter
    //CustomShaderEntryCallback(0xCD332963, &CountTonemap1),       // Shadows Midtons Highlights
    CustomShaderEntryCallback(0xDDC38AD4, &CountTonemap1),    // Levels
    //CustomShaderEntry(0xDD3C4A2A),
    CustomShaderEntryCallback(0x06A3136A, &CountTonemap1),       // Levels
    CustomShaderEntryCallback(0xCB4380C4, &CountTonemap1),       // Sharpen
    CustomShaderEntryCallback(0x79888BD7, &CountTonemap1),       // Chromatic Aberration
      // CC
    CustomShaderEntryCallback(0x50D362B8, &CountTonemap1),       // Fast Vignette
    CustomShaderEntryCallback(0xDAEBFDF2, &CountGammaTonemap1),  // Lookup Filter (maybe not gamma)
    CustomShaderEntryCallback(0x9D622AC2, &CountTonemap1Clamped),       // Levels
    CustomShaderEntryCallback(0x6A14715D, &CountTonemap1),       // ContrastVignette
    CustomShaderEntryCallback(0x85B7FDE5, &CountTonemap1),       // Sharpen
    CustomShaderEntryCallback(0xC7947A06, &Count),       // Sharpen
    CustomShaderEntryCallback(0xE13B385C, &CountTonemap1),       // Photo Filter
    CustomShaderEntryCallback(0x16ED739A, &Count),               // Analog TV
    // ImageEffects Cinematic
    CustomShaderEntryCallback(0xA4675F12, &Count),       // Bloom
    CustomShaderEntryCallback(0xD0F9D8F0, &Count),       // Bloom
    // Amplify Color
    CustomShaderEntryCallback(0x01C485EF, &CountLinear),
    CustomShaderEntryCallback(0x8D9A4865, &CountGammaTonemap1Lut),
    CustomShaderEntryCallback(0x864A0CDA, &CountLinear),
    CustomShaderEntryCallback(0xDF0F14A0, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xF3B603D6, &CountLinear),
    CustomShaderEntryCallback(0x341D49EC, &CountGammaTonemap1Lut),
    CustomShaderEntryCallback(0x0C2FC484, &CountGammaTonemap1Lut),
    CustomShaderEntryCallback(0x970EA5A1, &CountLinearTonemap1Lut),
    CustomShaderEntryCallback(0xD70AE6DF, &CountLinearTonemap1Lut),
    CustomShaderEntryCallback(0xA298CF0E, &CountLinearTonemap1Lut),
    CustomShaderEntryCallback(0xDC3C3CFB, &CountLinearTonemap1Lut),
    CustomShaderEntryCallback(0x7C3F36C2, &CountLinear),
    CustomShaderEntryCallback(0xEEFE9737, &CountGammaTonemap1Lut),
    CustomShaderEntryCallback(0xB063DC49, &Count),  // Bloom Final
    CustomShaderEntryCallback(0xF1E9DC64, &CountGammaTonemap1Lut),  // Depth Mask Blend
      // Scion Combination Pass
    CustomShaderEntryCallback(0x0DA28928, &CountTonemap1),
    CustomShaderEntryCallback(0x2E658124, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xEA7AD761, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xEAA69A55, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xC497E04E, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x32EAC77E, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xE7ACEE4B, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xA7D81F41, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x8A6BD876, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x2B178FB4, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x944D0BD3, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x12FB835F, &CountTonemap1),
    CustomShaderEntryCallback(0x638CC010, &CountTonemap1Clamped),
    //CustomShaderEntry(0x73E76C3C),
    CustomShaderEntryCallback(0x5456E1AA, &CountTonemap1),
    CustomShaderEntryCallback(0x956198C2, &CountTonemap1),
    CustomShaderEntryCallback(0xA5B9C43C, &CountTonemap1),
    CustomShaderEntryCallback(0xA206F965, &CountTonemap1),
      // Beautify
    CustomShaderEntryCallback(0x98451591, &CountLinear),
    CustomShaderEntryCallback(0xCF0602FB, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x1C3A2078, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xA0712B3B, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xA759D5F2, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x2E21732F, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xE9ADE0A5, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xF1C7A343, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xFADC6670, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x446676D2, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x57ED3CED, &CountGammaTonemap1),
      // Prism Effects
    CustomShaderEntryCallback(0x1367C2D3, &CountLinearTonemap1Lut),
    CustomShaderEntryCallback(0x6968824B, &CountLinearTonemap1Lut),
      // SC Post Effect
    //CustomShaderEntry(0x65F50A96),    // LUT
    ////// DIVISION END //////
    ////// UBER START //////
      /// PostFX ///
        // LUT
    CustomShaderEntryCallback(0x0E014F53, &UberPFXLinear),
    CustomShaderEntryCallback(0x7E130053, &UberPFXLinear),
    CustomShaderEntryCallback(0x01D2D2B8, &UberPFXLinear),
    CustomShaderEntryCallback(0x7BB0D55E, &UberPFXLinear),
    CustomShaderEntryCallback(0x3DA8F050, &UberPFXLinear),
    CustomShaderEntryCallback(0xFE41EA26, &UberPFXLinear),
    CustomShaderEntryCallback(0xFC2F2508, &UberPFXLinear),
    CustomShaderEntryCallback(0xFB3D67A8, &UberPFXLinear),
    CustomShaderEntryCallback(0xF7099E42, &UberPFXLinear),
    CustomShaderEntryCallback(0xF9B0D779, &UberPFXLinear),
    CustomShaderEntryCallback(0xF1C2CE47, &UberPFXLinear),
    CustomShaderEntryCallback(0xECDC6EC9, &UberPFXLinear),
    CustomShaderEntryCallback(0xE9A6F5FA, &UberPFXLinear),
    CustomShaderEntryCallback(0xD7048ECF, &UberPFXLinear),
    CustomShaderEntryCallback(0xCACDD22E, &UberPFXLinear),
    CustomShaderEntryCallback(0xC3EA0270, &UberPFXLinear),
    CustomShaderEntryCallback(0xB5617B06, &UberPFXLinear),
    CustomShaderEntryCallback(0xA810454B, &UberPFXLinear),
    CustomShaderEntryCallback(0xA79BF32E, &UberPFXLinear),
    CustomShaderEntryCallback(0xA34CD90A, &UberPFXLinear),
    CustomShaderEntryCallback(0x51459A11, &UberPFXLinear),
    CustomShaderEntryCallback(0x8903C9E4, &UberPFXLinear),
    CustomShaderEntryCallback(0x6420BDE4, &UberPFXLinear),
    CustomShaderEntryCallback(0x959B3FB7, &UberPFXLinear),
    CustomShaderEntryCallback(0x761CCEC0, &UberPFXLinear),
    CustomShaderEntryCallback(0x702E161F, &UberPFXLinear),
    CustomShaderEntryCallback(0x76E8C9E0, &UberPFXLinear),
    CustomShaderEntryCallback(0x43CD25CE, &UberPFXLinear),
    CustomShaderEntryCallback(0x16C17744, &UberPFXLinear),
    CustomShaderEntryCallback(0x9FDCD9DC, &UberPFXLinear),
    CustomShaderEntryCallback(0x7F1AF2FE, &UberPFXLinear),
    CustomShaderEntryCallback(0xBACB2204, &UberPFXLinear),
    CustomShaderEntryCallback(0xB48DB980, &UberPFXLinear),
    CustomShaderEntryCallback(0x7007E15E, &UberPFXLinear),
    CustomShaderEntryCallback(0x6848BE5C, &UberPFXLinear),
    CustomShaderEntryCallback(0x8B198D6C, &UberPFXLinear),
    CustomShaderEntryCallback(0x31702713, &UberPFXLinear),
    CustomShaderEntryCallback(0x291E8F1F, &UberPFXLinear),
    CustomShaderEntryCallback(0xD758B0D4, &UberPFXLinear),
    CustomShaderEntryCallback(0xEA3FB96C, &UberPFXLinear),
    CustomShaderEntryCallback(0xF45BE267, &UberPFXLinear),
    CustomShaderEntryCallback(0xA5AC1F7D, &UberPFXLinear),
    CustomShaderEntryCallback(0x585D07A9, &UberPFXLinear),
    CustomShaderEntryCallback(0x7DD56503, &UberPFXLinear),
    CustomShaderEntryCallback(0x56DF66B4, &UberPFXLinear),
    CustomShaderEntryCallback(0x752CA615, &UberPFXLinear),
    CustomShaderEntryCallback(0x52481F8D, &UberPFXLinear),
    CustomShaderEntryCallback(0xFBA36CFC, &UberPFXLinear),
    CustomShaderEntryCallback(0x81535823, &UberPFXLinear),
    CustomShaderEntryCallback(0xE49EE0CB, &UberPFXLinear),
    CustomShaderEntryCallback(0x44B1B227, &UberPFXLinear),
    CustomShaderEntryCallback(0x6A5E9052, &UberPFXLinear),
    CustomShaderEntryCallback(0xCDEB8FA1, &UberPFXLinear),
    CustomShaderEntryCallback(0xF24BB452, &UberPFXLinear),
    CustomShaderEntryCallback(0x1AF361CB, &UberPFXLinear),
    CustomShaderEntryCallback(0x06F08670, &UberPFXLinear),
    CustomShaderEntryCallback(0x08B287D0, &UberPFXLinear),
    CustomShaderEntryCallback(0x100B5477, &UberPFXLinear),
    CustomShaderEntryCallback(0x569EAA5C, &UberPFXLinear),
    CustomShaderEntryCallback(0x2938FC01, &UberPFXLinear),
    CustomShaderEntryCallback(0x5C4F96D7, &UberPFXLinear),
    CustomShaderEntryCallback(0x59FADBF3, &UberPFXLinear),
    CustomShaderEntryCallback(0x295A7D10, &UberPFXLinear),
    CustomShaderEntryCallback(0x96169D7E, &UberPFXLinear),
    CustomShaderEntryCallback(0xB8F5FE1F, &UberPFXLinear),
    CustomShaderEntryCallback(0xD2C3B7E9, &UberPFXLinear),
    CustomShaderEntryCallback(0xFB651628, &UberPFXLinear),
    CustomShaderEntryCallback(0x7B7C2BA0, &UberPFXLinear),
    CustomShaderEntryCallback(0x93F0A8E4, &UberPFXLinear),
    CustomShaderEntryCallback(0xC8D99279, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0xFDB4A670, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0xF627C833, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0x45068D82, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0x07EBFFF9, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0x6EB6CA05, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0x5EED6FFE, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0x1A33E5A1, &UberPFXLinear),  // user LUT
    CustomShaderEntryCallback(0x8C89A7D0, &UberPFXGamma),
    CustomShaderEntryCallback(0x46AE5D9D, &UberPFXGamma),
    CustomShaderEntryCallback(0xA9BA96AB, &UberPFXGamma),
    CustomShaderEntryCallback(0x851392C2, &UberPFXGamma),
    CustomShaderEntryCallback(0xA316B6FD, &UberPFXGamma),
    CustomShaderEntryCallback(0xE1A21B07, &UberPFXGamma),
    CustomShaderEntryCallback(0xEE5CA39C, &UberPFXGamma),
    CustomShaderEntryCallback(0x734AEDAD, &UberPFXGamma),
    CustomShaderEntryCallback(0x5311B657, &UberPFXGamma),
    CustomShaderEntryCallback(0x9B557C06, &UberPFXGamma),
    CustomShaderEntryCallback(0x59A191DD, &UberPFXGamma),
    CustomShaderEntryCallback(0xD342B20A, &UberPFXGamma),
    CustomShaderEntryCallback(0xE42ECD73, &UberPFXGamma),
    CustomShaderEntryCallback(0x2F0122E5, &UberPFXGamma),
    CustomShaderEntryCallback(0xE3FA4292, &UberPFXGamma),
    CustomShaderEntryCallback(0x27388162, &UberPFXGamma),
    CustomShaderEntryCallback(0x41FED193, &UberPFXGamma),
    CustomShaderEntryCallback(0xAB3D0513, &UberPFXGamma),
    CustomShaderEntryCallback(0x2EE0A27B, &UberPFXGamma),
    CustomShaderEntryCallback(0x1D28756B, &UberPFXGamma),
    CustomShaderEntryCallback(0xB9A25923, &UberPFXGamma),
    CustomShaderEntryCallback(0x7CE9A128, &UberPFXGamma),
    CustomShaderEntryCallback(0x186D7E4F, &UberPFXGamma),
    CustomShaderEntryCallback(0x8ED83A94, &UberPFXGamma),
        // no LUT
    CustomShaderEntryCallback(0xD73AD73D, &CountLinearTonemap1Lut),  // user LUT
    CustomShaderEntryCallback(0x9031E6E6, &CountLinearTonemap1Lut),  // user LUT
    CustomShaderEntryCallback(0x2AA95E6B, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x7CE8D532, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x73B11B12, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x910F1AF7, &CountLinearTonemap1),
    CustomShaderEntryCallback(0xD741C111, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x87CB27C6, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x34E90A30, &CountLinearTonemap1),
    CustomShaderEntryCallback(0xD68115B9, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x4D5D5505, &CountLinearTonemap1),
    CustomShaderEntryCallback(0xC6971BF6, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x0A015C2E, &CountLinearTonemap1),  // maybe dont
    CustomShaderEntryCallback(0x8CF8B4BE, &CountLinearTonemap1),
    CustomShaderEntryCallback(0xF84B07BA, &CountLinearTonemap1),
    CustomShaderEntryCallback(0xDB886B89, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x153D1995, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x1CAABDB2, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xCE0AF0C9, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x5B924DC5, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x9D5E980F, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xC6297BAD, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x8E352C1D, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x76CDAAAC, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x03AD1809, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x1DE983F0, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x599066C8, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0xDDC88868, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x0616D26C, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x6F0C66BA, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x1B172164, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x2339A919, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x662E01AB, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x9F02B611, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0xBB36315A, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0xF3FC5F05, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x9B2BBC4D, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0xBBF7CCB9, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x84868CA0, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0x54DC05DE, &CountGammaTonemap1Lut), // user LUT
    CustomShaderEntryCallback(0xAE488FB0, &CountGammaTonemap1Lut), // user LUT
      /// Uber (SDR internal LUT) ///
        // SRGB LUT
    CustomShaderEntryCallback(0x1C8D5E9F, &UberLinear),
    CustomShaderEntryCallback(0x2B2B673C, &UberLinear),
    CustomShaderEntryCallback(0x4A9DC131, &UberLinear),
    CustomShaderEntryCallback(0x4B0DE7CD, &UberLinear),
    CustomShaderEntryCallback(0x5CD23656, &UberLinear),
    CustomShaderEntryCallback(0x8CBAADE3, &UberLinear),
    CustomShaderEntryCallback(0x9EA7EE21, &UberLinear),
    CustomShaderEntryCallback(0x47DDAF39, &UberLinear),
    CustomShaderEntryCallback(0x485D45AC, &UberLinear),
    CustomShaderEntryCallback(0x937ECFDB, &UberLinear),
    CustomShaderEntryCallback(0x6529C56E, &UberLinear),
    CustomShaderEntryCallback(0x8191B510, &UberLinear),
    CustomShaderEntryCallback(0x23448FC5, &UberLinear),
    CustomShaderEntryCallback(0x31271C46, &UberLinear),
    CustomShaderEntryCallback(0x206927BB, &UberLinear),
    CustomShaderEntryCallback(0xC493FA01, &UberLinear),
    CustomShaderEntryCallback(0xE002CDC8, &UberLinear),
    CustomShaderEntryCallback(0xFBF8FE52, &UberLinear),
    CustomShaderEntryCallback(0xFDE5FE89, &UberLinear),
    CustomShaderEntryCallback(0x4B3614D0, &UberLinear),
    CustomShaderEntryCallback(0x1237D610, &UberGamma),
    CustomShaderEntryCallback(0x2DFCB189, &UberGamma),
    CustomShaderEntryCallback(0x3F4B346E, &UberGamma),
    CustomShaderEntryCallback(0x3F7E2590, &UberGamma),
    CustomShaderEntryCallback(0x05D7FD3F, &UberGamma),
    CustomShaderEntryCallback(0x5ED6AF8F, &UberGamma),
    CustomShaderEntryCallback(0x6B383D5D, &UberGamma),
    CustomShaderEntryCallback(0x26D16BD4, &UberGamma),
    CustomShaderEntryCallback(0x28E64619, &UberGamma),
    CustomShaderEntryCallback(0x9DC0BD71, &UberGamma),
    CustomShaderEntryCallback(0x73A5E561, &UberGamma),
    CustomShaderEntryCallback(0x092D4CC5, &UberGamma),
    CustomShaderEntryCallback(0x05004E3A, &UberGamma),
    CustomShaderEntryCallback(0x6409B3A8, &UberGamma),
    CustomShaderEntryCallback(0x97379D6B, &UberGamma),
    CustomShaderEntryCallback(0xAC23ED8C, &UberGamma),
    CustomShaderEntryCallback(0xC85DC52C, &UberGamma),
    CustomShaderEntryCallback(0xDEF5AB02, &UberGamma),
    CustomShaderEntryCallback(0xF647C7C7, &UberGamma),
    CustomShaderEntryCallback(0xFE221F8E, &UberGamma),
    CustomShaderEntryCallback(0x0DA637B5, &UberGamma),
    CustomShaderEntryCallback(0x1E7D1A75, &UberGamma),
    CustomShaderEntryCallback(0x6A2FFE0C, &UberGamma),
    CustomShaderEntryCallback(0x8ED94D63, &UberGamma),
    CustomShaderEntryCallback(0x0731C889, &UberGamma),
    CustomShaderEntryCallback(0x3085E401, &UberGamma),
    CustomShaderEntryCallback(0x4546DE90, &UberGamma),
    CustomShaderEntryCallback(0x15621136, &UberGamma),
    CustomShaderEntryCallback(0x70157207, &UberGamma),
    CustomShaderEntryCallback(0xB5D55000, &UberGamma),
    CustomShaderEntryCallback(0xBB6740C1, &UberGamma),
    CustomShaderEntryCallback(0xE4952B04, &UberGamma),
    CustomShaderEntryCallback(0x10579C17, &UberGamma),
    CustomShaderEntryCallback(0x703FCC89, &UberGamma),
    CustomShaderEntryCallback(0x38927BBD, &UberGamma),
    CustomShaderEntryCallback(0xB339A072, &UberGamma),
    CustomShaderEntryCallback(0xB811DE51, &UberGamma),
        // Linear LUT
          // NoTonemap
    CustomShaderEntryCallback(0x71A2C76F, &UberLinear),
    CustomShaderEntryCallback(0xD1414798, &UberLinear),
    CustomShaderEntryCallback(0xDC56B686, &UberLinear),
    CustomShaderEntryCallback(0xE9E072CB, &UberLinear),
    CustomShaderEntryCallback(0x2A1C50A3, &UberLinear),
    CustomShaderEntryCallback(0x2B67D8D5, &UberLinear),
    CustomShaderEntryCallback(0x3C1076FD, &UberLinear),
    CustomShaderEntryCallback(0x76DB4A6B, &UberLinear),
    CustomShaderEntryCallback(0x81F618AE, &UberLinear),
    CustomShaderEntryCallback(0x2546D5B8, &UberLinear),
    CustomShaderEntryCallback(0xF211C0FB, &UberLinear),
    CustomShaderEntryCallback(0x5D2E23EB, &UberLinear),
    CustomShaderEntryCallback(0x0948E708, &UberLinear),
    CustomShaderEntryCallback(0x3168A95B, &UberLinear),
    CustomShaderEntryCallback(0x9862BA48, &UberLinear),
    CustomShaderEntryCallback(0x1906BE79, &UberLinear),
    CustomShaderEntryCallback(0x15A063ED, &UberLinear),
    CustomShaderEntryCallback(0x22F1555A, &UberLinear),
    CustomShaderEntryCallback(0xBB09D0B3, &UberLinear),
    CustomShaderEntryCallback(0xB2FA9650, &UberLinear),
    CustomShaderEntryCallback(0x614D4290, &UberLinear),
    CustomShaderEntryCallback(0x333D4088, &UberLinear),
    CustomShaderEntryCallback(0xA1BB94CF, &UberLinear),
    CustomShaderEntryCallback(0xB75D73F2, &UberLinear),
    CustomShaderEntryCallback(0x4892C014, &UberLinear),
    CustomShaderEntryCallback(0x077C4EBE, &UberLinear),
    CustomShaderEntryCallback(0x70F983D7, &UberLinear),
    CustomShaderEntryCallback(0x5808E5C6, &UberLinear),
    CustomShaderEntryCallback(0x3816ADE8, &UberLinear),
    CustomShaderEntryCallback(0x9BD5D660, &UberLinear),
    CustomShaderEntryCallback(0xA57C372D, &UberLinear),
    CustomShaderEntryCallback(0x943DD65F, &UberLinear),
    CustomShaderEntryCallback(0x6BC3D81A, &UberLinear),
    CustomShaderEntryCallback(0x5EE0EFE9, &UberLinear),
    CustomShaderEntryCallback(0x7C36C890, &UberLinear),
    CustomShaderEntryCallback(0x8596AD69, &UberLinear),
    CustomShaderEntryCallback(0x83BB5283, &UberLinear),
    CustomShaderEntryCallback(0x53F75ED5, &UberLinear),
    CustomShaderEntryCallback(0x80C9179E, &UberLinear),
    CustomShaderEntryCallback(0xB8F165EF, &UberLinear),
    CustomShaderEntryCallback(0x34FDFCCA, &UberLinear),
    CustomShaderEntryCallback(0xDE9C4A17, &UberLinear),
    CustomShaderEntryCallback(0x0C95BEDA, &UberLinear),
    CustomShaderEntryCallback(0xCF58B964, &UberLinear),
    CustomShaderEntryCallback(0x44894E92, &UberLinear),
    CustomShaderEntryCallback(0x67BE60E8, &UberLinear),
    CustomShaderEntryCallback(0x57A835DD, &UberLinear),
    CustomShaderEntryCallback(0xEA0DA356, &UberLinear),
    CustomShaderEntryCallback(0xBEF83327, &UberLinear),
    CustomShaderEntryCallback(0xDD53453F, &UberLinear),
    CustomShaderEntryCallback(0xCF4215DF, &UberLinear),
    CustomShaderEntryCallback(0xC228F88E, &UberLinear),
    CustomShaderEntryCallback(0x4A833CC2, &UberLinear),
    CustomShaderEntryCallback(0x1E8BAB2B, &UberLinear),
    CustomShaderEntryCallback(0x00A6DC6D, &UberLinear),
    CustomShaderEntryCallback(0x653DB2AA, &UberLinear),
    CustomShaderEntryCallback(0x620B1A71, &UberLinear),
    CustomShaderEntryCallback(0x75812DD3, &UberLinear),
    CustomShaderEntryCallback(0xFA04705A, &UberLinear),
    CustomShaderEntryCallback(0x3063B396, &UberLinear),
    CustomShaderEntryCallback(0xEC2E44B0, &UberLinear),
    CustomShaderEntryCallback(0x7BB9330C, &UberLinear),
    CustomShaderEntryCallback(0x1618D91F, &UberLinear),
    CustomShaderEntryCallback(0x719D77DA, &UberLinear),
    CustomShaderEntryCallback(0x71969DA6, &UberLinear),
    CustomShaderEntryCallback(0x4B2F7132, &UberLinear),
    CustomShaderEntryCallback(0x82A8E8D5, &UberLinear),
    CustomShaderEntryCallback(0x4492D315, &UberLinear),
    CustomShaderEntryCallback(0x8B0129A4, &UberLinear),
    CustomShaderEntryCallback(0x969ECAC4, &UberLinear),
    CustomShaderEntryCallback(0x309787A8, &UberLinear),
    CustomShaderEntryCallback(0x7F1E137D, &UberLinear),
    CustomShaderEntryCallback(0xA0F1B778, &UberLinear),
    CustomShaderEntryCallback(0x307A97FD, &UberLinear),
    CustomShaderEntryCallback(0xA32B02F0, &UberLinear),
    CustomShaderEntryCallback(0xA6918C83, &UberGamma),
    CustomShaderEntryCallback(0xB68E535D, &UberGamma),
    CustomShaderEntryCallback(0xAE4C1F32, &UberGamma),
    CustomShaderEntryCallback(0x36C8462C, &UberGamma),
    CustomShaderEntryCallback(0x7BF140C8, &UberGamma),
    CustomShaderEntryCallback(0x6C62EB79, &UberGamma),
    CustomShaderEntryCallback(0x6D14DFE7, &UberGamma),
    CustomShaderEntryCallback(0x743B1716, &UberGamma),
    CustomShaderEntryCallback(0xB8273F73, &UberGamma),
    CustomShaderEntryCallback(0x8D662497, &UberGamma),
    CustomShaderEntryCallback(0x96AF3D66, &UberGamma),
    CustomShaderEntryCallback(0x91F65AEA, &UberGamma),
    CustomShaderEntryCallback(0x7721FCA2, &UberGamma),
    CustomShaderEntryCallback(0x014A40C4, &UberGamma),
    CustomShaderEntryCallback(0xD8E61F5F, &UberGamma),
    CustomShaderEntryCallback(0xDE7ECF75, &UberGamma),
    CustomShaderEntryCallback(0xE4BA540E, &UberGamma),
    CustomShaderEntryCallback(0x1CDF4AD9, &UberGamma),
    CustomShaderEntryCallback(0x1D4D40B0, &UberGamma),
    CustomShaderEntryCallback(0x4A87FC29, &UberGamma),
    CustomShaderEntryCallback(0x24D21B11, &UberGamma),
    CustomShaderEntryCallback(0x29B13A00, &UberGamma),
    CustomShaderEntryCallback(0xFAE40278, &UberGamma),
    CustomShaderEntryCallback(0xFC0CC93E, &UberGamma),
    CustomShaderEntryCallback(0xFEECAC6F, &UberGamma),
    CustomShaderEntryCallback(0x319DDF0E, &UberGamma),
    CustomShaderEntryCallback(0xAE1D9195, &UberGamma),
    CustomShaderEntryCallback(0x9048747B, &UberGamma),
    CustomShaderEntryCallback(0x33D922FC, &UberGamma),
    CustomShaderEntryCallback(0xEC8E7025, &UberGamma),
    CustomShaderEntryCallback(0xFA46C05A, &UberGamma),
    CustomShaderEntryCallback(0x83FD887F, &UberGamma),
    CustomShaderEntryCallback(0x728AA1F4, &UberGamma),
    CustomShaderEntryCallback(0x34A63AC7, &UberGamma),
    CustomShaderEntryCallback(0xC494E837, &UberGamma),
    CustomShaderEntryCallback(0xF1A15ADD, &UberGamma),
    CustomShaderEntryCallback(0x3CF9B383, &UberGamma),
    CustomShaderEntryCallback(0x9D87265E, &UberGamma),
    CustomShaderEntryCallback(0x7F8E8E9C, &UberGamma),
    CustomShaderEntryCallback(0x643FA86F, &UberGamma),
    CustomShaderEntryCallback(0x9E3C720E, &UberGamma),
    CustomShaderEntryCallback(0xBF6C7569, &UberGamma),
    CustomShaderEntryCallback(0xB166FD33, &UberGamma),
    CustomShaderEntryCallback(0x5D9AE38B, &UberGamma),
    CustomShaderEntryCallback(0x4712DE01, &UberGamma),
    CustomShaderEntryCallback(0x8DB27254, &UberGamma),
    CustomShaderEntryCallback(0xB9D0A622, &UberGamma),
          // Neutral
    CustomShaderEntryCallback(0x0B383A2F, &UberNeutralLinear),
    CustomShaderEntryCallback(0x6A5ACB6F, &UberNeutralLinear),
    CustomShaderEntryCallback(0x009A1C24, &UberNeutralLinear),
    CustomShaderEntryCallback(0x66C3EBEB, &UberNeutralLinear),
    CustomShaderEntryCallback(0x96A8E4B9, &UberNeutralLinear),
    CustomShaderEntryCallback(0x5217FBA3, &UberNeutralLinear),
    CustomShaderEntryCallback(0x5456BDEE, &UberNeutralLinear),
    CustomShaderEntryCallback(0x8613B876, &UberNeutralLinear),
    CustomShaderEntryCallback(0xA8F6504E, &UberNeutralLinear),
    CustomShaderEntryCallback(0xAC471C80, &UberNeutralLinear),
    CustomShaderEntryCallback(0xAD809271, &UberNeutralLinear),
    CustomShaderEntryCallback(0xC999597C, &UberNeutralLinear),
    CustomShaderEntryCallback(0xE73E4C20, &UberNeutralLinear),
    CustomShaderEntryCallback(0xD5C07171, &UberNeutralLinear),
    CustomShaderEntryCallback(0xF849180D, &UberNeutralLinear),
    CustomShaderEntryCallback(0x312AE5CE, &UberNeutralLinear),
    CustomShaderEntryCallback(0x4CBE7398, &UberNeutralLinear),
    CustomShaderEntryCallback(0x04D5BD3C, &UberNeutralLinear),
    CustomShaderEntryCallback(0x2CAF46E1, &UberNeutralLinear),
    CustomShaderEntryCallback(0x151F7D68, &UberNeutralLinear),
    CustomShaderEntryCallback(0xD0CC8CE2, &UberNeutralLinear),
    CustomShaderEntryCallback(0xC680A959, &UberNeutralLinear),
    CustomShaderEntryCallback(0x692D142C, &UberNeutralGamma),
    CustomShaderEntryCallback(0x0EA73DAA, &UberNeutralGamma),
    CustomShaderEntryCallback(0x5C329C6B, &UberNeutralGamma),
    CustomShaderEntryCallback(0x179468F9, &UberNeutralGamma), // no LUT
    CustomShaderEntryCallback(0xCE6048CA, &UberNeutralGamma), // no LUT
          // ACES
    CustomShaderEntryCallback(0x1C42C445, &UberACESLinear),
    CustomShaderEntryCallback(0x2C36979C, &UberACESLinear),
    CustomShaderEntryCallback(0x4B92CD8E, &UberACESLinear),
    CustomShaderEntryCallback(0xEF39E7C4, &UberACESLinear),
    CustomShaderEntryCallback(0xFDA8A0F6, &UberACESLinear),
    CustomShaderEntryCallback(0x9A27FDCD, &UberACESLinear),
    CustomShaderEntryCallback(0x9D2A9AD7, &UberACESLinear),
    CustomShaderEntryCallback(0x51B31CD0, &UberACESLinear),
    CustomShaderEntryCallback(0x60CD88E9, &UberACESLinear),
    CustomShaderEntryCallback(0x63F63B73, &UberACESLinear),
    CustomShaderEntryCallback(0x65EDD253, &UberACESLinear),
    CustomShaderEntryCallback(0x72D26F35, &UberACESLinear),
    CustomShaderEntryCallback(0x232C3736, &UberACESLinear),
    CustomShaderEntryCallback(0x501CABD3, &UberACESLinear),
    CustomShaderEntryCallback(0x622FF869, &UberACESLinear),
    CustomShaderEntryCallback(0x709B90C7, &UberACESLinear),
    CustomShaderEntryCallback(0x08331DE7, &UberACESLinear),
    CustomShaderEntryCallback(0xA6AFBE57, &UberACESLinear),
    CustomShaderEntryCallback(0xA9329B7F, &UberACESLinear),
    CustomShaderEntryCallback(0xB4323752, &UberACESLinear),
    CustomShaderEntryCallback(0xC9F897D5, &UberACESLinear),
    CustomShaderEntryCallback(0xC593D007, &UberACESLinear),
    CustomShaderEntryCallback(0xD8C3ADEB, &UberACESLinear),
    CustomShaderEntryCallback(0xE651D798, &UberACESLinear),
    CustomShaderEntryCallback(0x6FEECA44, &UberACESLinear),
    CustomShaderEntryCallback(0x6F7A89B5, &UberACESLinear),
    CustomShaderEntryCallback(0x182FA95D, &UberACESLinear),
    CustomShaderEntryCallback(0xC01FA28B, &UberACESLinear),
    CustomShaderEntryCallback(0xB28D0124, &UberACESLinear),
    CustomShaderEntryCallback(0x2C0EA618, &UberACESLinear),
    CustomShaderEntryCallback(0x3B30C94A, &UberACESLinear),
    CustomShaderEntryCallback(0x98999C03, &UberACESLinear),
    CustomShaderEntryCallback(0x65D6A1C7, &UberACESLinear),
    CustomShaderEntryCallback(0x3063B396, &UberACESLinear),
    CustomShaderEntryCallback(0x42A50C71, &UberACESLinear),
    CustomShaderEntryCallback(0x60B48ADF, &UberACESLinear),
    CustomShaderEntryCallback(0x0DE9EBCF, &UberACESLinear),
    CustomShaderEntryCallback(0x9BF686BC, &UberACESLinear),
    CustomShaderEntryCallback(0xE5C37261, &UberACESLinear),
    CustomShaderEntryCallback(0x7B4E81D3, &UberACESLinear),
    CustomShaderEntryCallback(0xE1F3EA92, &UberACESLinear),
    CustomShaderEntryCallback(0xDA822A11, &UberACESLinear),
    CustomShaderEntryCallback(0xE9A455B7, &UberACESLinear),
    CustomShaderEntryCallback(0xF949F5A6, &UberACESLinear),
    CustomShaderEntryCallback(0x230619DF, &UberACESGamma),
    CustomShaderEntryCallback(0x74A3CCC8, &UberACESGamma),
    CustomShaderEntryCallback(0x6695772D, &UberACESGamma),
    CustomShaderEntryCallback(0x822AE84C, &UberACESGamma),
    CustomShaderEntryCallback(0x03F17B55, &UberACESGamma),
    CustomShaderEntryCallback(0x8516BF4C, &UberACESGamma),
    CustomShaderEntryCallback(0x343E55D9, &UberACESGamma),
    CustomShaderEntryCallback(0x0D96CCBA, &UberACESGamma),
      /// Uberpost (HDR internal LUT) ///
        // LUT
    CustomShaderEntryCallback(0xC77C6136, &UberpostLinear),
    CustomShaderEntryCallback(0x8E8030DA, &UberpostLinear),
    CustomShaderEntryCallback(0xF9D83ECD, &UberpostLinear),
    CustomShaderEntryCallback(0x70F25296, &UberpostLinear),
    CustomShaderEntryCallback(0xD25C43B1, &UberpostLinear),
    CustomShaderEntryCallback(0xD4543B6E, &UberpostLinear),
    CustomShaderEntryCallback(0xD86170D7, &UberpostLinear),
    CustomShaderEntryCallback(0xDB814E6C, &UberpostLinear),
    CustomShaderEntryCallback(0xE0D21C32, &UberpostLinear),
    CustomShaderEntryCallback(0xE0E4140C, &UberpostLinear),
    CustomShaderEntryCallback(0xE46F9DE9, &UberpostLinear),
    CustomShaderEntryCallback(0xE279EC1D, &UberpostLinear),
    CustomShaderEntryCallback(0x0EC64D75, &UberpostLinear),
    CustomShaderEntryCallback(0x0F4188A5, &UberpostLinear),
    CustomShaderEntryCallback(0x1BF2161B, &UberpostLinear),
    CustomShaderEntryCallback(0x1E7FFDBB, &UberpostLinear),
    CustomShaderEntryCallback(0x1E66576A, &UberpostLinear),
    CustomShaderEntryCallback(0x1F59543C, &UberpostLinear),
    CustomShaderEntryCallback(0x2EB942D3, &UberpostLinear),
    CustomShaderEntryCallback(0x2F17859B, &UberpostLinear),
    CustomShaderEntryCallback(0x3C71577B, &UberpostLinear),
    CustomShaderEntryCallback(0x3D7D2ACF, &UberpostLinear),
    CustomShaderEntryCallback(0x4A872453, &UberpostLinear),
    CustomShaderEntryCallback(0x9CFC6AFA, &UberpostLinear),
    CustomShaderEntryCallback(0x4C89E2E6, &UberpostLinear),
    CustomShaderEntryCallback(0x4D9C39DC, &UberpostLinear),
    CustomShaderEntryCallback(0x4DD5AD48, &UberpostLinear),
    CustomShaderEntryCallback(0x5A6D38E4, &UberpostLinear),
    CustomShaderEntryCallback(0x5A9A3BCA, &UberpostLinear),
    CustomShaderEntryCallback(0x8C673209, &UberpostLinear),
    CustomShaderEntryCallback(0x9DBEB2FA, &UberpostLinear),
    CustomShaderEntryCallback(0x41CA1DD6, &UberpostLinear),
    CustomShaderEntryCallback(0x69C7EC21, &UberpostLinear),
    CustomShaderEntryCallback(0x116ED5A6, &UberpostLinear),
    CustomShaderEntryCallback(0x404CC9B9, &UberpostLinear),
    CustomShaderEntryCallback(0x599DC26E, &UberpostLinear),
    CustomShaderEntryCallback(0x783ABD54, &UberpostLinear),
    CustomShaderEntryCallback(0x916E68A2, &UberpostLinear),
    CustomShaderEntryCallback(0x995B36D9, &UberpostLinear),
    CustomShaderEntryCallback(0x1666C38C, &UberpostLinear),
    CustomShaderEntryCallback(0x3655F826, &UberpostLinear),
    CustomShaderEntryCallback(0x81198D61, &UberpostLinear),
    CustomShaderEntryCallback(0x99273E5D, &UberpostLinear),
    CustomShaderEntryCallback(0xAB9BAF73, &UberpostLinear),
    CustomShaderEntryCallback(0xBD3E0603, &UberpostLinear),
    CustomShaderEntryCallback(0xBE55DA79, &UberpostLinear),
    CustomShaderEntryCallback(0xBE655D3E, &UberpostLinear),
    CustomShaderEntryCallback(0xC1D1E672, &UberpostLinear),
    CustomShaderEntryCallback(0xD213345E, &UberpostLinear),
    CustomShaderEntryCallback(0xE5994A4B, &UberpostLinear),
    CustomShaderEntryCallback(0xECD0DFE1, &UberpostLinear),
    CustomShaderEntryCallback(0xEF7C8F91, &UberpostLinear),
    CustomShaderEntryCallback(0xF2CB5D37, &UberpostLinear),
    CustomShaderEntryCallback(0xF455EE3C, &UberpostLinear),
    CustomShaderEntryCallback(0xFA2F9A68, &UberpostLinear),
    CustomShaderEntryCallback(0xFC0ECCE8, &UberpostLinear),
    CustomShaderEntryCallback(0xFF4E4EF2, &UberpostLinear),
    CustomShaderEntryCallback(0x6BE60185, &UberpostLinear),
    CustomShaderEntryCallback(0x6D14F22A, &UberpostLinear),
    CustomShaderEntryCallback(0x7E2A04D8, &UberpostLinear),
    CustomShaderEntryCallback(0x9BC48214, &UberpostLinear),
    CustomShaderEntryCallback(0x9CC447BF, &UberpostLinear),
    CustomShaderEntryCallback(0x9DD6F785, &UberpostLinear),
    CustomShaderEntryCallback(0x18DC6A24, &UberpostLinear),
    CustomShaderEntryCallback(0x41B1FF38, &UberpostLinear),
    CustomShaderEntryCallback(0x46D3ECE8, &UberpostLinear),
    CustomShaderEntryCallback(0x63D93240, &UberpostLinear),
    CustomShaderEntryCallback(0x71A4E35E, &UberpostLinear),
    CustomShaderEntryCallback(0x86E67F52, &UberpostLinear),
    CustomShaderEntryCallback(0x272EB112, &UberpostLinear),
    CustomShaderEntryCallback(0x440F1911, &UberpostLinear),
    CustomShaderEntryCallback(0x728A5929, &UberpostLinear),
    CustomShaderEntryCallback(0x808BC2A2, &UberpostLinear),
    CustomShaderEntryCallback(0x957EC72A, &UberpostLinear),
    CustomShaderEntryCallback(0x2706BB7A, &UberpostLinear),
    CustomShaderEntryCallback(0x3087C1DD, &UberpostLinear),
    CustomShaderEntryCallback(0x7213BEF2, &UberpostLinear),
    CustomShaderEntryCallback(0x8135A20B, &UberpostLinear),
    CustomShaderEntryCallback(0x038607D0, &UberpostLinear),
    CustomShaderEntryCallback(0x43621B25, &UberpostLinear),
    CustomShaderEntryCallback(0x063470DC, &UberpostLinear),
    CustomShaderEntryCallback(0xA46C1ECB, &UberpostLinear),
    CustomShaderEntryCallback(0xA34705B5, &UberpostLinear),
    CustomShaderEntryCallback(0xAF565E99, &UberpostLinear),
    CustomShaderEntryCallback(0xAFBE175C, &UberpostLinear),
    CustomShaderEntryCallback(0xB8D14E32, &UberpostLinear),
    CustomShaderEntryCallback(0xB8308863, &UberpostLinear),
    CustomShaderEntryCallback(0xC5D7F1A1, &UberpostLinear),
    CustomShaderEntryCallback(0xC63B24BB, &UberpostLinear),
    CustomShaderEntryCallback(0xCF7B19D4, &UberpostLinear),
    CustomShaderEntryCallback(0x7E2F585E, &UberpostLinear),
    CustomShaderEntryCallback(0x14AC9B94, &UberpostLinear),
    CustomShaderEntryCallback(0x02E86441, &UberpostLinear),
    CustomShaderEntryCallback(0xA42C0E37, &UberpostLinear),
    CustomShaderEntryCallback(0xB4780190, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x83CC7F92, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x2998DD23, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xAE047DF6, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x127B53F7, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x0733A496, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x10D74361, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xADFD88AD, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x95B85C10, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x6C71F0B5, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xC2976820, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x4069CE6C, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x134700A7, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xB39F3D8A, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x7CA9D945, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x4233DBE0, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x8C592D8D, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xE76D5295, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x9DF20CC3, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x07D3D894, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x9B813389, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xF09D3285, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x2781E558, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x0E7B6A15, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x06D31F1D, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x36303D11, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x0E883404, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xA9DCD389, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x5839BFE1, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xC01E64C3, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x8429CE0B, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x69FE571B, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x07E6710E, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x5C913D88, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x65113B28, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xADCCB7BB, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xF5C4F3FE, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x721D4F40, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xB9579276, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x450C7E5A, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xC1639FBF, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x5FFE3248, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x2E10432D, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x6ECE071D, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xBE6E7005, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0xFDC03846, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x4D2B6B11, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x4B537637, &UberpostLinear), // user LUT
    CustomShaderEntryCallback(0x9CB51433, &UberpostLinear),
    CustomShaderEntryCallback(0x18486417, &UberpostLinear),
    CustomShaderEntryCallback(0x505A6061, &UberpostLinear),
    CustomShaderEntryCallback(0xC783A02A, &UberpostLinear),
    CustomShaderEntryCallback(0xA2FE36C0, &UberpostLinear),
    CustomShaderEntryCallback(0xE9243462, &UberpostLinear),
    CustomShaderEntryCallback(0x2E293919, &UberpostLinear),
    CustomShaderEntryCallback(0x82AF3065, &UberpostLinear),
    CustomShaderEntryCallback(0x666FB3A8, &UberpostLinear),
    CustomShaderEntryCallback(0xD924189F, &UberpostLinear),
    CustomShaderEntryCallback(0x86D12314, &UberpostLinear),
    CustomShaderEntryCallback(0x37EE06EC, &UberpostLinear),
    CustomShaderEntryCallback(0x71F55427, &UberpostLinear),
    CustomShaderEntryCallback(0x17771A6C, &UberpostLinear),
    CustomShaderEntryCallback(0xCFEEF3DE, &UberpostLinear),
    CustomShaderEntryCallback(0x9F35FFF7, &UberpostLinear),
    CustomShaderEntryCallback(0xDFF706F5, &UberpostLinear),
    CustomShaderEntryCallback(0xE3C1F14A, &UberpostLinear),
    CustomShaderEntryCallback(0x0CA6FA43, &UberpostGamma),
    CustomShaderEntryCallback(0x06C7255C, &UberpostGamma),
    CustomShaderEntryCallback(0x30E315A6, &UberpostGamma),
    CustomShaderEntryCallback(0x06EEEE16, &UberpostGamma),
    CustomShaderEntryCallback(0x6F30CACB, &UberpostGamma),
    CustomShaderEntryCallback(0x32B27DC5, &UberpostGamma),
    CustomShaderEntryCallback(0x58F9D31B, &UberpostGamma),
    CustomShaderEntryCallback(0x78EF9B01, &UberpostGamma),
    CustomShaderEntryCallback(0x0105BFBA, &UberpostGamma),
    CustomShaderEntryCallback(0x177B85BE, &UberpostGamma),
    CustomShaderEntryCallback(0x478DF3D8, &UberpostGamma),
    CustomShaderEntryCallback(0x5616E459, &UberpostGamma),
    CustomShaderEntryCallback(0x15032A70, &UberpostGamma),
    CustomShaderEntryCallback(0xB4FCC459, &UberpostGamma),
    CustomShaderEntryCallback(0xBEDE7F5E, &UberpostGamma),
    CustomShaderEntryCallback(0xC3DC274E, &UberpostGamma),
    CustomShaderEntryCallback(0xC8C2F1A0, &UberpostGamma),
    CustomShaderEntryCallback(0xDF21D66E, &UberpostGamma),
    CustomShaderEntryCallback(0xD32FF805, &UberpostGamma),
    CustomShaderEntryCallback(0xEB0157F3, &UberpostGamma),
    CustomShaderEntryCallback(0xEC929462, &UberpostGamma),
    CustomShaderEntryCallback(0x10A31D94, &UberpostGamma),
    CustomShaderEntryCallback(0xD0CC549E, &UberpostGamma),
    CustomShaderEntryCallback(0x164B94AF, &UberpostGamma),
    CustomShaderEntryCallback(0x9326C2CF, &UberpostGamma),
    CustomShaderEntryCallback(0x8C10BEAF, &UberpostGamma),
    CustomShaderEntryCallback(0x86692346, &UberpostGamma),
    CustomShaderEntryCallback(0xECD72BE5, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x5A18ED06, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0xD1E36C9E, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x778CFAC9, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x0F750BE1, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x1C581A77, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0xBD32C87E, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x3BB091D1, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x351B1F11, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0xE127B526, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0xD0045A15, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x6134CFC2, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x6B9C2610, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0xB82B9879, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x6E3B0BB9, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x5AA3D681, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x1DE54A2D, &UberpostGamma),    // user LUT
    CustomShaderEntryCallback(0x3BF59C8D, &Uberpost),       // linear/gamma (cbuffer)
    CustomShaderEntryCallback(0x6073A121, &Uberpost),       // linear/gamma (cbuffer)
    CustomShaderEntryCallback(0x664C7B0C, &Uberpost),       // linear/gamma (cbuffer)
    CustomShaderEntryCallback(0xABB348D3, &Uberpost),       // linear/gamma (cbuffer)
        // No LUT (unknown)       // TO DO: CHECK
    CustomShaderEntryCallback(0x9E21F0DF, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x34A4537A, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x92C3775F, &CountLinear),
    CustomShaderEntryCallback(0x4757CDEB, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x3E60912E, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xA8773EA9, &CountLinear),
    CustomShaderEntryCallback(0x53DF7115, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x56C90ED5, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x70EEA44B, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x6946B0AB, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x79295705, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xC7B8A4A1, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xE9177A14, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xF89DA645, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xF180FFF6, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xFF444EF2, &CountGammaTonemap1),
    CustomShaderEntryCallback(0x4CEC1E87, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xB47EF759, &CountLinearTonemap1),
    CustomShaderEntryCallback(0xBFCFF9BC, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xD12C9D2F, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xEAD9C39B, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xF25F3D34, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xF95C788E, &CountLinearTonemap1),
    CustomShaderEntryCallback(0x6DD82EF0, &CountLinearTonemap1),  // Uberpost
    CustomShaderEntryCallback(0xC25C244C, &CountLinearTonemap1),  // Uberpost
    CustomShaderEntryCallback(0x9DA6D2DA, &CountLinearTonemap1),  // Uberpost
    CustomShaderEntryCallback(0x83B430B4, &CountLinearTonemap1),  // Uberpost
    CustomShaderEntryCallback(0x93281DC0, &CountLinearTonemap1),  // Uberpost
    CustomShaderEntryCallback(0xD633A7EE, &CountGammaTonemap1),
    CustomShaderEntryCallback(0xED61F24A, &CountGammaTonemap1),
    // 0x2365EDDF
    // 0x455563C6

    CustomShaderEntryCallback(0xEBC7375B, &CountLinear),
    CustomShaderEntryCallback(0x5C428D81, &CountLinear),
      /// Uber weird ///
        // Sapphire (Windbound)
    CustomShaderEntryCallback(0x2B0930CC, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x8D4D9A63, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x8DF1BF80, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x14A5B821, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x15E132D9, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x171A0A90, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x85653627, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xAE663C8F, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xBA4DCC6E, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xE01E2588, &CountLinearTonemap2),
        // Neutral
    CustomShaderEntryCallback(0x794570B1, &CountLinearTonemap2),  // Unlit Composite
        // Beautify
    CustomShaderEntryCallback(0xECBDB4D4, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xBF6B8004, &CountLinearTonemap2),  // LUT
    CustomShaderEntryCallback(0x33BF2974, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xB046A9EB, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x4483E5EF, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x18174CED, &CountLinearTonemap2),
    CustomShaderEntryCallback(0x833594DC, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xC224A268, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xCD56DC9B, &CountLinearTonemap2),
    CustomShaderEntryCallback(0xD70BBE87, &CountLinearTonemap3),
        // No Tonemap
    
    CustomShaderEntryCallback(0x49E25D6C, [](reshade::api::command_list* cmd_list) {    // BlitCopy
    blitCopyCheck = 1.f;
    unityTonemapper = shader_injection.blitCopyHack == 1.f ? (unityTonemapper <= 1.f ? 1 : unityTonemapper) : unityTonemapper;
    countMid += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.countNew += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.count2New += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    count2Mid += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    return true;
    }),
    CustomShaderEntryCallback(0x8674BE1F, [](reshade::api::command_list* cmd_list) {    // BlitCopy
    blitCopyCheck = 1.f;
    unityTonemapper = shader_injection.blitCopyHack == 1.f ? (unityTonemapper <= 1.f ? 1 : unityTonemapper) : unityTonemapper;
    countMid += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.countNew += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.count2New += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    count2Mid += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    return true;
    }),
    CustomShaderEntryCallback(0x1FDE7AD7, [](reshade::api::command_list* cmd_list) {    // Universal CoreBlit
    blitCopyCheck = 1.f;
    unityTonemapper = shader_injection.blitCopyHack == 1.f ? (unityTonemapper <= 1.f ? 1 : unityTonemapper) : unityTonemapper;
    countMid += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.countNew += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.count2New += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    count2Mid += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    return true;
    }),
    /*CustomShaderEntryCallback(0x440EAE28, [](reshade::api::command_list* cmd_list) {    // URP Blit
    blitCopyCheck = 1.f;
    unityTonemapper = shader_injection.blitCopyHack == 1.f ? (unityTonemapper <= 1.f ? 1 : unityTonemapper) : unityTonemapper;
    countMid += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.countNew += shader_injection.blitCopyHack >= 1.f ? 1.f : 0.f;
    shader_injection.count2New += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    count2Mid += shader_injection.blitCopyHack == 1.f ? 1.f : 0.f;
    return true;
    }),*/
    //CustomShaderEntryCallback(0xDA7FDEFA, &CountLinear),
    /*CustomShaderEntryCallback(0x2E658124, [](reshade::api::command_list* cmd_list) {    // scion combination pass
    unityTonemapper = 2;
    countMid += 1.f;
    shader_injection.countNew += 1.f;
    return true;
    }),*/
    ////// UBER END //////
    ////// POSTFINAL START //////
      // 
    CustomShaderEntryCallback(0x1EF2268F, &CountLinear),  
    CustomShaderEntryCallback(0x366EE13E, &CountLinear),
    CustomShaderEntryCallback(0xD90A4513, &CountGamma),
    CustomShaderEntryCallback(0xAEE78EFC, &CountGamma),      // BlitSpace
    CustomShaderEntryCallback(0xFD37FE01, &CountGamma),      // BlitSpace
    CustomShaderEntryCallback(0x4AF45563, &CountLinear),      // BlitSpace
      // FXAA
    CustomShaderEntryCallback(0x0D7738C5, &CountLinear),
    CustomShaderEntryCallback(0x3E0783E6, &CountLinear),
    CustomShaderEntryCallback(0x0175C0E5, &CountLinear),
    CustomShaderEntryCallback(0x5CC458E2, &CountLinear),
    CustomShaderEntryCallback(0x623A834B, &CountLinear),
    CustomShaderEntryCallback(0x83775429, &CountLinear),
    CustomShaderEntryCallback(0xA95311EA, &CountLinear),
    CustomShaderEntryCallback(0xABF2B519, &CountLinear),
    CustomShaderEntryCallback(0xB2E77E10, &CountLinear),
    CustomShaderEntryCallback(0xB13A3CBB, &CountLinear),
    CustomShaderEntryCallback(0xCC8B6ACF, &CountLinear),
    CustomShaderEntryCallback(0xD00B5B47, &CountLinear),
    CustomShaderEntryCallback(0xDCD2C9A2, &CountLinear),
    CustomShaderEntryCallback(0xE6835798, &CountLinear),
    CustomShaderEntryCallback(0x0D8F51E1, &CountLinear),
    CustomShaderEntryCallback(0x0D090F81, &CountLinear),
    CustomShaderEntryCallback(0xEFA7823D, &CountLinear),
    CustomShaderEntryCallback(0xA978F0C8, &CountGamma),
    CustomShaderEntryCallback(0xD19EDE35, &CountGamma),
    CustomShaderEntryCallback(0xF8281A99, &CountGamma),
    CustomShaderEntryCallback(0xAF2362F1, &CountGamma),
      // postFX AA
    CustomShaderEntryCallback(0x0366C4CE, &CountLinear),
    CustomShaderEntryCallback(0xF4CA60E0, &CountLinear),
    CustomShaderEntryCallback(0x53E384E8, &CountLinear),
    CustomShaderEntryCallback(0x6C84328D, &CountLinear),
    CustomShaderEntryCallback(0x22216D01, &CountLinear),
    CustomShaderEntryCallback(0x8C0BCB63, &CountLinear),
    CustomShaderEntryCallback(0xA52F70F8, &CountLinear),
    CustomShaderEntryCallback(0x9E60BC82, &CountLinearTonemap1),
      // Unknown space
    CustomShaderEntryCallback(0x9E4CBF41, &Count),
    CustomShaderEntryCallback(0x4528B1BE, &Count),
    CustomShaderEntryCallback(0xA559F61E, &Count),
      // rcas
    CustomShaderEntryCallback(0x7CEF5F47, &CountLinear),
    CustomShaderEntryCallback(0x7DD6578D, &CountLinear),
    CustomShaderEntryCallback(0x7E3B8386, &Count),    // (LBA TQ)
    CustomShaderEntryCallback(0x08B68C4E, &CountLinear),
    CustomShaderEntryCallback(0x72E35D2A, &CountLinear),
    CustomShaderEntryCallback(0x1609F94E, &CountLinear),
    CustomShaderEntryCallback(0xE96B977C, &CountLinear),
    CustomShaderEntryCallback(0x1F20DEB9, &Count),
      // scaling setup
    CustomShaderEntryCallback(0xC244242D, &Fsr1),
    CustomShaderEntryCallback(0xE102D2F9, &Fsr1),
    CustomShaderEntryCallback(0x7D998063, &Fsr1),
    CustomShaderEntryCallback(0x3110C812, &Fsr1),
    CustomShaderEntryCallback(0x4B3AB0A4, &Fsr1),
    CustomShaderEntryCallback(0xACBB0668, &Fsr1),
    CustomShaderEntryCallback(0x0D4651C9, &CountLinear),      // gamesfarm postfx
    CustomShaderEntryCallback(0x0299214E, &CountLinear),      // gamesfarm postfx
    CustomShaderEntryCallback(0x244A72BB, &CountLinear),      // gamesfarm postfx
    fsr1NoReplace(0xFC718347),    // EASU (LBA)
    CustomShaderEntryCallback(0xC32E5F94, &Count),    // HxVolumetricApply
    ////// POSTFINAL END    //////
    ////// LUTBUILDER START //////
      /// 2D Baker ///
    CustomShaderEntryCallback(0x6BA3776A, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xDE54BEC4, &LutBuilderTonemap1),   // TLD merger
        // user LUT
    CustomShaderEntryCallback(0x425A05B0, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xA7199AE8, &LutBuilderTonemap1),
      /// 3D Baker ///
        // No Tonemap
    CustomShaderEntryCallback(0x34EF56B6, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x995B320A, &LutBuilderTonemap1),
        // Neutral
    CustomShaderEntryCallback(0xBE750C14, &LutBuilderTonemap2),
    CustomShaderEntryCallback(0xC0683CB5, &LutBuilderTonemap2),
    CustomShaderEntryCallback(0xB79884AA, &LutBuilderTonemap2),
        // ACES
    CustomShaderEntryCallback(0x0D6DE82C, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0x5B6D435F, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0x6EA48EC8, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0x47A1239F, &LutBuilderTonemap3),
        // Custom
    CustomShaderEntryCallback(0x9192FB27, &LutBuilderTonemap2),
      /// Post Fx Lut Generator ///
        // No Tonemap
    CustomShaderEntryCallback(0x30261E46, &SneakyBuilderTonemap1),
    CustomShaderEntryCallback(0x38B119B1, &SneakyBuilderTonemap1),
    CustomShaderEntryCallback(0x09E8D72B, &SneakyBuilderTonemap1),
        // Neutral (variable parameters)
    CustomShaderEntryCallback(0x6A8BFC0E, &SneakyBuilderTonemap2),
    CustomShaderEntryCallback(0x3F73DF46, &SneakyBuilderTonemap2),
    CustomShaderEntryCallback(0xFE6C02F9, &SneakyBuilderTonemap2),
        // ACES
    CustomShaderEntryCallback(0xF70A0EED, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0x33891579, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0x65D3755B, &SneakyBuilderTonemap3),
      /// Builder 3D ///
        // No Tonemap
    CustomShaderEntryCallback(0xE6786595, &SneakyBuilderTonemap1),
    CustomShaderEntryCallback(0x5BD02347, &SneakyBuilderTonemap1),
        // Neutral
    CustomShaderEntryCallback(0x7E72688E, &SneakyBuilderTonemap2),
    CustomShaderEntryCallback(0x61FFF3FD, &SneakyBuilderTonemap2),
    CustomShaderEntryCallback(0xD849047B, &SneakyBuilderTonemap2),
        // ACES
    CustomShaderEntryCallback(0x7F27D36D, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0x17CE181A, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0x3661DD34, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0x3917A841, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0x6811A33B, &SneakyBuilderTonemap3),
    CustomShaderEntryCallback(0xF5AC76A9, &SneakyBuilderTonemap3),
        // Custom
    CustomShaderEntryCallback(0x3B4291E8, &SneakyBuilderTonemap2),
    CustomShaderEntryCallback(0x7D343D34, &SneakyBuilderTonemap2),
    //CustomShaderEntryCallback(0x534F0886, &Tonemap2),
      /// Builder Hdr ///
        // No Tonemap
    CustomShaderEntryCallback(0x6C5FFF35, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x9B213AF8, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x39CEB40A, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x404D05C7, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x508ABDBD, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x20D6EA4D, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x8576F73A, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x04F466E8, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xD73B437F, &LutBuilderTonemap1),
        // Neutral
    CustomShaderEntryCallback(0x6C506E30, &LutBuilderTonemap2),
    CustomShaderEntryCallback(0x819CADDA, &LutBuilderTonemap2),
    CustomShaderEntryCallback(0x850A0BF8, &LutBuilderTonemap2),
    CustomShaderEntryCallback(0x15F8BFBD, &LutBuilderTonemap2),
    CustomShaderEntryCallback(0x1F81C511, &LutBuilderTonemap2), // custom params
        // ACES
    CustomShaderEntryCallback(0x5E10541B, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0x13A5D726, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0x31B52561, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0x042C6BD1, &LutBuilderTonemap3),    
    CustomShaderEntryCallback(0x64B708E6, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0xCE436C36, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0xE6EC2E40, &LutBuilderTonemap3),
    CustomShaderEntryCallback(0xAE8C0E90, &LutBuilderTonemap3),
      /// Builder Ldr ///
    CustomShaderEntryCallback(0x62F196B6, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x48B66B90, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x13EEF169, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x085F1ADA, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x731B4F3C, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x562744E8, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x574581C7, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xB3DF43CA, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xDA75BEB5, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xED457D04, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xFFA5BFB6, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xE736DD70, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x453D9983, &LutBuilderTonemap1),
      // GenUberLut
    CustomShaderEntryCallback(0x894B73C7, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xDA07C0CD, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xEFB0C6F3, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xCD470040, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x94FB997A, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x21D72E29, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x6E73582E, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xD86138D0, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0x387E19AA, &LutBuilderTonemap1),
    CustomShaderEntryCallback(0xE23B9B48, &LutBuilderTonemap1),
    /*CustomShaderEntryCallback(0xFBC5BA43, [](reshade::api::command_list* cmd_list) {      // AgX...
    unityTonemapper = 3;
    return true;
    }),*/
    /*CustomShaderEntryCallback(0xB1ACA37F, [](reshade::api::command_list* cmd_list) {    // tonemap-colorgrading (hejl-dawson)
    unityTonemapper = 2;
    countMid += 1.f;
    shader_injection.countNew += 1.f;
    return true;
    }),*/
    //__ALL_CUSTOM_SHADERS,
};

renodx::mods::shader::CustomShaders other_shaders = {
    __ALL_CUSTOM_SHADERS,
};

float current_settings_mode = 0;
renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Simple", "Intermediate", "Advanced"},
        .tint = 0xDB9D47,
        .is_global = true,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapType",
        .binding = &shader_injection.toneMapType,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .can_reset = true,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "None", "Frostbite", "RenoDRT (Reinhard)", "DICE"},
        .tint = 0x38F6FC,
        .is_visible = []() { return settings[0]->GetValue() >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapPeakNits",
        .binding = &shader_injection.toneMapPeakNits,
        .default_value = 1000.f,
        .can_reset = false,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .tint = 0x38F6FC,
        .min = 48.f,
        .max = 4000.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 2.f; },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapGameNits",
        .binding = &shader_injection.toneMapGameNits,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .tint = 0x38F6FC,
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapUINits",
        .binding = &shader_injection.toneMapUINits,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .tint = 0x38F6FC,
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapGammaCorrection",
        .binding = &shader_injection.toneMapGammaCorrection,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a display EOTF.",
        .labels = {"Off", "2.2", "BT.1886"},
        .tint = 0x38F6FC,
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapPerChannel",
        .binding = &shader_injection.toneMapPerChannel,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "Scaling",
        .section = "Tone Mapping",
        .tooltip = "Luminance scales colors consistently while per-channel saturates and blows out sooner",
        .labels = {"Luminance", "Per Channel"},
        .tint = 0x38F6FC,
        .is_enabled = []() { return shader_injection.toneMapType >= 3.f; },
        .is_visible = []() { return current_settings_mode >= 2 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapColorSpace",
        .binding = &shader_injection.toneMapColorSpace,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .label = "Working Color Space",
        .section = "Tone Mapping",
        .labels = {"BT709", "BT2020", "AP1"},
        .tint = 0x38F6FC,
        .is_enabled = []() { return shader_injection.toneMapType >= 3.f; },
        .is_visible = []() { return current_settings_mode >= 2 && shader_injection.tonemapCheck == 3.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueProcessor",
        .binding = &shader_injection.toneMapHueProcessor,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Hue Processor",
        .section = "Tone Mapping",
        .labels = {"OKLab", "ICtCp", "darktable UCS"},
        .tint = 0x38F6FC,
        .is_enabled = []() { return shader_injection.toneMapType >= 3.f; },
        .is_visible = []() { return current_settings_mode >= 2 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueShift",
        .binding = &shader_injection.toneMapHueShift,
        .default_value = 50.f,
        .label = "Hue Shift",
        .section = "Tone Mapping",
        .tooltip = "Hue-shift emulation strength.",
        .tint = 0x38F6FC,
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 3.f && shader_injection.toneMapPerChannel == 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueCorrection",
        .binding = &shader_injection.toneMapHueCorrection,
        .default_value = 0.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tint = 0x38F6FC,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapShoulderStart",
        .binding = &shader_injection.toneMapShoulderStart,
        .default_value = 1.f,
        .label = "Rolloff/Shoulder Start",
        .section = "Tone Mapping",
        .tint = 0x38F6FC,
        .max = 1.f,
        .format = "%.2f",
        .is_visible = []() { return (shader_injection.toneMapType == 2.f || shader_injection.toneMapType == 5.f) && (abs(shader_injection.tonemapCheck) == 1.f); },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeExposure",
        .binding = &shader_injection.colorGradeExposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 2.f,
        .format = "%.2f",
        .is_visible = []() { return current_settings_mode >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeHighlights",
        .binding = &shader_injection.colorGradeHighlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeShadows",
        .binding = &shader_injection.colorGradeShadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >=1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeContrast",
        .binding = &shader_injection.colorGradeContrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeSaturation",
        .binding = &shader_injection.colorGradeSaturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeBlowout",
        .binding = &shader_injection.colorGradeBlowout,
        .default_value = 50.f,
        .label = "Highlights Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlights color.",
        .tint = 0x452F7A,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 2.f; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeDechroma",
        .binding = &shader_injection.colorGradeDechroma,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .tint = 0x452F7A,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeFlare",
        .binding = &shader_injection.colorGradeFlare,
        .default_value = 25.f,
        .label = "Flare",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType == 3.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeClip",
        .binding = &shader_injection.colorGradeClip,
        .default_value = 0.f,
        .label = "Clipping",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType == 3.f; },
        .parse = [](float value) { return value; },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeInternalLUTStrength",
        .binding = &shader_injection.colorGradeInternalLUTStrength,
        .default_value = 100.f,
        .label = "Internal LUT Strength",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .is_enabled = []() { return InternalLutCheck != 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeInternalLUTScaling",
        .binding = &shader_injection.colorGradeInternalLUTScaling,
        .default_value = 0.f,
        .label = "Internal LUT Scaling",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .is_enabled = []() { return InternalLutCheck != 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeInternalLUTShaper",
        .binding = &shader_injection.colorGradeInternalLUTShaper,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "LUT Shaper",
        .section = "Color Grading",
        .labels = {"Vanilla", "PQ"},
        .tint = 0x452F7A,
        .is_enabled = []() { return InternalLutCheck != 0.f; },
        .is_visible = []() { return current_settings_mode >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeUserLUTStrength",
        .binding = &shader_injection.colorGradeUserLUTStrength,
        .default_value = 100.f,
        .label = "User LUT Strength",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeUserLUTScaling",
        .binding = &shader_injection.colorGradeUserLUTScaling,
        .default_value = 0.f,
        .label = "User LUT Scaling",
        .section = "Color Grading",
        .tint = 0x452F7A,
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 2 && shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeLUTSampling",
        .binding = &shader_injection.colorGradeLUTSampling,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "LUT Sampling",
        .section = "Color Grading",
        .labels = {"Vanilla", "Tetrahedral"},
        .tint = 0x452F7A,
        .is_visible = []() { return current_settings_mode >= 2; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeColorSpace",
        .binding = &shader_injection.colorGradeColorSpace,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Output Color Space",
        .section = "Color Grading",
        .tooltip = "Emulates display color temperature."
                   "\nOff for BT.709 D65."
                   "\nJPN Modern for BT.709 D93."
                   "\nJPN CRT for BT.601 ARIB-TR-B9 D93."
                   "\nJPN CRT 2 for BT.601 ARIB-TR-B9 9300k 27 MPCD."
                   "\nUS CRT for BT.601 (NTSC-U).",
        .labels = {"Off", "JPN Modern", "JPN CRT", "JPN CRT 2", "US CRT"},
        .tint = 0x452F7A,
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "fxBloom",
        .binding = &shader_injection.fxBloom,
        .default_value = 50.f,
        .label = "Bloom",
        .section = "Effects",
        .tint = 0x4D7180,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "fxCA",
        .binding = &shader_injection.fxCA,
        .default_value = 50.f,
        .label = "Chromatic Aberration",
        .section = "Effects",
        .tint = 0x4D7180,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "fxVignette",
        .binding = &shader_injection.fxVignette,
        .default_value = 50.f,
        .label = "Vignette",
        .section = "Effects",
        .tint = 0x4D7180,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "fxNoise",
        .binding = &shader_injection.fxNoise,
        .default_value = 50.f,
        .label = "Dithering Noise",
        .section = "Effects",
        .tint = 0x4D7180,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "fxFilmGrain",
        .binding = &shader_injection.fxFilmGrain,
        .default_value = 50.f,
        .label = "Film Grain",
        .section = "Effects",
        .tint = 0x4D7180,
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "fxFilmGrainType",
        .binding = &shader_injection.fxFilmGrainType,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Film Grain Type",
        .section = "Effects",
        .labels = {"Vanilla", "Perceptual"},
        .tint = 0x4D7180,
        .is_visible = []() { return current_settings_mode >= 1; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset",
        .section = "Color Grading Templates",
        .group = "button-line-1",
        .tint = 0xDB9D47,
        .on_change = []() {
          renodx::utils::settings::UpdateSetting("toneMapType", 3.f);
          renodx::utils::settings::UpdateSetting("toneMapPerChannel", 1.f);
          renodx::utils::settings::UpdateSetting("toneMapColorSpace", 2.f);
          renodx::utils::settings::UpdateSetting("toneMapHueProcessor", 1.f);
          renodx::utils::settings::UpdateSetting("toneMapHueShift", 50.f);
          renodx::utils::settings::UpdateSetting("toneMapHueCorrection", 0.f);
          renodx::utils::settings::UpdateSetting("toneMapShoulderStart", 1.f);
          renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.f);
          renodx::utils::settings::UpdateSetting("colorGradeHighlights", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeShadows", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeContrast", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeSaturation", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeBlowout", 50.f);
          renodx::utils::settings::UpdateSetting("colorGradeDechroma", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeFlare", 25.f);
          renodx::utils::settings::UpdateSetting("colorGradeClip", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeInternalLUTStrength", 100.f);
          renodx::utils::settings::UpdateSetting("colorGradeInternalLUTScaling", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeInternalLUTShaper", 1.f);
          renodx::utils::settings::UpdateSetting("colorGradeUserLUTStrength", 100.f);
          renodx::utils::settings::UpdateSetting("colorGradeUserLUTScaling", 0.f);
          renodx::utils::settings::UpdateSetting("colorGradeLUTSampling", 1.f);
        },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "AutoHDR Look",
        .section = "Color Grading Templates",
        .group = "button-line-1",
        .tint = 0x452F7A,
        .on_change = []() {
          renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.27f);
          renodx::utils::settings::UpdateSetting("colorGradeContrast", 55.f);
        },
        .is_visible = []() { return shader_injection.tonemapCheck != 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Tonemap and color grading are currently not tweakable in real time."
                 "\nAny change will only take effect next time LUT is generated.",
        .section = "About",
        .tint = 0x38F6FC,
        .is_visible = []() { return InternalLutCheck == 4.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Version: " + std::string(renodx::utils::date::ISO_DATE),
        .section = "About",
        .tooltip = std::string(__DATE__),
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Discord",
        .section = "Links",
        .group = "button-line-2",
        .tooltip = "RenoDX server",
        .tint = 0x5865F2,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://discord.gg/F6AU", "TeWJHM"); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-2",
        .tooltip = "RenoDX repository",
        .on_change = []() { renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx"); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Support",
        .section = "Links",
        .group = "button-line-2",
        .tooltip = "Voosh' Ko-Fi",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/notvoosh"); settings[40]->label = "<3"; },
    },
    new renodx::utils::settings::Setting{
        .key = "rolloffUI",
        .binding = &shader_injection.rolloffUI,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = false,
        .label = "UI Behavior",
        .section = "Compatibility",
        .tooltip = "Only affects a few selected shaders",
        .labels = {"Do nothing", "Rolloff", "Clamp (sdr)"},
        .tint = 0x1C1C3C,
        .is_visible = []() { return current_settings_mode >= 2; },
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("toneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("toneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGammaCorrection", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("colorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeInternalLUTStrength", 100.f);
  renodx::utils::settings::UpdateSetting("colorGradeInternalLUTScaling", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeInternalLUTShaper", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeUserLUTStrength", 100.f);
  renodx::utils::settings::UpdateSetting("colorGradeUserLUTScaling", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeLUTSampling", 0.f);
  renodx::utils::settings::UpdateSetting("colorGradeColorSpace", 0.f);
  renodx::utils::settings::UpdateSetting("fxBloom", 50.f);
  renodx::utils::settings::UpdateSetting("fxVignette", 50.f);
  renodx::utils::settings::UpdateSetting("fxCA", 50.f);
  renodx::utils::settings::UpdateSetting("fxNoise", 50.f);
  renodx::utils::settings::UpdateSetting("fxFilmGrain", 50.f);
  renodx::utils::settings::UpdateSetting("fxFilmGrainType", 0.f);
}

void AddTGTFoAUpgrades() {
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_typeless,
          .ignore_size = false,
          .usage_include = reshade::api::resource_usage::render_target,
          .usage_exclude = reshade::api::resource_usage::unordered_access | reshade::api::resource_usage::undefined,
      });
}

void AddGamePatches() {
  auto process_path = renodx::utils::platform::GetCurrentProcessPath();
  auto filename = process_path.filename().string();
  auto product_name = renodx::utils::platform::GetProductName(process_path);
  if (filename == "Fall of Avalon.exe") {
    AddTGTFoAUpgrades();
  } else if(filename == "Ultros.exe" || filename == "Batbarian Testament of the Primordials.exe"
    || filename == "nslt.exe" || filename == "AuRevoir.exe" || filename == "ShootasBloodAndTeef.exe"
  || filename == "Copycat.exe" || filename == "Make Way.exe" || filename == "Digimon World Next Order.exe"
  || filename == "Quern.exe" || filename == "reverse1999.exe"){
    shader_injection.isClamped = 2.f;
    } else if(filename == "It Steals.exe"){
    shader_injection.isClamped = 3.f;
  } else {
    return;
  }
  reshade::log::message(reshade::log::level::info, std::format("Applied patches for {} ({}).", filename, product_name).c_str());
}


const std::unordered_map<std::string, reshade::api::format> UPGRADE_TARGETS_TYPELESS = {
    {"R8G8B8A8_TYPELESS", reshade::api::format::r8g8b8a8_typeless},
    {"R10G10B10A2_TYPELESS", reshade::api::format::r10g10b10a2_typeless},
    {"R16G16B16A16_TYPELESS", reshade::api::format::r16g16b16a16_typeless},
    {"B8G8R8A8_TYPELESS", reshade::api::format::b8g8r8a8_typeless},
};

const std::unordered_map<std::string, reshade::api::format> UPGRADE_TARGETS = {
    {"R11G11B10_FLOAT", reshade::api::format::r11g11b10_float},
    {"R8G8B8A8_UNORM", reshade::api::format::r8g8b8a8_unorm},
    {"B8G8R8A8_UNORM", reshade::api::format::b8g8r8a8_unorm},
    {"R8G8B8A8_SNORM", reshade::api::format::r8g8b8a8_snorm},
    {"R8G8B8A8_UNORM_SRGB", reshade::api::format::r8g8b8a8_unorm_srgb},
    {"B8G8R8A8_UNORM_SRGB", reshade::api::format::b8g8r8a8_unorm_srgb},
    {"R10G10B10A2_UNORM", reshade::api::format::r10g10b10a2_unorm},
    {"B10G10R10A2_UNORM", reshade::api::format::b10g10r10a2_unorm},
};

const auto UPGRADE_TYPE_NONE = 0.f;
const auto UPGRADE_TYPE_OUTPUT_SIZE = 1.f;
const auto UPGRADE_TYPE_OUTPUT_RATIO = 2.f;
const auto UPGRADE_TYPE_ANY = 3.f;

const std::unordered_map<
    std::string,                             // Filename or ProductName
    std::unordered_map<std::string, float>>  // {Key, Value}
    GAME_DEFAULT_SETTINGS = {
        {
            "AI-LIMIT.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R8G8B8A8_UNORM", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R8G8B8A8_UNORM_SRGB", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R11G11B10_FLOAT", UPGRADE_TYPE_OUTPUT_RATIO},
            },
        },
        {
            "BattleTech.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Scaling_Offset", 1.f},
                {"Use_Swapchain_Proxy", 1.f},
            },
        },
        {
            "Bendy - Lone Wolf.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_ANY},
                {"Swapchain_Encoding", 1.f},
                {"Blit_Copy_Hack", 0.f},
            },
        },
        {
            "Diplomacy is Not an Option.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_ANY},
                {"Upgrade_R11G11B10_FLOAT", UPGRADE_TYPE_ANY},
                {"Blit_Copy_Hack", 3.f},
            },
        },
        {
            "Fall of Avalon.exe",
            {
                {"Upgrade_R11G11B10_FLOAT", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "KingdomsAndCastles.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_ANY},
                {"Swapchain_Encoding", 1.f},
                {"Scaling_Offset", 1.f},
                {"Tonemap_Offset", 1.f},
                {"Blit_Copy_Hack", 2.f},
            },
        },
        {
            "Kingmaker.exe",  // Pathfinder
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_ANY},
                {"Swapchain_Encoding", 1.f},
                {"Use_Swapchain_Proxy", 1.f},
            },
        },
        {
            "Oblivion Override.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_ANY},
                {"Swapchain_Encoding", 1.f},
                {"Scaling_Offset", 1.f},
                {"Tonemap_Offset", 1.f},
                {"Use_Swapchain_Proxy", 1.f},
            },
        },
        {
            "RimWorldWin64.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_ANY},
                {"Swapchain_Encoding", 1.f},
            },
        },
        {
            "Schedule I.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R8G8B8A8_UNORM", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R8G8B8A8_UNORM_SRGB", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R11G11B10_FLOAT", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R10G10B10A2_TYPELESS", UPGRADE_TYPE_OUTPUT_RATIO},
            },
        },
        {
            "SodaCrisis.exe",
            {
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Scaling_Offset", 3.f},
                {"Blit_Copy_Hack", 3.f},
            },
        },
};

float g_upgrade_copy_destinations = 0.f;
float g_use_resource_cloning = 0.f;
float g_resize_internal_lut = 0.f;
float toggleBlitHack = 0.f;

void AddAdvancedSettings() {
  auto process_path = renodx::utils::platform::GetCurrentProcessPath();
  auto filename = process_path.filename().string();
  auto default_settings = GAME_DEFAULT_SETTINGS.find(filename);

  {
    std::stringstream s;
    if (default_settings == GAME_DEFAULT_SETTINGS.end()) {
      auto product_name = renodx::utils::platform::GetProductName(process_path);

      default_settings = GAME_DEFAULT_SETTINGS.find(product_name);

      if (default_settings == GAME_DEFAULT_SETTINGS.end()) {
        s << "No default settings for ";
      } else {
        s << "Marked default values for ";
        gammaSpaceLock = true;
      }
      s << filename;
      s << " (" << product_name << ")";
    } else {
      s << "Marked default values for ";
      s << filename;
      gammaSpaceLock = true;
    }
    reshade::log::message(reshade::log::level::info, s.str().c_str());
  }

  auto add_setting = [&](auto* setting) {
    if (default_settings != GAME_DEFAULT_SETTINGS.end()) {
      auto values = default_settings->second;
      if (auto values_pair = values.find(setting->key);
          values_pair != values.end()) {
        setting->default_value = static_cast<float>(values_pair->second);
        std::stringstream s;
        s << "Default value for ";
        s << setting->key;
        s << ": ";
        s << setting->default_value;
        reshade::log::message(reshade::log::level::info, s.str().c_str());
      }
    }
    renodx::utils::settings::LoadSetting(renodx::utils::settings::global_name, setting);
    settings.push_back(setting);
  };
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Swapchain_Encoding",
        .binding = &gammaSpace,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .can_reset = false,
        .label = "Swapchain Encoding",
        .section = "Compatibility",
        .tooltip = "Disabled if detected automatically.",
        .labels = {"Linear", "Gamma"},
        .tint = 0x1C1C3C,
        .is_enabled = []() { return !gammaSpaceLock; },
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    gammaSpace = setting->GetValue();
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Scaling_Offset",
        .binding = &countOffset,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Scaling offset",
        .section = "Compatibility",
        .tooltip = "Moves Game Brightness application if possible.",
        .labels = {"0", "1", "2", "3", "4", "5"},
        .tint = 0x1C1C3C,
        .is_enabled = []() { return shader_injection.countOld + countOffset > 1.f; },
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    countOffset = setting->GetValue();
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Tonemap_Offset",
        .binding = &count2Offset,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Tonemap offset",
        .section = "Compatibility",
        .tooltip = "Moves Tonemap/Color Grading application if possible.",
        .labels = {"0", "1", "2", "3", "4", "5"},
        .tint = 0x1C1C3C,
        .is_enabled = []() { return shader_injection.tonemapCheck < 2.f && shader_injection.count2Old + count2Offset > 1.f; },
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    count2Offset = setting->GetValue();
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Blit_Copy_Hack",
        .binding = &blitCopyHack,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Blit Copy Hack",
        .section = "Compatibility",
        .tooltip = "\nHijacks Copy shader to apply Tonemap/Color Grade/Scaling."
                   "\nAuto triggers when no other shader is available."
                   "\nAffected by offsets",
        .labels = {"Off", "Auto", "On", "Scaling only"},
        .tint = 0x1C1C3C,
        .is_enabled = []() { return toggleBlitHack; },
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    blitCopyHack = setting->GetValue();
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_CopyDestinations",
        .binding = &g_upgrade_copy_destinations,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Upgrade Copy Destinations",
        .section = "Resource Upgrades",
        .tooltip = "Includes upgrading texture copy destinations.",
        .labels = {
            "Off",
            "On",
            "Auto-Upgrade",
        },
        .tint = 0xAFD8B5,
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    g_upgrade_copy_destinations = setting->GetValue();
    renodx::mods::swapchain::use_auto_upgrade = g_upgrade_copy_destinations == 2.f;
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Use_Resource_Cloning",
        .binding = &g_use_resource_cloning,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Use Resource Cloning",
        .section = "Resource Upgrades",
        .labels = {
            "Off",
            "On",
        },
        .tint = 0xAFD8B5,
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    g_use_resource_cloning = setting->GetValue();
  }
  for (const auto& [key, format] : UPGRADE_TARGETS_TYPELESS) {
    auto* new_setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_" + key,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = key,
        .section = "Resource Upgrades",
        .labels = {
            "Off",
            "Output size",
            "Output ratio",
            "Any size",
        },
        .tint = 0xDF7211,
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(new_setting);
    auto value = new_setting->GetValue();
    if (value > 0) {
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = format,
          .new_format = reshade::api::format::r16g16b16a16_typeless,
          .ignore_size = (value == UPGRADE_TYPE_ANY),
          .use_resource_view_cloning = g_use_resource_cloning == 1.f,
          .aspect_ratio = static_cast<float>((value == UPGRADE_TYPE_OUTPUT_RATIO)
                                                 ? renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER
                                                 : renodx::mods::swapchain::SwapChainUpgradeTarget::ANY),
          .usage_include = reshade::api::resource_usage::render_target
                           | reshade::api::resource_usage::unordered_access
                           | (g_upgrade_copy_destinations == 1.f
                                  ? reshade::api::resource_usage::copy_dest
                                  : reshade::api::resource_usage::undefined),
      });
      std::stringstream s;
      s << "Applying user resource upgrade for ";
      s << format << ": " << value;
      reshade::log::message(reshade::log::level::info, s.str().c_str());
    }
  }
  for (const auto& [key, format] : UPGRADE_TARGETS) {
    auto* new_setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_" + key,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = key,
        .section = "Resource Upgrades",
        .labels = {
            "Off",
            "Output size",
            "Output ratio",
            "Any size",
        },
        .tint = 0xDF7211,
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(new_setting);
    auto value = new_setting->GetValue();
    if (value > 0) {
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = format,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .ignore_size = (value == UPGRADE_TYPE_ANY),
          .use_resource_view_cloning = g_use_resource_cloning == 1.f,
          .aspect_ratio = static_cast<float>((value == UPGRADE_TYPE_OUTPUT_RATIO)
                                                 ? renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER
                                                 : renodx::mods::swapchain::SwapChainUpgradeTarget::ANY),
          .usage_include = reshade::api::resource_usage::render_target
                           | (g_upgrade_copy_destinations == 1.f
                                  ? reshade::api::resource_usage::copy_dest
                                  : reshade::api::resource_usage::undefined),
      });
      std::stringstream s;
      s << "Applying user resource upgrade for ";
      s << format << ": " << value;
      reshade::log::message(reshade::log::level::info, s.str().c_str());
    }
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Use_Swapchain_Proxy",
        .binding = &g_use_swapchain_proxy,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Swapchain Proxy",
        .section = "Resource Upgrades",
        .labels = {
            "Off",
            "On",
            "On (Compatibility Mode)",
        },
        .tint = 0x896895,
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);
    g_use_swapchain_proxy = setting->GetValue();
    if(g_use_swapchain_proxy >= 1.f){
    /*renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
    renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;*/
        renodx::mods::swapchain::swap_chain_proxy_shaders = {
            {
                reshade::api::device_api::d3d11,
                {
                    .vertex_shader = __swap_chain_proxy_vertex_shader_dx11,
                    .pixel_shader = __swap_chain_proxy_pixel_shader_dx11,
                },
            },
            {
                reshade::api::device_api::d3d12,
                {
                    .vertex_shader = __swap_chain_proxy_vertex_shader_dx12,
                    .pixel_shader = __swap_chain_proxy_pixel_shader_dx12,
                },
            },
        };
      renodx::mods::swapchain::swapchain_proxy_compatibility_mode = g_use_swapchain_proxy == 2.f;
    shader_injection.swapchainProxy = 1.f;
    }
  }
  /*{
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Resize_Internal_Lut",
        .binding = &g_resize_internal_lut,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Resize Internal LUT",
        .section = "Resource Upgrades",
        .labels = {
            "Off",
            "On",
        },
        .tint = 0x896895,
        .is_global = true,
        //.is_visible = []() { return settings[0]->GetValue() >= 2; },
        .is_visible = []() { return false; },
    };
    add_setting(setting);
    g_resize_internal_lut = setting->GetValue();
    shader_injection.internalLutResized = 1.f;
    if(g_resize_internal_lut == 1.f){
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_typeless,
          .dimensions = {.width=256, .height=16},
          .new_dimensions = {.width=1024, .height=32},
          .usage_include = reshade::api::resource_usage::render_target,
      });
    }
    shader_injection.internalLutResized = g_resize_internal_lut;
  }*/
  {
    auto* force_borderless_setting = new renodx::utils::settings::Setting{
        .key = "ForceBorderless",
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Force Borderless Window",
        .section = "Resource Upgrades",
        .labels = {
            "Disabled",
            "Enabled",
        },
        .tint = 0x896895,
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(force_borderless_setting);
    if (force_borderless_setting->GetValue() == 0) {
      renodx::mods::swapchain::force_borderless = false;
    }
  }
  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "PreventFullscreen",
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Prevent Exclusive Fullscreen",
        .section = "Resource Upgrades",
        .labels = {
            "Disabled",
            "Enabled",
        },
        .tint = 0x896895,
        .on_change_value = [](float previous, float current) { renodx::mods::swapchain::prevent_full_screen = (current == 1.f); },
        .is_global = true,
        .is_visible = []() { return settings[0]->GetValue() >= 2; },
    };
    add_setting(setting);

    renodx::mods::swapchain::prevent_full_screen = (setting->GetValue() == 1.f);
  }
  settings.push_back({new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "The application must be restarted for upgrades to take effect.",
      .section = "Resource Upgrades",
      .is_visible = []() { return settings[0]->GetValue() >= 2; },
  }});
}

void OnInitDevice(reshade::api::device* device) {
  if (device->get_api() == reshade::api::device_api::d3d12) {
    renodx::mods::shader::force_pipeline_cloning = true;
  }
}

bool fired_on_init_swapchain = false;

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  fired_on_init_swapchain = true;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[2]->default_value = peak.value();
    settings[2]->can_reset = true;
  }
}

void OnPresent(
    reshade::api::command_queue* queue,
    reshade::api::swapchain* swapchain,
    const reshade::api::rect* source_rect,
    const reshade::api::rect* dest_rect,
    uint32_t dirty_rect_count,
    const reshade::api::rect* dirty_rects) {
        if(unityTonemapper != shader_injection.tonemapCheck){
            if(unityTonemapper == 3){
        settings[1]->labels = {"Vanilla", "None", "ACES", "RenoDRT (Daniele)", "RenoDRT (Reinhard)"};
        settings[10]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[17]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[18]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[19]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[20]->is_enabled = []() { return shader_injection.toneMapType == 4.f; };
        shader_injection.tonemapCheck = unityTonemapper;
            } else if(trunc(unityTonemapper) == 2){
        settings[1]->labels = {"Vanilla", "None", "ACES", "RenoDRT (Reinhard)", "RenoDRT (Daniele)"};
        if(unityTonemapper == 2.5f){
        settings[6]->labels = {"Per Channel", "Luminance"};
        settings[9]->is_enabled = []() { return shader_injection.toneMapType >= 3.f && shader_injection.toneMapPerChannel != 0.f; };
        } else {
        settings[6]->labels = {"Luminance", "Per Channel"};
        settings[9]->is_enabled = []() { return shader_injection.toneMapType >= 3.f && shader_injection.toneMapPerChannel == 0.f; };
        }
        settings[10]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[17]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[18]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[19]->is_enabled = []() { return shader_injection.toneMapType >= 3.f; };
        settings[20]->is_enabled = []() { return shader_injection.toneMapType == 3.f; };
        shader_injection.tonemapCheck = unityTonemapper;
            } else if(trunc(unityTonemapper) == 1){
        settings[1]->labels = {"Vanilla", "None", "Frostbite", "RenoDRT (Reinhard)", "DICE"};
        settings[10]->is_enabled = []() { return shader_injection.toneMapType >= 2.f; };
        settings[17]->is_enabled = []() { return shader_injection.toneMapType >= 2.f; };
        settings[18]->is_enabled = []() { return shader_injection.toneMapType >= 2.f; };
        settings[19]->is_enabled = []() { return shader_injection.toneMapType == 3.f; };
        settings[20]->is_enabled = []() { return shader_injection.toneMapType == 3.f; };
        shader_injection.tonemapCheck = unityTonemapper;
            }
        }
        if(lutSampler && lutBuilder){
          InternalLutCheck = 3.f;
        } else if(lutSampler){
          InternalLutCheck = sneakyBuilder || InternalLutCheck == 4.f ? 4.f : 2.f;
          sneakyBuilder = false;
        } else if(lutBuilder){
          InternalLutCheck = 1.f;
        } else {
          InternalLutCheck = 0.f;
        }
        shader_injection.countOld = fmax(1.f, countMid - countOffset);
        shader_injection.count2Old = fmax(1.f, count2Mid - count2Offset);
        countMid = 0.f;
        count2Mid = 0.f;
        shader_injection.countNew = 0.f;
        shader_injection.count2New = 0.f;
        shader_injection.FSRcheck = FSRcheck;
        unityTonemapper = InternalLutCheck == 4.f || sneakyBuilder ? unityTonemapper : 0;
        lutSampler = false;
        lutBuilder = false;
        FSRcheck = 0.f;
        if(shader_injection.gammaSpace != gammaSpace){
            shader_injection.gammaSpace = gammaSpace;
            renodx::utils::settings::UpdateSetting("Swapchain_Encoding", shader_injection.gammaSpace);
            renodx::utils::settings::SaveGlobalSettings();
        }
        if(blitCopyHack >= 2.f){
          shader_injection.blitCopyHack = blitCopyHack - 1.f;
        } else if(blitCopyHack == 1.f && !forceDetect){
          shader_injection.blitCopyHack = 1.f;
        } else {
          shader_injection.blitCopyHack = 0.f;
        }
        forceDetect = false;
        toggleBlitHack = blitCopyCheck;
        blitCopyCheck = 0.f;
        shader_injection.isClamped = shader_injection.isClamped < 2.f ? 0.f : shader_injection.isClamped;
}

void MergeShaders() {
  custom_shaders.reserve(other_shaders.size());  // other_shaders contains all shaders
  for (auto& kv : other_shaders) {
    custom_shaders.try_emplace(kv.second.crc32, std::move(kv.second));
  }
}

bool initialized = false;

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Unity Engine";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
    MergeShaders();
      if (!reshade::register_addon(h_module)) return FALSE;
      if (!initialized) {
      //renodx::mods::swapchain::swapchain_proxy_compatibility_mode = false;
      renodx::mods::swapchain::swapchain_proxy_revert_state = true;
      //renodx::mods::shader::force_pipeline_cloning = true;
      //renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::expected_constant_buffer_index = 13;
      //renodx::mods::shader::allow_multiple_push_constants = true;
      //renodx::mods::shader::revert_constant_buffer_ranges = true;
      renodx::mods::swapchain::expected_constant_buffer_index = 13;
      //renodx::mods::swapchain::expected_constant_buffer_space = 50;
      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::utils::random::binds.push_back(&shader_injection.random);
      AddAdvancedSettings();
      //  internal LUT
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_typeless,
          .dimensions = {.width=1024, .height=32},
          .usage_include = reshade::api::resource_usage::render_target,
      });
      AddGamePatches();
      //reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::register_event<reshade::addon_event::present>(OnPresent);
        initialized = true;
      }
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      //reshade::unregister_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      reshade::unregister_event<reshade::addon_event::present>(OnPresent);
      break;
  }
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  if(g_use_swapchain_proxy >= 1.f){
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  } else {
  renodx::mods::swapchain::Use(fdw_reason);
  }
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::Use(fdw_reason);
  return TRUE;
}
