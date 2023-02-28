vec2 RectUV(vec2 Coords, vec2 MinBound, vec2 MaxBound)
{
    vec2 MinDelta = Coords - MinBound;
    vec2 MaxDelta = MaxBound - Coords;
    vec2 BoundsCheck = clamp(MinDelta * MaxDelta, vec2(0.0f), vec2(1.0f));
    BoundsCheck = vec2(BoundsCheck.x * BoundsCheck.y);

    return BoundsCheck * MinDelta / (MinDelta + MaxDelta);
}

struct ImageProperties
{
    vec2 EndAt;
    vec2 BeginAt;
    vec2 SizeMultiplier;
};

vec3 DrawImage(vec2 Coords, vec3 BackBuffer, ImageProperties Prop)
{
    vec2 ImageUV = Prop.SizeMultiplier * RectUV(Coords, Prop.BeginAt, Prop.EndAt);
    float Factor = 0.0f;
    Factor += float(ImageUV.x > 0.0f && ImageUV.y > 0.0f);
    return mix(BackBuffer, texture(iChannel0, ImageUV).xyz, texture(iChannel0, ImageUV).w * Factor);
}