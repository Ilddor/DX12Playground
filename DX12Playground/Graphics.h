#pragma once

#include <windows.h>

#include "D3D.h"

class GraphicsClass
{
public:
	GraphicsClass();
	GraphicsClass(const GraphicsClass&);
	~GraphicsClass();

	bool Initialize(int, int, HWND);
	void Shutdown();
	bool Frame();

    static const bool FULL_SCREEN = false;
    static const bool VSYNC_ENABLED = true;
    const float SCREEN_DEPTH = 1000.0f;
    const float SCREEN_NEAR = 0.1f;

private:
	bool Render();

    D3DClass* m_Direct3D;
};