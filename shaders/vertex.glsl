uniform float time;
varying vec2 vUv;
varying vec3 vPosition;
uniform vec2 pixels;
uniform vec3 uMin;
float PI = 3.1415926;

attribute vec3 instancePosition;
attribute float instanceRotationAngle;
attribute vec3 instanceRotationAxis;


mat4 rotationMatrix(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat4(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,  0.0,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,  0.0,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c,           0.0,
                0.0,                                0.0,                                0.0,                                1.0);
}

vec3 rotate(vec3 v, vec3 axis, float angle) {
	mat4 m = rotationMatrix(axis, angle);
	return (m * vec4(v, 1.0)).xyz;
}


void main () {
	vUv = uv;
	vec3 newposition = position + instancePosition;

	newposition = rotate(newposition, instanceRotationAxis, instanceRotationAngle * PI * 2.);
 
	gl_Position = projectionMatrix * modelViewMatrix * vec4(newposition, 1.0);
}