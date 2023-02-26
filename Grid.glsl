struct GridProperties
{
    float Opacity;
    float Thickness;

    vec2 MaxVal;
    vec2 MinVal;
    vec2 IntervalVal;
};

vec3 DrawGrid(vec2 Coords, GridProperties Prop)
{
    vec3 Result = vec3(0.0f);

    // Grid Line Porperties
    LineProperties LineProp;
    LineProp.Thickness = Prop.Thickness;
    LineProp.Color = vec4(vec3(1.0f), Prop.Opacity);

    vec2 NumOfIntervals = (Prop.MaxVal - Prop.MinVal) / Prop.IntervalVal;

    // Vertical Line Pass
    for(float i = 0.0f; i <= NumOfIntervals.x; i++)
    {
        float CurrentXCoord = Prop.IntervalVal.x * i;
        LineProp.EndAt = vec2(Prop.MinVal.x + CurrentXCoord, Prop.MaxVal.y);
        LineProp.BeginAt = vec2(Prop.MinVal.x + CurrentXCoord, Prop.MinVal.y);
        Result += DrawLine(Coords, LineProp);
    }

    // Vertical Line Pass
    for(float i = 0.0f; i <= NumOfIntervals.y; i++)
    {
        float CurrentYCoord = Prop.IntervalVal.y * i;
        LineProp.EndAt = vec2(Prop.MaxVal.x, Prop.MinVal.y +CurrentYCoord);
        LineProp.BeginAt = vec2(Prop.MinVal.x, Prop.MinVal.y +CurrentYCoord);
        Result += DrawLine(Coords, LineProp);
    }

    return Result;
}
