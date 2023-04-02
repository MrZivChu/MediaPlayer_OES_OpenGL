using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Main : MonoBehaviour
{
    private AndroidJavaObject mUnityAcvity;
    void Start()
    {
        Debug.Log("zwh Start");
        if (Application.platform == RuntimePlatform.Android)
        {
            mUnityAcvity = new AndroidJavaClass("com.unity3d.player.UnityPlayer").GetStatic<AndroidJavaObject>("currentActivity");
            mUnityAcvity.Call("initSurface");
        }
    }

    public void UpdateTexImage()
    {
        if (Application.platform == RuntimePlatform.Android && mUnityAcvity != null)
        {
            mUnityAcvity.Call("updateTexImage");
        }
    }
}
