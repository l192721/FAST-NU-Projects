using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManController : MonoBehaviour
{

    // Reference to the new car prefab
    public GameObject carPrefab;
    // Reference to the new bike prefab
    public GameObject bikePrefab;

    private float speed = 5.0f;
    private float turnSpeed = 100.0f;
    private float horizontalInput;
    private float forwardInput;

    private GameObject currentVehicle;
    private CameraFollow cameraFollow;

    void Start()
    {
        cameraFollow = FindObjectOfType<CameraFollow>();
        currentVehicle = gameObject;
    }

    void Update()
    {
        horizontalInput = Input.GetAxis("Horizontal");
        forwardInput = Input.GetAxis("Vertical");
        // Moves the vehicle forward based on Vertical Input
        transform.Translate(Vector3.forward * Time.deltaTime * speed * forwardInput);
        // Rotates the vehicle axis based on Horizontal Input
        transform.Rotate(Vector3.up, turnSpeed * horizontalInput * Time.deltaTime);
        if (transform.position.x > 10)
        {
            transform.position = new Vector3(10, transform.position.y, transform.position.z);
        }
        if (transform.position.x < -10)
        {
            transform.position = new Vector3(-10, transform.position.y, transform.position.z);
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "MyCar")
        {
            Destroy(currentVehicle);
            GameObject newVehicle = Instantiate(carPrefab, Vector3.zero, Quaternion.identity);
            currentVehicle = newVehicle;
            cameraFollow.PlayerController = newVehicle.transform;
        }
        else if (other.gameObject.tag == "MyBike")
        {
            Destroy(currentVehicle);
            GameObject newVehicle = Instantiate(bikePrefab, Vector3.zero, Quaternion.identity);
            currentVehicle = newVehicle;
            cameraFollow.PlayerController = newVehicle.transform;
        }
    }
}