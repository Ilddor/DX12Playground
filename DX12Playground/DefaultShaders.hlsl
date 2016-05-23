struct VertexOut
{
    float4 PosH  : SV_POSITION;
    float4 Color : COLOR;
};

VertexOut VSMain(float3 position : POSITION, float4 color : COLOR)
{
    VertexOut vout;

    // Transform to homogeneous clip space.
    vout.PosH = float4(position, 1.f);

    // Just pass vertex color into the pixel shader.
    vout.Color = color;

    return vout;
}

float4 PSMain(VertexOut pin) : SV_Target
{
    return pin.Color;
}
