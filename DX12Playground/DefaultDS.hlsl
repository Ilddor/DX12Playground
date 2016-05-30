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

[domain("tri")]

PixelInputType main(ConstantOutputType input, float3 uvwCoord : SV_DomainLocation, const OutputPatch<HullOutputType, 3> patch)
{
    float3 vertexPosition;
    PixelInputType output;


    // Determine the position of the new vertex.
    vertexPosition = uvwCoord.x * patch[0].position + uvwCoord.y * patch[1].position + uvwCoord.z * patch[2].position;

    // Calculate the position of the new vertex against the world, view, and projection matrices.
    /*output.position = mul(float4(vertexPosition, 1.0f), worldMatrix);
    output.position = mul(output.position, viewMatrix);
    output.position = mul(output.position, projectionMatrix);*/
    output.position = float4(vertexPosition, 1.0f);

    // Send the input color into the pixel shader.
    float dist0 = distance(patch[0].position, vertexPosition);
    float dist1 = distance(patch[1].position, vertexPosition);
    float dist2 = distance(patch[2].position, vertexPosition);

    float minimum = min(dist0, dist1);
    minimum = min(minimum, dist2);

    if(minimum == dist0)
        output.color = patch[0].color;
    else if(minimum == dist1)
        output.color = patch[1].color;
    else
        output.color = patch[2].color;
    //output.color = patch[1].color;

    return output;
}