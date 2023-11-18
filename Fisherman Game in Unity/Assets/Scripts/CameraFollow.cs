using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform PlayerController;
    private Vector3 offset = new Vector3(-15, 15, 0);
    void LateUpdate()
    {
        transform.position = PlayerController.transform.position + offset;
    }
    public void SetPlayerController(Transform newController)
    {
        PlayerController = newController;
    }
}