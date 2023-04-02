Shader "Player_Video_Texture_Shader"
{
	Properties
	{
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
	}
	SubShader{
		Tags { "RenderType" = "Opaque" }
		Pass
		{
			GLSLPROGRAM
		#ifdef VERTEX  
			void main()
			{
				gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
				gl_TexCoord[0] = gl_MultiTexCoord0;
			}
		#endif

		#ifdef FRAGMENT
			#ifdef SHADER_API_GLES3
				#extension GL_OES_EGL_image_external_essl3 : require
			#else
				#extension GL_OES_EGL_image_external : require
			#endif
			precision mediump float;
			uniform samplerExternalOES texSampler;
			void main()
			{
				vec2 vc2 = gl_TexCoord[0].st;
				vc2.y = 1.0 - vc2.y;
				gl_FragColor = texture2D(texSampler, vc2);
			}
		#endif

		ENDGLSL
		}
	}
	FallBack "Diffuse", 1
}
