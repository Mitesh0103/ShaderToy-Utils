struct LineProperties
{
    vec2 EndAt;
    vec2 BeginAt;
    vec4 Color;
    float Thickness;
};

vec3 DrawLine(vec2 Coords, vec3 BackBuffer, LineProperties Prop)
{
    vec2 Delta1 = Coords - Prop.BeginAt;
    vec2 Delta2 = Prop.EndAt - Prop.BeginAt;

    // Projection of Delta1 onto Delta2
    float ProjectionFactor = clamp(dot(Delta1, Delta2) / dot(Delta2, Delta2), 0.0f, 1.0f);
    vec2 ProjectedVector = Delta2 * ProjectionFactor;
    float SegmentSDF = float(length(Delta1 - ProjectedVector) < Prop.Thickness);
    return mix(BackBuffer, Prop.Color.xyz, Prop.Color.w * SegmentSDF);
}

