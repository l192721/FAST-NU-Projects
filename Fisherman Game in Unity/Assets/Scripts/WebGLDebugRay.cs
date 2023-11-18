using UnityEngine;

public class WebGLDebugRay : MonoBehaviour
{
    // Public properties for controlling the line's appearance
    public Color lineColor = Color.red;
    public float lineWidth = 0.1f;

    // Private fields to store raycast information
    private Vector3 rayOrigin;
    private Vector3 rayDirection;
    private float rayLength;

    // Method to set the raycast information
    public void SetRay(Vector3 origin, Vector3 direction, float length)
    {
        rayOrigin = origin;
        rayDirection = direction;
        rayLength = length;
    }

    void OnRenderObject()
    {
        // Set the material and color for the line
        Material material = new Material(Shader.Find("Sprites/Default"));
        material.color = lineColor;

        // Apply the material
        material.SetPass(0);

        // Draw the line in the scene
        GL.Begin(GL.LINES);
        GL.Vertex(rayOrigin);
        GL.Vertex(rayOrigin + rayDirection.normalized * rayLength);
        GL.End();
    }
}
