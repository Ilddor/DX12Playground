struct VertexOut
{
    float3 position  : POSITION;
    float4 color : COLOR;
};

VertexOut main(float3 position : POSITION, float4 color : COLOR)
{
    VertexOut vout;

    // Transform to homogeneous clip space.
    vout.position = position;

    // Just pass vertex color into the pixel shader.
    vout.color = color;

    return vout;
}
