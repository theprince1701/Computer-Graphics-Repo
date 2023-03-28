Shader "Custom/Water 1"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _ScrollSpeedX("X Speed", Range(0, 10)) =  2
        _ScrollSpeedY("Y Speed", Range(0, 10)) =  2
        _ScrollSpeedX1("X Speed", Range(0, 10)) =  2
        _ScrollSpeedY1("Y Speed", Range(0, 10)) =  2
        _NormalTex("Bump", 2D) = "bump" {}
        _NormalTex2("Bump", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _NormalTex;
        sampler2D _NormalTex2;
        float _ScrollSpeedX;
        float _ScrollSpeedY;
        float _ScrollSpeedX1;
        float _ScrollSpeedY1;
        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalTex;
            float2 uv_NormalTex2;
        };
        
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uvScroll = IN.uv_NormalTex;
            uvScroll += fixed2(_ScrollSpeedX, _ScrollSpeedY) * _Time;

            float2 uvScroll2 = IN.uv_NormalTex2;
            uvScroll += fixed2(_ScrollSpeedX1, _ScrollSpeedY1) * _Time;
 
            float3 normalMap = UnpackNormal(tex2D(_NormalTex, uvScroll));
            float3 normalMap2 = UnpackNormal(tex2D(_NormalTex2, -uvScroll));

            float3 finalNormal = normalMap + normalMap2;
            
            
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Normal = normalize(finalNormal.rgb);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
