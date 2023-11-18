using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public GameObject[] fishPrefabs;

    void Start()
    {
        InvokeRepeating("spawnFish", 3.0f, 5.0f);
    }

    void spawnFish()
    {
        int fishIndex = Random.Range(0, fishPrefabs.Length); //Random Fish Generation
        Instantiate(fishPrefabs[fishIndex], new Vector3(Random.Range(-40.0f, 40.0f), 0, Random.Range(-40.0f, 40.0f)), fishPrefabs[fishIndex].transform.rotation);
    }
}