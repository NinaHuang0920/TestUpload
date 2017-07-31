
import UIKit
import Alamofire


class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //解出JSON來源：https://api.github.com/users/octocat/repos
        Alamofire.request("https://api.github.com/users/octocat/repos").responseJSON { response in
            //更符合內容的命名變數名稱為result_value
            if let result_value = response.result.value
            {
                if let array = result_value as? [Any] //將result_value解讀為任何型態的陣列
                {
                //    if let JSON_OBJECT = array.first  //將陣列的第1個JSON物件做解析
                    for JSON_OBJECT in array
                    {
                        if let dictionar = JSON_OBJECT as? [String: Any]//將JSON物件轉成key-value陣列
                        {
                            if let value = dictionar["id"] as? Int
                            {
                                print("id: \(value)")
                            }
                            if let value = dictionar["name"] as? String
                            {
                                print("name: \(value)")
                            }
                            if let value = dictionar["private"] as? Bool
                            {
                                print("private: \(value)")
                            }
                            
                            if let value = dictionar["homepage"] as? String
                            {
                                print("homepage: \(value)")
                            }
                            else
                            {
                                print("homepage: null") //不知道原始格式之下的處理
                            }

                        
                            
                        }
                    }
                }
                
            }
        }
      
        /*
        //解出JSON來源：https://httpbin.org/get
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
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

