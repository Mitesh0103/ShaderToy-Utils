/* ALIAS DEFINES */
#define CurrentTime         iTime
#define MousePressed        iMouse.z
#define MouseLocation       iMouse.xy
#define DisplayResolution   iResolution.xy

/* FUNCTIONS DEFINES */
#define Main() mainImage(out vec4 FragColor, in vec2 PixelCoord)

void Main()
{
    /* USEFUL VALUES */
    vec2 TexCoord = PixelCoord / DisplayResolution;
    vec2 MouseCoord = MouseLocation / DisplayResolution;
    float AspectRatio = DisplayResolution.x / DisplayResolution.y;
    TexCoord.x *= AspectRatio;
    MouseCoord.x *= AspectRatio;

    // Insert Code Here ...

    FragColor = vec4(vec3(MousePressed), 1.0f);
}