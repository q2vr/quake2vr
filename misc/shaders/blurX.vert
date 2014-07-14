#version 120

attribute vec2 Position;
attribute vec2 TexCoord;

varying vec2 texCoords[9];

uniform vec2 texScale;
uniform vec2 resolution;

const float offset[5] = float[]( 0.0, 1.0, 2.0, 3.0, 4.0 );

void main(void) {
	vec2 texelSize = 1.0 / resolution;
	gl_Position = vec4(Position,1.0,1.0);
	vec2 tc = TexCoord * texScale;
	texCoords[4] = tc;
	for (int i = 1 ; i < 5 ; i++)
	{
		texCoords[4 + i] = tc + vec2(offset[i],0.0) * texelSize;
		texCoords[4 - i] = tc - vec2(offset[i],0.0) * texelSize;		
	}
}