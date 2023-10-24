uniform float time;
uniform float progress;
uniform sampler2D texture1;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
float PI = 3.1415926;
void main() {
	float o =  fract(time/20.);
	float lengthq = 0.02;

	if(abs(vUv.x - o) > lengthq && abs(vUv.x - o - 1.) > lengthq && abs(vUv.x - o + 1.) > lengthq) {
		discard;
	}



	gl_FragColor = vec4(1., 0., 0., 1.);
}