//UNITY_SHADER_NO_UPGRADE
#ifndef STOCHASTICHLSLINCLUDE_INCLUDED
#define STOCHASTICHLSLINCLUDE_INCLUDED

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/ACES.hlsl"

//hash for randomness
float2 hash2D2D_float(float2 s)
{
	//magic numbers
	return frac(sin(fmod(float2(dot(s, float2(127.1, 311.7)), dot(s, float2(269.5, 183.3))), 3.14159))*43758.5453);
}

//stochastic sampling
void Stochastic_float(UnityTexture2D tex, UnitySamplerState samplerTex, float4 UV, out float3 Out)
{
	//triangle vertices and blend weights
	//BW_vx[0...2].xyz = triangle verts
	//BW_vx[3].xy = blend weights (z is unused)
	float4x3 BW_vx;

	//uv transformed into triangular grid space with UV scaled by approximation of 2*sqrt(3)
	float2 skewUV = mul(float2x2 (1.0, 0.0, -0.57735027, 1.15470054), UV * 3.464);

	//vertex IDs and barycentric coords
	float2 vxID = float2 (floor(skewUV));
	float3 barry = float3 (frac(skewUV), 0);
	barry.z = 1.0 - barry.x - barry.y;

	BW_vx = ((barry.z > 0) ?
				float4x3(float3(vxID, 0), float3(vxID + float2(0, 1), 0), float3(vxID + float2(1, 0), 0), barry.zyx) :
				float4x3(float3(vxID + float2 (1, 1), 0), float3(vxID + float2 (1, 0), 0), float3(vxID + float2 (0, 1), 0), float3(-barry.z, 1.0 - barry.y, 1.0 - barry.x)));

	//calculate derivatives to avoid triangular grid artifacts
	float2 dx = ddx(UV);
	float2 dy = ddy(UV);
	  
	//blend samples with calculated weights  
	Out = mul(tex.SampleGrad(samplerTex, UV + hash2D2D_float(BW_vx[0].xy), dx, dy), BW_vx[3].x) +
		mul(tex.SampleGrad(samplerTex, UV + hash2D2D_float(BW_vx[1].xy), dx, dy), BW_vx[3].y) +
		mul(tex.SampleGrad(samplerTex, UV + hash2D2D_float(BW_vx[2].xy), dx, dy), BW_vx[3].z);
}

#endif