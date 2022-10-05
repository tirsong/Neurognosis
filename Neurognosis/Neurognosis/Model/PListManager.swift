//
//  PListManager.swift
//  Neurognosis
//
//  Created by Yanying Huo on 4/26/22.
//

import UIKit

class PListManager: NSObject
{
    
    func writePlist(namePlist: String, key: String, data: AnyObject)
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent(namePlist+".plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: path)
        {
            
            dict.setObject(data, forKey: key as NSCopying)
            if dict.write(toFile: path, atomically: true)
            {
                print("Success")
                print(dict)
            }
            else
            {
                print("1. plist_write_error")
            }
        }
        else
        {
            if let privPath = Bundle.main.path(forResource: namePlist, ofType: "plist")
            {
                if let dict = NSMutableDictionary(contentsOfFile: privPath)
                {
                    dict.setObject(data, forKey: key as NSCopying)
                    if dict.write(toFile: path, atomically: true)
                    {
                        print("success")
                    }
                    else
                    {
                        print("2. plist_write_error")
                    }
                }
                else
                {
                    print("success")
                }
            }
            else
            {
                print("error_find_plist")
            }
        }
    }


    
    
    func readPlist(namePlist: String, key: String) -> AnyObject
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent(namePlist+".plist")
        
        var output:AnyObject = false as AnyObject
        
        if let dict = NSMutableDictionary(contentsOfFile: path)
        {
            output = dict.object(forKey: key)! as AnyObject
        }
        else
        {
            if let privPath = Bundle.main.path(forResource: namePlist, ofType: "plist")
            {
                if let dict = NSMutableDictionary(contentsOfFile: privPath)
                {
                    output = dict.object(forKey: key)! as AnyObject
                }
                else
                {
                    output = false as AnyObject
                    print("error_read")
                }
            }
            else
            {
                output = false as AnyObject
                print("error_read")
            }
        }
        return output
    }
    

}

