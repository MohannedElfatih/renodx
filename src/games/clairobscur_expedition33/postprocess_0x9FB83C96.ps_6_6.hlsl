#include "./lilium_rcas.hlsl"

struct FViewConstants {
  float4 TranslatedWorldToClip[4];
  float4 RelativeWorldToClip[4];
  float4 ClipToRelativeWorld[4];
  float4 TranslatedWorldToView[4];
  float4 ViewToTranslatedWorld[4];
  float4 TranslatedWorldToCameraView[4];
  float4 CameraViewToTranslatedWorld[4];
  float4 ViewToClip[4];
  float4 ViewToClipNoAA[4];
  float4 ClipToView[4];
  float4 ClipToTranslatedWorld[4];
  float4 SVPositionToTranslatedWorld[4];
  float4 ScreenToRelativeWorld[4];
  float4 ScreenToTranslatedWorld[4];
  float4 MobileMultiviewShadowTransform[4];
  float3 ViewOriginHigh;
  float Padding972;
  float3 ViewForward;
  float Padding988;
  float3 ViewUp;
  float Padding1004;
  float3 ViewRight;
  float Padding1020;
  float3 HMDViewNoRollUp;
  float Padding1036;
  float3 HMDViewNoRollRight;
  float Padding1052;
  float4 InvDeviceZToWorldZTransform;
  float4 ScreenPositionScaleBias;
  float3 ViewOriginLow;
  float Padding1100;
  float3 TranslatedWorldCameraOrigin;
  float Padding1116;
  float3 WorldViewOriginHigh;
  float Padding1132;
  float3 WorldViewOriginLow;
  float Padding1148;
  float3 PreViewTranslationHigh;
  float Padding1164;
  float3 PreViewTranslationLow;
  float Padding1180;
  float4 PrevViewToClip[4];
  float4 PrevClipToView[4];
  float4 PrevTranslatedWorldToClip[4];
  float4 PrevTranslatedWorldToView[4];
  float4 PrevViewToTranslatedWorld[4];
  float4 PrevTranslatedWorldToCameraView[4];
  float4 PrevCameraViewToTranslatedWorld[4];
  float3 PrevTranslatedWorldCameraOrigin;
  float Padding1644;
  float3 PrevWorldCameraOriginHigh;
  float Padding1660;
  float3 PrevWorldCameraOriginLow;
  float Padding1676;
  float3 PrevWorldViewOriginHigh;
  float Padding1692;
  float3 PrevWorldViewOriginLow;
  float Padding1708;
  float3 PrevPreViewTranslationHigh;
  float Padding1724;
  float3 PrevPreViewTranslationLow;
  float Padding1740;
  float3 ViewTilePosition;
  float Padding1756;
  float3 RelativeWorldCameraOriginTO;
  float Padding1772;
  float3 RelativeWorldViewOriginTO;
  float Padding1788;
  float3 RelativePreViewTranslationTO;
  float Padding1804;
  float3 PrevRelativeWorldCameraOriginTO;
  float Padding1820;
  float3 PrevRelativeWorldViewOriginTO;
  float Padding1836;
  float3 RelativePrevPreViewTranslationTO;
  float Padding1852;
  float4 PrevClipToRelativeWorld[4];
  float4 PrevScreenToTranslatedWorld[4];
  float4 ClipToPrevClip[4];
  float4 ClipToPrevClipWithAA[4];
  float4 TemporalAAJitter;
  float4 GlobalClippingPlane;
  float2 FieldOfViewWideAngles;
  float2 PrevFieldOfViewWideAngles;
  float4 ViewRectMin;
  float4 ViewSizeAndInvSize;
  uint4 ViewRectMinAndSize;
  float4 LightProbeSizeRatioAndInvSizeRatio;
  float4 BufferSizeAndInvSize;
  float4 BufferBilinearUVMinMax;
  float4 ScreenToViewSpace;
  float2 BufferToSceneTextureScale;
  float2 ResolutionFractionAndInv;
  int NumSceneColorMSAASamples;
  float ProjectionDepthThicknessScale;
  float PreExposure;
  float OneOverPreExposure;
  float4 DiffuseOverrideParameter;
  float4 SpecularOverrideParameter;
  float4 NormalOverrideParameter;
  float2 RoughnessOverrideParameter;
  float PrevFrameGameTime;
  float PrevFrameRealTime;
  float OutOfBoundsMask;
  float Padding2372;
  float Padding2376;
  float Padding2380;
  float3 WorldCameraMovementSinceLastFrame;
  float CullingSign;
  float NearPlane;
  float GameTime;
  float RealTime;
  float DeltaTime;
  float MaterialTextureMipBias;
  float MaterialTextureDerivativeMultiply;
  uint Random;
  uint FrameNumber;
  uint FrameCounter;
  uint StateFrameIndexMod8;
  uint StateFrameIndex;
  uint DebugViewModeMask;
  uint WorldIsPaused;
  float CameraCut;
  float UnlitViewmodeMask;
  float Padding2460;
  float4 DirectionalLightColor;
  float3 DirectionalLightDirection;
  float Padding2492;
  float4 TranslucencyLightingVolumeMin[2];
  float4 TranslucencyLightingVolumeInvSize[2];
  float4 TemporalAAParams;
  float4 CircleDOFParams;
  float DepthOfFieldSensorWidth;
  float DepthOfFieldFocalDistance;
  float DepthOfFieldScale;
  float DepthOfFieldFocalLength;
  float DepthOfFieldFocalRegion;
  float DepthOfFieldNearTransitionRegion;
  float DepthOfFieldFarTransitionRegion;
  float MotionBlurNormalizedToPixel;
  float GeneralPurposeTweak;
  float GeneralPurposeTweak2;
  float DemosaicVposOffset;
  float DecalDepthBias;
  float3 IndirectLightingColorScale;
  float Padding2652;
  float3 PrecomputedIndirectLightingColorScale;
  float Padding2668;
  float3 PrecomputedIndirectSpecularColorScale;
  float Padding2684;
  float4 AtmosphereLightDirection[2];
  float4 AtmosphereLightIlluminanceOnGroundPostTransmittance[2];
  float4 AtmosphereLightIlluminanceOuterSpace[2];
  float4 AtmosphereLightDiscLuminance[2];
  float4 AtmosphereLightDiscCosHalfApexAngle_PPTrans[2];
  float4 SkyViewLutSizeAndInvSize;
  float3 SkyCameraTranslatedWorldOrigin;
  float Padding2876;
  float4 SkyPlanetTranslatedWorldCenterAndViewHeight;
  float4 SkyViewLutReferential[4];
  float4 SkyAtmosphereSkyLuminanceFactor;
  float SkyAtmospherePresentInScene;
  float SkyAtmosphereHeightFogContribution;
  float SkyAtmosphereBottomRadiusKm;
  float SkyAtmosphereTopRadiusKm;
  float4 SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize;
  float SkyAtmosphereAerialPerspectiveStartDepthKm;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv;
  float SkyAtmosphereApplyCameraAerialPerspectiveVolume;
  float Padding3032;
  float Padding3036;
  float3 NormalCurvatureToRoughnessScaleBias;
  float RenderingReflectionCaptureMask;
  float RealTimeReflectionCapture;
  float RealTimeReflectionCapturePreExposure;
  float Padding3064;
  float Padding3068;
  float4 AmbientCubemapTint;
  float AmbientCubemapIntensity;
  float SkyLightApplyPrecomputedBentNormalShadowingFlag;
  float SkyLightAffectReflectionFlag;
  float SkyLightAffectGlobalIlluminationFlag;
  float4 SkyLightColor;
  float SkyLightVolumetricScatteringIntensity;
  float Padding3124;
  float Padding3128;
  float Padding3132;
  float4 MobileSkyIrradianceEnvironmentMap[8];
  float MobilePreviewMode;
  float HMDEyePaddingOffset;
  float ReflectionCubemapMaxMip;
  float ShowDecalsMask;
  uint DistanceFieldAOSpecularOcclusionMode;
  float IndirectCapsuleSelfShadowingIntensity;
  float Padding3288;
  float Padding3292;
  float3 ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight;
  int StereoPassIndex;
  float4 GlobalVolumeTranslatedCenterAndExtent[6];
  float4 GlobalVolumeTranslatedWorldToUVAddAndMul[6];
  float4 GlobalDistanceFieldMipTranslatedWorldToUVScale[6];
  float4 GlobalDistanceFieldMipTranslatedWorldToUVBias[6];
  float GlobalDistanceFieldMipFactor;
  float GlobalDistanceFieldMipTransition;
  int GlobalDistanceFieldClipmapSizeInPages;
  int Padding3708;
  float3 GlobalDistanceFieldInvPageAtlasSize;
  float Padding3724;
  float3 GlobalDistanceFieldInvCoverageAtlasSize;
  float GlobalVolumeDimension;
  float GlobalVolumeTexelSize;
  float MaxGlobalDFAOConeDistance;
  uint NumGlobalSDFClipmaps;
  float CoveredExpandSurfaceScale;
  float NotCoveredExpandSurfaceScale;
  float NotCoveredMinStepScale;
  float DitheredTransparencyStepThreshold;
  float DitheredTransparencyTraceThreshold;
  int2 CursorPosition;
  float bCheckerboardSubsurfaceProfileRendering;
  float Padding3788;
  float3 VolumetricFogInvGridSize;
  float Padding3804;
  float3 VolumetricFogGridZParams;
  float Padding3820;
  float2 VolumetricFogSVPosToVolumeUV;
  float2 VolumetricFogViewGridUVToPrevViewRectUV;
  float2 VolumetricFogPrevViewGridRectUVToResourceUV;
  float2 VolumetricFogPrevUVMax;
  float2 VolumetricFogPrevUVMaxForTemporalBlend;
  float2 VolumetricFogScreenToResourceUV;
  float2 VolumetricFogUVMax;
  float VolumetricFogMaxDistance;
  float Padding3884;
  float3 VolumetricLightmapWorldToUVScale;
  float Padding3900;
  float3 VolumetricLightmapWorldToUVAdd;
  float Padding3916;
  float3 VolumetricLightmapIndirectionTextureSize;
  float VolumetricLightmapBrickSize;
  float3 VolumetricLightmapBrickTexelSize;
  float IndirectLightingCacheShowFlag;
  float EyeToPixelSpreadAngle;
  float Padding3956;
  float Padding3960;
  float Padding3964;
  float4 XRPassthroughCameraUVs[2];
  float GlobalVirtualTextureMipBias;
  uint VirtualTextureFeedbackShift;
  uint VirtualTextureFeedbackMask;
  uint VirtualTextureFeedbackStride;
  uint VirtualTextureFeedbackJitterOffset;
  uint VirtualTextureFeedbackSampleOffset;
  uint Padding4024;
  uint Padding4028;
  float4 RuntimeVirtualTextureMipLevel;
  float2 RuntimeVirtualTexturePackHeight;
  float Padding4056;
  float Padding4060;
  float4 RuntimeVirtualTextureDebugParams;
  int FarShadowStaticMeshLODBias;
  float MinRoughness;
  float Padding4088;
  float Padding4092;
  float4 HairRenderInfo;
  uint EnableSkyLight;
  uint HairRenderInfoBits;
  uint HairComponents;
  float bSubsurfacePostprocessEnabled;
  float4 SSProfilesTextureSizeAndInvSize;
  float4 SSProfilesPreIntegratedTextureSizeAndInvSize;
  float4 SpecularProfileTextureSizeAndInvSize;
  float3 PhysicsFieldClipmapCenter;
  float PhysicsFieldClipmapDistance;
  int PhysicsFieldClipmapResolution;
  int PhysicsFieldClipmapExponent;
  int PhysicsFieldClipmapCount;
  int PhysicsFieldTargetCount;
  int4 PhysicsFieldTargets[32];
  uint GPUSceneViewId;
  float ViewResolutionFraction;
  float SubSurfaceColorAsTransmittanceAtDistanceInMeters;
  float Padding4732;
  float4 TanAndInvTanHalfFOV;
  float4 PrevTanAndInvTanHalfFOV;
  float2 WorldDepthToPixelWorldRadius;
  float Padding4776;
  float Padding4780;
  float4 ScreenRayLengthMultiplier;
  float4 GlintLUTParameters0;
  float4 GlintLUTParameters1;
  int4 EnvironmentComponentsFlags;
  uint BindlessSampler_MaterialTextureBilinearWrapedSampler;
  uint Padding4852;
  uint BindlessSampler_MaterialTextureBilinearClampedSampler;
  uint Padding4860;
  uint BindlessSRV_VolumetricLightmapIndirectionTexture;
  uint Padding4868;
  uint BindlessSRV_VolumetricLightmapBrickAmbientVector;
  uint Padding4876;
  uint BindlessSRV_VolumetricLightmapBrickSHCoefficients0;
  uint Padding4884;
  uint BindlessSRV_VolumetricLightmapBrickSHCoefficients1;
  uint Padding4892;
  uint BindlessSRV_VolumetricLightmapBrickSHCoefficients2;
  uint Padding4900;
  uint BindlessSRV_VolumetricLightmapBrickSHCoefficients3;
  uint Padding4908;
  uint BindlessSRV_VolumetricLightmapBrickSHCoefficients4;
  uint Padding4916;
  uint BindlessSRV_VolumetricLightmapBrickSHCoefficients5;
  uint Padding4924;
  uint BindlessSRV_SkyBentNormalBrickTexture;
  uint Padding4932;
  uint BindlessSRV_DirectionalLightShadowingBrickTexture;
  uint Padding4940;
  uint BindlessSampler_VolumetricLightmapBrickAmbientVectorSampler;
  uint Padding4948;
  uint BindlessSampler_VolumetricLightmapTextureSampler0;
  uint Padding4956;
  uint BindlessSampler_VolumetricLightmapTextureSampler1;
  uint Padding4964;
  uint BindlessSampler_VolumetricLightmapTextureSampler2;
  uint Padding4972;
  uint BindlessSampler_VolumetricLightmapTextureSampler3;
  uint Padding4980;
  uint BindlessSampler_VolumetricLightmapTextureSampler4;
  uint Padding4988;
  uint BindlessSampler_VolumetricLightmapTextureSampler5;
  uint Padding4996;
  uint BindlessSampler_SkyBentNormalTextureSampler;
  uint Padding5004;
  uint BindlessSampler_DirectionalLightShadowingTextureSampler;
  uint Padding5012;
  uint BindlessSRV_GlobalDistanceFieldPageAtlasTexture;
  uint Padding5020;
  uint BindlessSRV_GlobalDistanceFieldCoverageAtlasTexture;
  uint Padding5028;
  uint BindlessSRV_GlobalDistanceFieldPageTableTexture;
  uint Padding5036;
  uint BindlessSRV_GlobalDistanceFieldMipTexture;
  uint Padding5044;
  uint BindlessSampler_GlobalDistanceFieldPageAtlasTextureSampler;
  uint Padding5052;
  uint BindlessSampler_GlobalDistanceFieldCoverageAtlasTextureSampler;
  uint Padding5060;
  uint BindlessSampler_GlobalDistanceFieldMipTextureSampler;
  uint Padding5068;
  uint BindlessSRV_AtmosphereTransmittanceTexture;
  uint Padding5076;
  uint BindlessSampler_AtmosphereTransmittanceTextureSampler;
  uint Padding5084;
  uint BindlessSRV_AtmosphereIrradianceTexture;
  uint Padding5092;
  uint BindlessSampler_AtmosphereIrradianceTextureSampler;
  uint Padding5100;
  uint BindlessSRV_AtmosphereInscatterTexture;
  uint Padding5108;
  uint BindlessSampler_AtmosphereInscatterTextureSampler;
  uint Padding5116;
  uint BindlessSRV_PerlinNoiseGradientTexture;
  uint Padding5124;
  uint BindlessSampler_PerlinNoiseGradientTextureSampler;
  uint Padding5132;
  uint BindlessSRV_PerlinNoise3DTexture;
  uint Padding5140;
  uint BindlessSampler_PerlinNoise3DTextureSampler;
  uint Padding5148;
  uint BindlessSRV_SobolSamplingTexture;
  uint Padding5156;
  uint BindlessSampler_SharedPointWrappedSampler;
  uint Padding5164;
  uint BindlessSampler_SharedPointClampedSampler;
  uint Padding5172;
  uint BindlessSampler_SharedBilinearWrappedSampler;
  uint Padding5180;
  uint BindlessSampler_SharedBilinearClampedSampler;
  uint Padding5188;
  uint BindlessSampler_SharedBilinearAnisoClampedSampler;
  uint Padding5196;
  uint BindlessSampler_SharedTrilinearWrappedSampler;
  uint Padding5204;
  uint BindlessSampler_SharedTrilinearClampedSampler;
  uint Padding5212;
  uint BindlessSRV_PreIntegratedBRDF;
  uint Padding5220;
  uint BindlessSampler_PreIntegratedBRDFSampler;
  uint Padding5228;
  uint BindlessSRV_SkyIrradianceEnvironmentMap;
  uint Padding5236;
  uint BindlessSRV_TransmittanceLutTexture;
  uint Padding5244;
  uint BindlessSampler_TransmittanceLutTextureSampler;
  uint Padding5252;
  uint BindlessSRV_SkyViewLutTexture;
  uint Padding5260;
  uint BindlessSampler_SkyViewLutTextureSampler;
  uint Padding5268;
  uint BindlessSRV_DistantSkyLightLutTexture;
  uint Padding5276;
  uint BindlessSampler_DistantSkyLightLutTextureSampler;
  uint Padding5284;
  uint BindlessSRV_CameraAerialPerspectiveVolume;
  uint Padding5292;
  uint BindlessSampler_CameraAerialPerspectiveVolumeSampler;
  uint Padding5300;
  uint BindlessSRV_CameraAerialPerspectiveVolumeMieOnly;
  uint Padding5308;
  uint BindlessSampler_CameraAerialPerspectiveVolumeMieOnlySampler;
  uint Padding5316;
  uint BindlessSRV_CameraAerialPerspectiveVolumeRayOnly;
  uint Padding5324;
  uint BindlessSampler_CameraAerialPerspectiveVolumeRayOnlySampler;
  uint Padding5332;
  uint BindlessSRV_HairScatteringLUTTexture;
  uint Padding5340;
  uint BindlessSampler_HairScatteringLUTSampler;
  uint Padding5348;
  uint BindlessSRV_GGXLTCMatTexture;
  uint Padding5356;
  uint BindlessSampler_GGXLTCMatSampler;
  uint Padding5364;
  uint BindlessSRV_GGXLTCAmpTexture;
  uint Padding5372;
  uint BindlessSampler_GGXLTCAmpSampler;
  uint Padding5380;
  uint BindlessSRV_SheenLTCTexture;
  uint Padding5388;
  uint BindlessSampler_SheenLTCSampler;
  uint Padding5396;
  uint bShadingEnergyConservation;
  uint bShadingEnergyPreservation;
  uint BindlessSRV_ShadingEnergyGGXSpecTexture;
  uint Padding5412;
  uint BindlessSRV_ShadingEnergyGGXGlassTexture;
  uint Padding5420;
  uint BindlessSRV_ShadingEnergyClothSpecTexture;
  uint Padding5428;
  uint BindlessSRV_ShadingEnergyDiffuseTexture;
  uint Padding5436;
  uint BindlessSampler_ShadingEnergySampler;
  uint Padding5444;
  uint BindlessSRV_GlintTexture;
  uint Padding5452;
  uint BindlessSampler_GlintSampler;
  uint Padding5460;
  uint BindlessSRV_SimpleVolumeTexture;
  uint Padding5468;
  uint BindlessSampler_SimpleVolumeTextureSampler;
  uint Padding5476;
  uint BindlessSRV_SimpleVolumeEnvTexture;
  uint Padding5484;
  uint BindlessSampler_SimpleVolumeEnvTextureSampler;
  uint Padding5492;
  uint BindlessSRV_SSProfilesTexture;
  uint Padding5500;
  uint BindlessSampler_SSProfilesSampler;
  uint Padding5508;
  uint BindlessSampler_SSProfilesTransmissionSampler;
  uint Padding5516;
  uint BindlessSRV_SSProfilesPreIntegratedTexture;
  uint Padding5524;
  uint BindlessSampler_SSProfilesPreIntegratedSampler;
  uint Padding5532;
  uint BindlessSRV_SpecularProfileTexture;
  uint Padding5540;
  uint BindlessSampler_SpecularProfileSampler;
  uint Padding5548;
  uint BindlessSRV_WaterIndirection;
  uint Padding5556;
  uint BindlessSRV_WaterData;
  uint Padding5564;
  float4 RectLightAtlasSizeAndInvSize;
  float RectLightAtlasMaxMipLevel;
  float Padding5588;
  uint BindlessSRV_RectLightAtlasTexture;
  uint Padding5596;
  uint BindlessSampler_RectLightAtlasSampler;
  uint Padding5604;
  uint Padding5608;
  uint Padding5612;
  float4 IESAtlasSizeAndInvSize;
  uint BindlessSRV_IESAtlasTexture;
  uint Padding5636;
  uint BindlessSampler_IESAtlasSampler;
  uint Padding5644;
  uint BindlessSampler_LandscapeWeightmapSampler;
  uint Padding5652;
  uint BindlessSRV_LandscapeIndirection;
  uint Padding5660;
  uint BindlessSRV_LandscapePerComponentData;
  uint Padding5668;
  uint BindlessUAV_VTFeedbackBuffer;
  uint Padding5676;
  uint BindlessSRV_PhysicsFieldClipmapBuffer;
  uint Padding5684;
  uint Padding5688;
  uint Padding5692;
  float3 TLASPreViewTranslationHigh;
  float Padding5708;
  float3 TLASPreViewTranslationLow;
};

Texture2D<float4> SceneTexturesStruct_SceneDepthTexture : register(t0);

Texture2D<float4> SceneTexturesStruct_CustomDepthTexture : register(t1);

Texture2D<uint2> SceneTexturesStruct_CustomStencilTexture : register(t2);

Texture2D<float4> PostProcessInput_0_Texture : register(t3);

cbuffer $Globals : register(b0) {
  float2 PostProcessInput_0_UVViewportMin : packoffset(c000.x);
  float2 PostProcessInput_0_UVViewportSize : packoffset(c000.z);
  float2 PostProcessInput_0_UVViewportBilinearMin : packoffset(c001.x);
  float2 PostProcessInput_0_UVViewportBilinearMax : packoffset(c001.z);
  float2 PostProcessInput_1_UVViewportMin : packoffset(c002.x);
  float2 PostProcessInput_1_UVViewportSize : packoffset(c002.z);
  float2 PostProcessInput_1_UVViewportBilinearMin : packoffset(c003.x);
  float2 PostProcessInput_1_UVViewportBilinearMax : packoffset(c003.z);
  float2 PostProcessInput_2_UVViewportMin : packoffset(c004.x);
  float2 PostProcessInput_2_UVViewportSize : packoffset(c004.z);
  float2 PostProcessInput_2_UVViewportBilinearMin : packoffset(c005.x);
  float2 PostProcessInput_2_UVViewportBilinearMax : packoffset(c005.z);
  float2 PostProcessInput_3_UVViewportMin : packoffset(c006.x);
  float2 PostProcessInput_3_UVViewportSize : packoffset(c006.z);
  float2 PostProcessInput_3_UVViewportBilinearMin : packoffset(c007.x);
  float2 PostProcessInput_3_UVViewportBilinearMax : packoffset(c007.z);
  float2 PostProcessInput_4_UVViewportMin : packoffset(c008.x);
  float2 PostProcessInput_4_UVViewportSize : packoffset(c008.z);
  float2 PostProcessInput_4_UVViewportBilinearMin : packoffset(c009.x);
  float2 PostProcessInput_4_UVViewportBilinearMax : packoffset(c009.z);
  uint2 PostProcessOutput_ViewportMin : packoffset(c010.x);
  float2 PostProcessOutput_ViewportSizeInverse : packoffset(c010.z);
};

cbuffer View : register(b1) {
  FViewConstants View : packoffset(c000.x);
};

cbuffer MaterialCollection0 : register(b2) {
  struct FMaterialCollection0Constants {
    float4 Vectors[1];
  }
MaterialCollection0:
  packoffset(c000.x);
};

cbuffer Material : register(b3) {
  struct FMaterialConstants {
    float4 PreshaderBuffer[2];
    uint BindlessSampler_Wrap_WorldGroupSettings;
    uint Padding36;
    uint BindlessSampler_Clamp_WorldGroupSettings;
  }
Material:
  packoffset(c000.x);
};

SamplerState SceneTexturesStruct_PointClampSampler : register(s0);

SamplerState PostProcessInput_0_Sampler : register(s1);

float4 main(
    noperspective float4 SV_Position: SV_Position,
    linear float4 TEXCOORD: TEXCOORD) : SV_Target {
  float4 SV_Target;
  float _27 = PostProcessOutput_ViewportSizeInverse.x * (SV_Position.x - float((uint)(int)(PostProcessOutput_ViewportMin.x)));
  float _28 = PostProcessOutput_ViewportSizeInverse.y * (SV_Position.y - float((uint)(int)(PostProcessOutput_ViewportMin.y)));
  float4 _49 = PostProcessInput_0_Texture.Sample(PostProcessInput_0_Sampler, float2(min(max(((_27 * PostProcessInput_0_UVViewportSize.x) + PostProcessInput_0_UVViewportMin.x), PostProcessInput_0_UVViewportBilinearMin.x), PostProcessInput_0_UVViewportBilinearMax.x), min(max(((_28 * PostProcessInput_0_UVViewportSize.y) + PostProcessInput_0_UVViewportMin.y), PostProcessInput_0_UVViewportBilinearMin.y), PostProcessInput_0_UVViewportBilinearMax.y)));
  float4 _74 = PostProcessInput_0_Texture.Sample(PostProcessInput_0_Sampler, float2(min(max(((PostProcessInput_0_UVViewportSize.x * _27) + PostProcessInput_0_UVViewportMin.x), PostProcessInput_0_UVViewportBilinearMin.x), PostProcessInput_0_UVViewportBilinearMax.x), min(max(((PostProcessInput_0_UVViewportSize.y * (_28 + 0.0010000000474974513f)) + PostProcessInput_0_UVViewportMin.y), PostProcessInput_0_UVViewportBilinearMin.y), PostProcessInput_0_UVViewportBilinearMax.y)));
  float4 _99 = PostProcessInput_0_Texture.Sample(PostProcessInput_0_Sampler, float2(min(max(((PostProcessInput_0_UVViewportSize.x * _27) + PostProcessInput_0_UVViewportMin.x), PostProcessInput_0_UVViewportBilinearMin.x), PostProcessInput_0_UVViewportBilinearMax.x), min(max(((PostProcessInput_0_UVViewportSize.y * (_28 + -0.0010000000474974513f)) + PostProcessInput_0_UVViewportMin.y), PostProcessInput_0_UVViewportBilinearMin.y), PostProcessInput_0_UVViewportBilinearMax.y)));
  float _109 = _49.x - ((_99.x + _74.x) * 0.5f);
  float _110 = _49.y - ((_99.y + _74.y) * 0.5f);
  float _111 = _49.z - ((_99.z + _74.z) * 0.5f);
  float _116 = (Material.PreshaderBuffer[0].x) * (MaterialCollection0.Vectors[0].x);
  float _146 = ((((SV_Position.x - float((uint)(int)(PostProcessOutput_ViewportMin.x))) * PostProcessOutput_ViewportSizeInverse.x) * View.ViewSizeAndInvSize.x) + View.ViewRectMin.x) * View.BufferSizeAndInvSize.z;
  float _147 = ((((SV_Position.y - float((uint)(int)(PostProcessOutput_ViewportMin.y))) * PostProcessOutput_ViewportSizeInverse.y) * View.ViewSizeAndInvSize.y) + View.ViewRectMin.y) * View.BufferSizeAndInvSize.w;
  uint2 _155 = SceneTexturesStruct_CustomStencilTexture.Load(int3((uint)(uint(_146 * View.BufferSizeAndInvSize.x)), (uint)(uint(_147 * View.BufferSizeAndInvSize.y)), 0));
  float _157 = float((uint)(int)(_155.y));
  float4 _160 = SceneTexturesStruct_CustomDepthTexture.SampleLevel(SceneTexturesStruct_PointClampSampler, float2(_146, _147), 0.0f);
  float4 _172 = SceneTexturesStruct_SceneDepthTexture.SampleLevel(SceneTexturesStruct_PointClampSampler, float2(_146, _147), 0.0f);
  float _182 = (((((View.InvDeviceZToWorldZTransform.x * _160.x) + View.InvDeviceZToWorldZTransform.y) + (1.0f / ((View.InvDeviceZToWorldZTransform.z * _160.x) - View.InvDeviceZToWorldZTransform.w))) - View.InvDeviceZToWorldZTransform.y) - (View.InvDeviceZToWorldZTransform.x * _172.x)) - (1.0f / ((View.InvDeviceZToWorldZTransform.z * _172.x) - View.InvDeviceZToWorldZTransform.w));
  float _186 = ((1.0f - saturate(_182)) * _157) * dot(float3((_109 * _116), (_110 * _116), (_111 * _116)), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f));
  float _191 = (Material.PreshaderBuffer[0].y) * (MaterialCollection0.Vectors[0].x);
  float _201 = (1.0f - (saturate(1.0f - _182) * _157)) * (dot(float3((_191 * _109), (_191 * _110), (_191 * _111)), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)) - _186);
  float _202 = (_186 + _49.x) + _201;
  float _203 = (_186 + _49.y) + _201;
  float _204 = (_186 + _49.z) + _201;
  SV_Target.x = max(((((Material.PreshaderBuffer[1].x) - _202) * (Material.PreshaderBuffer[0].z)) + _202), 0.0f);
  SV_Target.y = max(((((Material.PreshaderBuffer[1].y) - _203) * (Material.PreshaderBuffer[0].z)) + _203), 0.0f);
  SV_Target.z = max(((((Material.PreshaderBuffer[1].z) - _204) * (Material.PreshaderBuffer[0].z)) + _204), 0.0f);

  SV_Target.rgb = ApplyRCAS(SV_Target.rgb, TEXCOORD.xy, PostProcessInput_0_Texture, PostProcessInput_0_Sampler);
  SV_Target.w = 0.0f;
  return SV_Target;
}
