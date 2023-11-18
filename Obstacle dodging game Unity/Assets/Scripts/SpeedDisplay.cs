using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SpeedDisplay : MonoBehaviour
{
    public TMP_Text speedtext;
    // Start is called before the first frame update
    void Start()
    {
        speedtext.text = "Speed: 0";
    }

    // Update is called once per frame
    void Update()
    {
        speedtext.text = "Speed: " + PlayerController.speed;
    }
}