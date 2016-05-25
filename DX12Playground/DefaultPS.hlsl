struct PixelInputType
{
    float4 position : SV_POSITION;
    float4 color : COLOR;
};

float4 main(PixelInputType pin) : SV_Target
{
    return pin.color;
}