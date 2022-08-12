Shader "Custom/object"
{
	Properties{
		 [IntRange] _StencilMask("Stencil Mask", Range(0, 255)) = 0

		 _Color("Color", Color) = (1,1,1,1)
		 _MainTex("Albedo (RGB)", 2D) = "white" {}
	}
		SubShader{
			Tags { "RenderType" = "Opaque" }
			LOD 200
			Stencil {
				Ref[_StencilMask]
				Comp equal
				Pass keep
				Fail keep
			}

			CGPROGRAM

			 #pragma surface surf Standard fullforwardshadows
			 #pragma target 2.0

			 sampler2D _MainTex;

			 struct Input {
				 float2 uv_MainTex;
			 };

			 fixed4 _Color;

			 void surf(Input IN, inout SurfaceOutputStandard o) {

				 
				 fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				 o.Albedo = c.rgb;

				 o.Alpha = c.a;
			 }
			 ENDCG
		 }
			 FallBack "Diffuse"
}
