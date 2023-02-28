
# ShaderToy Utilities

A compilation of frequently used functions
## Usage/Examples

```c
/* Line.glsl */

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

/* Point.glsl */

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

void mainImage(out vec4 FragColor, in vec2 PixelCoord)
{
    vec3 Canvas = vec3(0.05f);
    
    LineProperties Prop;
    Prop.BeginAt = vec2(10.0f);
    Prop.EndAt = iMouse.xy;
    Prop.Color = vec4(vec3(0.8f), 1.0f);
    Prop.Thickness = 1.5f;
    Canvas = DrawLine(PixelCoord, Canvas, Prop);
    
    PointProperties Prop1;
    Prop1.Color = vec4(1.0f, 0.0f, 0.0f, 1.0f);
    Prop1.Location = (Prop.BeginAt + Prop.EndAt) / 2.0f;
    Prop1.Thickness = 5.0f;
    Canvas = DrawPoint(PixelCoord, Canvas, Prop1);
    
    FragColor = vec4(Canvas, 1.0f);
}
```



© Mitesh Jayakumar 2023