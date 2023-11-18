using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public AudioClip StartSound;
    public AudioClip HitSound;
    public AudioClip GameOverSound;
    private AudioSource audioSource;

    public static float speed = 20.0f;
    private float turnSpeed = 100.0f;
    private float horizontalInput;
    private float forwardInput;
    public static bool isFinished = false;

    void Start()
    {
        audioSource = GetComponent<AudioSource>();
        audioSource.PlayOneShot(StartSound);
    }
    void Update()
    {
        if (speed <= 0)
            speed = 10;
        horizontalInput = Input.GetAxis("Horizontal");
        forwardInput = Input.GetAxis("Vertical");
        //Moves the car forward based on Vertical Input
        transform.Translate(Vector3.forward * Time.deltaTime * speed * forwardInput);
        //Rotates the car axis based on Horizontal Input
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
        if (other.gameObject.tag == "Animal")
        {
            audioSource.PlayOneShot(HitSound);
            Destroy(other.gameObject);
            speed += 10.0f;
        }
        else if (other.gameObject.tag == "RacingCar")
        {
            audioSource.PlayOneShot(HitSound);
            Destroy(other.gameObject);
            speed -= 50.0f;
        }
        else if (other.gameObject.tag == "DeliveryVehicle")
        {
            audioSource.PlayOneShot(HitSound);
            Destroy(other.gameObject);
            speed -= 30.0f;
        }
        if (other.gameObject.tag == "Finish")
        {
            audioSource.PlayOneShot(GameOverSound);
            isFinished = true;
        }
    }
}