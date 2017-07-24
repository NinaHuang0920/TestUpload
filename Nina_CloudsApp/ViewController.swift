
import UIKit
import Alamofire


class ViewController: UIViewController
{

    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://httpbin.org/get").responseJSON{response in
//            print(response.request as Any)
//            print(response.response as Any)
//            print(response.data as Any)
//            print(response.result)
//            
//            if let ARRAY = response.result.value{
//                print("準備印出result中的資料")
//                print(ARRAY)
//            }
            
            //解出JSON來源：https://httpbin.org/get
            
            if let JSON = response.result.value
            {
                if let dictionary = JSON as? [String:Any]
                {
                    if let value = dictionary["origin"] as? String
                    {
                        print("解出key為origin的值")
                        print(value)
                    }
                    if let value = dictionary["url"] as? String
                    {
                        print("解出key為url的值")
                        print(value)
                    }
                    //===============<解headers:再解一次JSON物件>===================
                    if let headers_dictionary = dictionary["headers"] as? [String: Any]
                    {
                        for (key, value) in headers_dictionary
                        {
                            if let value_string = value as? String
                            {
                                print(key + ":" + value_string)
                            }
                        }
                    }
                    //================<解args>=====================
                    if let value = dictionary["args"] as? String //解不出來，因為不是String
                    {
                    print("解出key為args的值")
                    print(value)
                    }

                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

