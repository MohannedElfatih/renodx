#version 460

struct ScreenRectVertex
{
    vec2 position;
    vec2 tex_coord;
};

layout(push_constant, std430) uniform PushConstants
{
    mat4 modelview_matrix;
    ScreenRectVertex vertices[4];
} _29;

layout(location = 0) out vec2 frag_tex_coord;

ScreenRectVertex GetVertex(int index)
{
    if (index < 1)
    {
        ScreenRectVertex _35;
        _35.position = _29.vertices[0].position;
        _35.tex_coord = _29.vertices[0].tex_coord;
        return _35;
    }
    else
    {
        if (index < 2)
        {
            ScreenRectVertex _51;
            _51.position = _29.vertices[1].position;
            _51.tex_coord = _29.vertices[1].tex_coord;
            return _51;
        }
        else
        {
            if (index < 3)
            {
                ScreenRectVertex _66;
                _66.position = _29.vertices[2].position;
                _66.tex_coord = _29.vertices[2].tex_coord;
                return _66;
            }
            else
            {
                ScreenRectVertex _76;
                _76.position = _29.vertices[3].position;
                _76.tex_coord = _29.vertices[3].tex_coord;
                return _76;
            }
        }
    }
}

void main()
{
    int param = gl_VertexIndex;
    ScreenRectVertex vertex = GetVertex(param);
    gl_Position = _29.modelview_matrix * vec4(vertex.position, 0.0, 1.0);
    frag_tex_coord = vertex.tex_coord;
}

