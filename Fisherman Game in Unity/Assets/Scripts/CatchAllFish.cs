using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CatchAllFish : MonoBehaviour
{
    public GameObject currentFisherman;
    void Update()
    {
        if (Input.GetKeyDown("space"))
        {
            // Cast a ray from the fisherman's position forward
            Ray ray = new Ray(currentFisherman.transform.position, currentFisherman.transform.forward);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit, Mathf.Infinity))
            {
                if (hit.collider.gameObject.CompareTag("Fish") || hit.collider.gameObject.CompareTag("Anchovy"))
                {
                    // Destroy the fish
                    Destroy(hit.collider.gameObject);
                }
            }
            // Draw the ray in the scene for visualization
            WebGLDebugRay debugRay = FindObjectOfType<WebGLDebugRay>();
            debugRay.SetRay(ray.origin, ray.direction, hit.distance);
        }
    }
}