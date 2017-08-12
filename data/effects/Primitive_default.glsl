#version 110

#ifdef VERTEX_SHADER
uniform mat4 ProjectionMatrix;

attribute vec2 InPosition;
attribute vec4 InColor;

varying vec4 Color;

void main( void )
{
	gl_Position = ProjectionMatrix * vec4( InPosition, 0.0, 1.0 );
	Color = InColor;
}
#endif

#ifdef FRAGMENT_SHADER
varying vec4 Color;

void main( void )
{
	gl_FragColor = Color;
    
    if (gl_FragColor.r == 1.0 && gl_FragColor.g == 0.0 && gl_FragColor.b == 0.0 && gl_FragColor.a == 0.3137255162)
    {
        gl_FragColor.a = 1.0;
    }
    if (gl_FragColor.r == 0.0 && gl_FragColor.g == 1.0 && gl_FragColor.b == 0.0 && gl_FragColor.a == 0.3137255162)
    {
        gl_FragColor.a = 1.0;
    }
    
}
#endif
