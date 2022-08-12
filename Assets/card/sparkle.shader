Shader "Custom/sparkle"
{
	Properties
	{
	_MainTex("Texture", 2D) = "white" {}
	_HighlightColor("HighLight Color", Color) = (1,1,1,1)
	_NoiseTex("Noise Texture", 2D) = "white" {}
	_Scale("Scale", Float) = 1
	_Intensity("Intensity", Float) = 50
	_RimColor("Rim Color", Color) = (0.26,0.19,0.16,0.0)
	_RimPower("Rim Power", Range(0.1, 8.0)) = 5.0
	}
	SubShader
	{
	Tags{ "RenderType" = "Opaque" }
	LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert 
			#pragma fragment frag
			#pragma multi_compile_fog
			#include "UnityCG.cginc"

			struct Input {
				float2 uv_MainTex;
			};
			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;

				float3 normal : NORMAL; 
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;

				float3 wPos : TEXCOORD1; 
				float3 wNormal : TEXCOORD2; 
				float3 color : COLOR;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			sampler2D _NoiseTex;
			float _Scale;
			float _Intensity;
			fixed4 _HighlightColor;
			float4 _RimColor;
			float _RimPower;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);

				o.wPos = mul(unity_ObjectToWorld, v.vertex).xyz; 
				o.wNormal = UnityObjectToWorldNormal(v.normal); 

				float3 viewDir = normalize(ObjSpaceViewDir(v.vertex));
				float dotProduct = 1.0 - dot(v.normal, viewDir);
	
				half rim = 1.0 - saturate(dot(normalize(viewDir), v.normal)); 
				o.color = _RimColor.rgb * pow(rim, _RimPower);

				o.uv = TRANSFORM_TEX(v.uv, _MainTex);

				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				float4 col = tex2D(_MainTex, i.uv);
				UNITY_APPLY_FOG(i.fogCoord, col);

				fixed3 sparklemap = tex2D(_NoiseTex, i.uv * _Scale);
				sparklemap -= half3(0.5, 0.5, 0.5);
				sparklemap = normalize(normalize(sparklemap) + i.wNormal);

				half3 viewDirection = normalize(i.wPos - _WorldSpaceCameraPos);

				half sparkle = dot(-viewDirection, sparklemap);
				sparkle = pow(saturate(sparkle), _Intensity);

				col.rgb += i.color;

				col += half4(sparkle * _HighlightColor.x, sparkle * _HighlightColor.y, sparkle * _HighlightColor.z, _HighlightColor.a);

				return col;
			}
		ENDCG
		}
	}
}
