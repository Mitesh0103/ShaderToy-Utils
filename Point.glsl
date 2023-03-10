struct PointProperties
{
    vec4 Color;
    vec2 Location;
    float Thickness;
};

vec3 DrawPoint(vec2 Coords, vec3 BackBuffer, PointProperties Prop)
{
    // Point SDF
    float SDF = length(Coords - Prop.Location);
    SDF = float(SDF < Prop.Thickness);
    return mix(BackBuffer, Prop.Color.xyz, Prop.Color.w * SDF);
}