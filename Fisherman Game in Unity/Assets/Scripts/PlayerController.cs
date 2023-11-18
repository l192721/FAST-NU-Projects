using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float horizontalInput;
    public float verticalInput;
    public float speed = 10.0f;

    void Update()
    {
        horizontalInput = Input.GetAxis("Horizontal");
        transform.Rotate(Vector3.up * horizontalInput * Time.deltaTime * speed * 10);
        verticalInput = Input.GetAxis("Vertical");
        transform.Translate(Vector3.forward * verticalInput * Time.deltaTime * speed);

        if (transform.position.x > 45)
        {
            transform.position = new Vector3(45, transform.position.y, transform.position.z);
        }
        if (transform.position.x < -45)
        {
            transform.position = new Vector3(-45, transform.position.y, transform.position.z);
        }
        if (transform.position.z > 45)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, 45);
        }
        if (transform.position.z < -45)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, -45);
        }
    }
}