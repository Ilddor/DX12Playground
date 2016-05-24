struct VertexOut
{
    float3 position  : POSITION;
    float4 color : COLOR;
};

struct ConstantOutputType
{
    float edges[3] : SV_TessFactor;
    float inside : SV_InsideTessFactor;
};

struct HullOutputType
{
    float3 position : POSITION;
    float4 color : COLOR;
};

struct PixelInputType
{
    float4 position : SV_POSITION;
    float4 color : COLOR;
};

VertexOut VSMain(float3 position : POSITION, float4 color : COLOR)
{
    VertexOut vout;

    // Transform to homogeneous clip space.
    vout.position = position;

    // Just pass vertex color into the pixel shader.
    vout.color = color;

    return vout;
}

float4 PSMain(PixelInputType pin) : SV_Target
{
    return pin.color;
}
