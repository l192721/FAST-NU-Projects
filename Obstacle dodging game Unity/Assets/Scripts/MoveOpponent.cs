using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveOpponent : MonoBehaviour
{
    public float speed = 40.0f;

    // Update is called once per frame
    void Update()
    {
        transform.Translate(Vector3.forward * Time.deltaTime * speed);
        if (transform.position.x > 10)
        {
            Destroy(gameObject);
        }
        if (transform.position.x < -10)
        {
            Destroy(gameObject);
        }
        if (transform.position.z < 0)
        {
            Destroy(gameObject);
        }
    }
}