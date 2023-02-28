vec2 Rect(vec2 Coords, vec2 MinBound, vec2 MaxBound)
{
    vec2 MinDelta = Coords - MinBound;
    vec2 MaxDelta = MaxBound - Coords;
    vec2 BoundsCheck = clamp(MinDelta * MaxDelta, vec2(0.0f), vec2(1.0f));
    BoundsCheck = vec2(BoundsCheck.x * BoundsCheck.y);

    return BoundsCheck * MinDelta / (MinDelta + MaxDelta);
}