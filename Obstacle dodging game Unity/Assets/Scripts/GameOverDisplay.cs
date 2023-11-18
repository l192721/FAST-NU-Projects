using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class GameOverDisplay : MonoBehaviour
{
    private float startTime;
    private float playTime;
    public TMP_Text gameovertext;
    private bool displayed;
    private float quickestPlayTime;

    // Start is called before the first frame update
    void Start()
    {
        displayed = false;
        startTime = Time.time;
        gameovertext.text = "";
        quickestPlayTime = PlayerPrefs.GetFloat("QuickestPlayTime", Mathf.Infinity);
    }

    // Update is called once per frame
    void Update()
    {
        // Update play time
        playTime = Time.time - startTime;
        if (PlayerController.isFinished && !displayed)
        {
            // Update quickest play time if the current play time is faster
            if (playTime < quickestPlayTime)
            {
                quickestPlayTime = playTime;
                PlayerPrefs.SetFloat("QuickestPlayTime", quickestPlayTime);
            }
            float playTimeSeconds = Mathf.Round(playTime);
            float QPTime= Mathf.Round(quickestPlayTime);
            gameovertext.text = "Game Over, you took " + playTimeSeconds + " sec to complete it..... Best Time: " + QPTime + "sec.";
            displayed = true;
        }
    }
}