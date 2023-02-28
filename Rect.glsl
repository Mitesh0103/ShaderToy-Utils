struct RectProperties
{
    vec2 EndAt;
    vec2 BeginAt;
    vec4 Color;
};

vec3 DrawRect(vec2 Coords, vec3 BackBuffer, RectProperties Prop)
{
    vec2 MinDelta = Coords - Prop.BeginAt;
    vec2 MaxDelta = Prop.EndAt - Coords;
    vec2 BoundsCheck = clamp(MinDelta * MaxDelta, vec2(0.0f), vec2(1.0f));

    float Factor = Prop.Color.w * float(bool(BoundsCheck.x * BoundsCheck.y));
    vec3 Result = mix(BackBuffer, Prop.Color.xyz, Factor);
    return Result;
}
