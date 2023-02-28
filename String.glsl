#define MaxStringLen 100
#define FontAtlas iChannel0
#define CharPerDim ivec2(16, 16)
#define AtlasResolution iChannelResolution[0].xy

struct StringProperties
{
    vec2 DrawLoc;
    vec4 FontColor;
    float FontSize;
    int StringSize;
    int[MaxStringLen] String;
};

vec3 DrawCharacter(vec2 Coords, int CharID)
{
    vec2 PixelCoord = vec2(CharID % CharPerDim.x, CharID / CharPerDim.y);
    PixelCoord += Coords;
    PixelCoord /= vec2(CharPerDim);
    return texture(FontAtlas , PixelCoord).rrr;
}

vec3 DrawString(vec2 Coords, StringProperties Prop)
{
    vec3 Result = vec3(0.0f);

    vec2 DeltaPerChar = Prop.FontSize * AtlasResolution / vec2(CharPerDim);
    for(int i = 0; i < Prop.StringSize; i++)
    {
        vec2 BeginAt = Prop.DrawLoc; 
        BeginAt.x += float(i) * DeltaPerChar.x;
        vec2 EndAt = BeginAt + DeltaPerChar;
        vec2 CharCoord = Rect(Coords, BeginAt, EndAt);
        Result += Prop.FontColor.xyz * Prop.FontColor.w * DrawCharacter(CharCoord, Prop.String[i]);
    }
    return Result;
}