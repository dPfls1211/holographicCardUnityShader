using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rotation : MonoBehaviour
{
   
    public int maskNumber = 1;
    
    [Range(-1, 1)]
    public float rotationSpeedH = 0.7f;
    [Range(-1, 1)]
    public float rotationSpeedV = 0.4f;
    [Range(0, 60)]
    public float angleH = 20;
    [Range(0, 60)]
    public float angleV = 8;

    private float rotationCounter = 0;
    

    // Update is called once per frame
    void Update()
    {
        rotationCounter += Time.deltaTime;
        transform.eulerAngles = new Vector3(Mathf.Sin(rotationCounter * rotationSpeedV) * angleV, Mathf.Sin(rotationCounter * rotationSpeedH) * angleH, 0);

    }
}
