using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform PlayerController;
    private Vector3 offset = new Vector3(0, 6, -7);
    void LateUpdate()
    {
        transform.position = PlayerController.transform.position + offset;
    }
}