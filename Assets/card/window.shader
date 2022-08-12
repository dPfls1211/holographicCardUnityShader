Shader "Custom/window"
{
	Properties{
		[IntRange] _StencilMask("Stencil Mask", Range(0, 255)) = 1
	}
		SubShader{
			Tags {
				"RenderType" = "Opaque"
				"Queue" = "Geometry-100"
			}
			ColorMask 0
			ZWrite off
			Stencil {
				Ref[_StencilMask]
				Comp always
				Pass replace
			}

			Pass {
				CGPROGRAM
				#include "UnityCG.cginc"

				#pragma vertex vert
				#pragma fragment frag

				struct appdata {
					float4 vertex : POSITION;
				};

				struct v2f {
					float4 position : SV_POSITION;
				};

				v2f vert(appdata v) {
					v2f o;
					o.position = UnityObjectToClipPos(v.vertex);
					return o;
				}

				half4 frag(v2f i) : COLOR {
					return half4(1,1,0,1);
				}
				ENDCG
			}
	}
}
