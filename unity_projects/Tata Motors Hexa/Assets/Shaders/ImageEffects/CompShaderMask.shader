﻿Shader "Compositing/CompShaderMask" 
{
	Properties 
	{
		_MainTex ("Base (RGB)", 2D) = "white" {}
		[HideInInspector] _Mask ("Mask", 2D) = "white"{}
	}
	
	SubShader 
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest
			#include "UnityCG.cginc"
			
			uniform sampler2D _MainTex;
			uniform sampler2D _Mask;

			fixed4 frag(v2f_img i) : COLOR
			{
				fixed4 dst = tex2D(_MainTex, i.uv);
				fixed4 mask = tex2D(_Mask, i.uv);
				fixed4 output = dst * mask;
				
				
				return output;
			}
	
			ENDCG
		}
	} 
	FallBack off
}

