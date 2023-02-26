/* MATH UTILITIES */

#define PI 3.14159265359f

float ReMap(float Target, float LowOld , float LowNew, float HighOld, HighNew)
{
    return LowNew + (Target - LowOld) * (HighNew - LowNew) / (HighOld - LowOld);
}

vec2 ProjectVec2(vec2 ProjectWhat, vec2 ProjectOnto)
{
    float ProjFactor = dot(ProjectWhat, ProjectOnto) / dot(ProjectOnto, ProjectOnto);
    return ProjectOnto * ProjFactor;
}

vec3 ProjectVec3(vec3 ProjectWhat, vec3 ProjectOnto)
{
    float ProjFactor = dot(ProjectWhat, ProjectOnto) / dot(ProjectOnto, ProjectOnto);
    return ProjectOnto * ProjFactor;
}