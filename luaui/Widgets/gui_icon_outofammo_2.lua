---
--- DateTime: 27-Sep-21 4:23 PM
--- You can turn UI debug on/off by '/aidebugon' and '/aidebugoff' console commands
---

-----------------------------------------------------------------
-- Shader Sources
-----------------------------------------------------------------

--local vsSrc = [[
--#version 430 core
--
--#line 1011
--
--layout (location = 0) in vec2 ndcVert;
--layout (location = 1) in vec2 uv;
--
--layout(std140, binding = 0) uniform UniformMatrixBuffer {
--	mat4 screenView;
--	mat4 screenProj;
--	mat4 screenViewProj;
--
--	mat4 cameraView;
--	mat4 cameraProj;
--	mat4 cameraViewProj;
--	mat4 cameraBillboardView;
--
--	mat4 cameraViewInv;
--	mat4 cameraProjInv;
--	mat4 cameraViewProjInv;
--
--	mat4 shadowView;
--	mat4 shadowProj;
--	mat4 shadowViewProj;
--
--	mat4 reflectionView;
--	mat4 reflectionProj;
--	mat4 reflectionViewProj;
--
--	mat4 orthoProj01;
--
--	// transforms for [0] := Draw, [1] := DrawInMiniMap, [2] := Lua DrawInMiniMap
--	mat4 mmDrawView; //world to MM
--	mat4 mmDrawProj; //world to MM
--	mat4 mmDrawViewProj; //world to MM
--
--	mat4 mmDrawIMMView; //heightmap to MM
--	mat4 mmDrawIMMProj; //heightmap to MM
--	mat4 mmDrawIMMViewProj; //heightmap to MM
--
--	mat4 mmDrawDimView; //mm dims
--	mat4 mmDrawDimProj; //mm dims
--	mat4 mmDrawDimViewProj; //mm dims
--};
--
--layout(std140, binding = 1) uniform UniformParamsBuffer {
--	vec3 rndVec3; //new every draw frame.
--	uint renderCaps; //various render booleans
--
--	vec4 timeInfo;     //gameFrame, gameSeconds, drawFrame, frameTimeOffset
--	vec4 viewGeometry; //vsx, vsy, vpx, vpy
--	vec4 mapSize;      //xz, xzPO2
--	vec4 mapHeight;    //height minCur, maxCur, minInit, maxInit
--
--	vec4 fogColor;  //fog color
--	vec4 fogParams; //fog {start, end, 0.0, scale}
--
--	vec4 sunDir;
--
--	vec4 sunAmbientModel;
--	vec4 sunAmbientMap;
--	vec4 sunDiffuseModel;
--	vec4 sunDiffuseMap;
--	vec4 sunSpecularModel;
--	vec4 sunSpecularMap;
--
--	vec4 shadowDensity; // {ground, units, 0.0, 0.0}
--
--	vec4 windInfo; // windx, windy, windz, windStrength
--	vec2 mouseScreenPos; //x, y. Screen space.
--	uint mouseStatus; // bits 0th to 32th: LMB, MMB, RMB, offscreen, mmbScroll, locked
--	uint mouseUnused;
--	vec4 mouseWorldPos; //x,y,z; w=0 -- offmap. Ignores water, doesn't ignore units/features under the mouse cursor
--
--	vec4 teamColor[255]; //all team colors
--};
--
--layout(location = 0) uniform vec3 worldPos;
--
--out Data {
--	vec2 vuv;
--};
--
--void main() {
--	gl_Position = cameraViewProj * vec4(       worldPos.xyz, 1.0);
--	//gl_Position = cameraViewProj * vec4(mouseWorldPos.xyz, 1.0);
--
--	gl_Position /= gl_Position.w; //NDC space [xyz coords span from -1 to 1]
--
--	// Move the vertex in directly screen space.
--	//gl_Position.xy += ndcVert.xy;
--	gl_Position.xy += vec2(ndcVert.x * viewGeometry.y / viewGeometry.x, ndcVert.y); //* 0.25 on both for scale Factor
--
--	vuv = uv;
--}
--
--]]
--
--local fsSrc = [[
--#version 430 core
--
--layout(binding = 0) uniform sampler2D tex;
--
--#line 2100
--
--in Data {
--	vec2 vuv;
--};
--
--out vec4 fragColor;
--
--void main() {
--    //fragColor = vec4(vuv.x, vuv.y, 0.0, 1.0);
--	//fragColor = vec4(texture(tex, vuv).xyz, 1.0);
--	fragColor = texture(tex, vuv);
--}
--]]


-----------------------------------------------------------------
-- Global Variables
-----------------------------------------------------------------

local shader
local vbo
local vao

-----------------------------------------------------------------

function widget:GetInfo()
    return {
        name = "GUI Icon Out-of-ammo GL4",
        desc = "Shows icons on top of out-of-ammo planes",
        author = "Ivand. MaDDoX added one triangle. O_o'",
        date = "Oct 11, 2021",
        license = "GPLv3",
        layer = 0,
        enabled = false, --true,
    }
end

--VFS.Include("gamedata/taptools.lua")
--
--function widget:Initialize()
--    shader = gl.CreateShader({
--        vertex = vsSrc,
--        fragment = fsSrc,
--    })
--
--    Spring.Echo(gl.GetShaderLog())
--    if shader == 0 then
--        widgetHandler:RemoveWidget()
--    end
--
--    Spring.Echo("worldPos", gl.GetUniformLocation(shader, "worldPos"))
--
--    vao = gl.GetVAO()
--    if vao == nil then
--        widgetHandler:RemoveWidget()
--    end
--
--    vbo = gl.GetVBO(GL.ARRAY_BUFFER, false)
--    if vbo == nil then
--        widgetHandler:RemoveWidget()
--    end
--
--    -- 6 below means reserve 6 points (to draw a Quad)
--    vbo:Define(6, {
--        {id = 0, name = "ndcVert", size = 2},
--        {id = 1, name = "uv", size = 2},
--    })
--
--    -- I'm lazy, so I'll do only one triangle
--    vbo:Upload({
--        -0.1, -0.1, 0.0, 1.0, --BL (pos, uv)   TL-----TR
--        -0.1,  0.1, 0.0, 0.0, --TL (pos, uv)    |
--        0.1,  0.1, 1.0, 0.0, --TR (pos, uv)    BL     BR
--        --- 2nd Triangle
--        -0.1, -0.1, 0.0, 1.0, --BL (pos, uv)
--        0.1,  0.1, 1.0, 0.0, --TR (pos, uv)
--        0.1, -0.1, 1.0, 1.0, --BR (pos, uv)
--    })
--
--    Spring.Echo(vbo:Download())
--    vbo:DumpDefinition()
--
--    vao:AttachVertexBuffer(vbo)
--
--    -- Other buffer types exist:
--    -- AttachVertexBuffer
--    -- AttachInstanceBuffer
--    -- AttachIndexBuffer
--end
--
--function widget:Finalize()
--    gl.DeleteShader(shader)
--
--    --optional, but recommended
--    if vao then
--        --optional
--        vao:Delete()
--        vao = nil
--    end
--
--    --optional, but recommended
--    if vbo then
--        --optional
--        vbo:Delete()
--        vbo = nil
--    end
--end
--
--function widget:ViewResize()
--    widget:Finalize()
--    widget:Initialize()
--end
--
----function widget:DrawScreen()
--function widget:DrawWorldPreUnit()
--    gl.DepthTest(false)
--    gl.UseShader(shader)
--    -- pos uniform in the vertex shader
--    -- represents center of quad
--    gl.Texture(0, "luaui/icons/outofammo.png")
--    gl.Uniform(0, 1300, 200, 4000) --example world space position
--
--    vao:DrawArrays(GL.TRIANGLES, 6) --only a triangle is drawn, change to 6 when you'll want quad
--
--    gl.Texture(0, false)
--    gl.UseShader(0)
--    gl.DepthTest(true)
--end