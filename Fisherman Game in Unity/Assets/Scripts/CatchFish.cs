using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CatchFish : MonoBehaviour
{
    // Reference to the fisherman
    public GameObject fisherman;

    // Reference to the new fisherman prefab
    public GameObject newFishermanPrefab;

    // Reference to the camera follow script
    public CameraFollow cameraFollow;

    // The current fisherman
    private GameObject currentFisherman;

    // The current fisherman's controller script
    private PlayerController currentController;

    void Start()
    {
        // Set the current fisherman to the fisherman object
        currentFisherman = fisherman;

        // Get the current fisherman's PlayerController component
        currentController = currentFisherman.GetComponent<PlayerController>();
    }

    void Update()
    {
        if (Input.GetKeyDown("space"))
        {
            // Cast a ray from the fisherman's position forward
            Ray ray = new Ray(currentFisherman.transform.position, currentFisherman.transform.forward);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit, Mathf.Infinity))
            {
                if (hit.collider.gameObject.CompareTag("Fish"))
                {
                    // Destroy the fish
                    Destroy(hit.collider.gameObject);
                }
                else if (hit.collider.gameObject.CompareTag("Anchovy"))
                {
                    // Spawn the new fisherman and switch control to it
                    SpawnNewFisherman();
                }
            }
            // Draw the ray in the scene for visualization
            WebGLDebugRay debugRay = FindObjectOfType<WebGLDebugRay>();
            debugRay.SetRay(ray.origin, ray.direction, hit.distance);
        }
    }

    void SpawnNewFisherman()
    {
        // Instantiate the new fisherman prefab
        GameObject newFisherman = Instantiate(newFishermanPrefab);

        // Disable the controls on the old fisherman
        currentController.enabled = false;

        // Enable the controls on the new fisherman
        PlayerController newController = newFisherman.GetComponent<PlayerController>();
        newController.enabled = true;

        // Move the new fisherman to the current fisherman's position
        newFisherman.transform.position = currentFisherman.transform.position;

        // Set the current fisherman to the new fisherman
        Destroy(currentFisherman);
        currentFisherman = newFisherman;
        currentController = newController;

        // Update the player reference in the camera follow script
        cameraFollow.PlayerController = currentFisherman.transform;
    }
}