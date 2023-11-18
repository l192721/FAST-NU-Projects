using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public GameObject[] Opponents;
    void Start()
    {
        InvokeRepeating("spawnOpponents", 1.0f, 4.0f);
    }

    void spawnOpponents()
    {
        int randomValue = Random.Range(0, 2);
        if (randomValue == 0)
        {
            int OpponentsIndex = Random.Range(0, Opponents.Length); //Random Opponents Generation
            Instantiate(Opponents[OpponentsIndex], new Vector3(Random.Range(-10f, 10f), 0, 200), Opponents[OpponentsIndex].transform.rotation);
        }
        else
        {
            int OpponentsIndex = Random.Range(0, Opponents.Length); //Random Opponents Generation
            Instantiate(Opponents[OpponentsIndex], new Vector3(Random.Range(-10f, 10f), 0, 420), Opponents[OpponentsIndex].transform.rotation);
        }
    }
}