﻿Shader "Custom/SelfIllumColorWrappedDiffuseTransparent"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
        
        
        Lighting Off
		Fog { Mode Off }
		
 
        CGPROGRAM
        #include "UnityCG.cginc"
        #pragma surface surf NPR alpha
 		
        uniform fixed4 _Color;
                 
        fixed4 LightingNPR(SurfaceOutput o, half3 lightdir, fixed atten)
        {
        	half3 fakeLight = half3(0.7071,0.7071,0.0);
            half lambert = (dot(o.Normal, fakeLight));
            lambert = lambert * 0.5 + 0.5;
            return fixed4(o.Albedo * lambert, o.Alpha);   
        }
 
        struct Input
        {
            half2 uv_MainTex;
            half2 uv_NormalTex;
        };
 
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
            o.Alpha = _Color.a;
        }
        ENDCG
        
        
        
    }
    FallBack "Diffuse"
}