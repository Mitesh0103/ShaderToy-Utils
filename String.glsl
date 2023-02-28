#define MaxStringLen 100
#define FontAtlas iChannel1
#define CharPerDim ivec2(16, 16)
#define AtlasResolution iChannelResolution[1].xy

struct StringProperties
{
    vec2 BeginAt;
    vec4 FontColor;
    float FontSize;
    int StringSize;
    int[MaxStringLen] String;
};

float DrawCharacter(vec2 Coords, int CharID)
{
    vec2 PixelCoord = vec2(CharID % CharPerDim.x, CharID / CharPerDim.y);
    PixelCoord += Coords;
    PixelCoord /= vec2(CharPerDim);
    return texture(FontAtlas , PixelCoord).r;
}

vec3 DrawString(vec2 Coords, vec3 BackBuffer, StringProperties Prop)
{
    vec3 Result = BackBuffer;

    vec2 DeltaPerChar = Prop.FontSize * AtlasResolution / vec2(CharPerDim);
    for(int i = 0; i < Prop.StringSize; i++)
    {
        vec2 BeginAt = Prop.BeginAt; 
        BeginAt.x += float(i) * DeltaPerChar.x;
        vec2 EndAt = BeginAt + DeltaPerChar;
        vec2 CharCoord = RectUV(Coords, BeginAt, EndAt);

        float Factor = Prop.FontColor.w * DrawCharacter(CharCoord, Prop.String[i]);
        Result = mix(Result, Prop.FontColor.xyz, Prop.FontColor.w * Factor);
    }
    return Result;
}