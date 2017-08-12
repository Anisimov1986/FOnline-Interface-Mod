//
// FOnline default effect
// For primitives (light, mini-map, pip-boy maps, etc)
//

#include "IOStructures.inc"


// Vertex shader
AppToVsToPs_2DPrimitive VSSimple(AppToVsToPs_2DPrimitive input)
{
	// Just pass forward
	return input;
}


// Pixel shader
float4 PSSimple(AppToVsToPs_2DPrimitive input) : COLOR
{
	// Just pass forward
    if(input.Diffuse.r == 1.0f && input.Diffuse.g == 0.0f && input.Diffuse.b == 0.0f && input.Diffuse.a == 0.3137255162f)
        input.Diffuse.a = 1.0f;
    else if(input.Diffuse.r == 0.0f && input.Diffuse.g == 1.0f && input.Diffuse.b == 0.0f && input.Diffuse.a == 0.3137255162f)
        input.Diffuse.a = 1.0f;
    return input.Diffuse;
}


// Techniques
technique Simple
{
	pass p0
	{
		VertexShader = (compile vs_2_0 VSSimple());
		PixelShader  = (compile ps_2_0 PSSimple());
	}
}

