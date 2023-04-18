//
//  ViewController.swift
//  API Calling (01-02-2023)
//
//  Created by undhad kaushik on 02/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTabelView: UITableView!
    //  var arrUsers: [Dictionary<String,AnyObject>] = []
    var arrUSers: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    private func setup(){
        getSingelUsersDetailsUsingJSONDecoder ()
    }
    
    //    //1  ________________________________________________
    //
    //    private  func getUsers(){
    //        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "GET"
    //        request.httpBody = nil
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        URLSession.shared.dataTask(with: request) { data ,response , error in
    //            guard let apiData = data else { return }
    //            do{
    //                let users = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
    //                //  self.arrUSers = json
    //                self.arrUSers = []
    //                for i in 0..<users.count{
    //                    let user: User = User(userDetails: users[i] as! Decoder)
    //                    self.arrUSers.append(User)
    //                }
    //                DispatchQueue.main.async(){
    //                    self.userTabelView.reloadData()
    //                }
    //            } catch {
    //                print(error.localizedDescription)
    //            }
    //        }
    //        .resume()
    //    }
    //
    //    //2  _______________________________________________________
    //
    //    private  func getUsers(){
    //        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "GET"
    //        request.httpBody = nil
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        URLSession.shared.dataTask(with: request) { data ,response , error in
    //            guard let apiData = data else { return }
    //            do{
    //                let users = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
    //                //  self.arrUSers = json
    //                self.arrUSers = users.map { User(userDetails: $0) }
    //                DispatchQueue.main.async(){
    //                    self.userTabelView.reloadData()
    //                }
    //            } catch {
    //                print(error.localizedDescription)
    //            }
    //        }
    //        .resume()
    //    }
    //
    //    //3 _________________________________________________________________
    //
    //
    //    private func getSingleUserDetails(){
    //        guard let url = URL(string: "https://gorest.co.in/public/v2/users/563") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "GET"
    //        request.httpBody = nil
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        URLSession.shared.dataTask(with: request) { data,  response, error in
    //            guard let apiData = data else { return }
    //            do {
    //                let userDetailsDictionary =  try JSONSerialization.jsonObject(with: apiData) as! Dictionary<String,AnyObject>
    //                let user = User(userDetails: userDetailsDictionary)
    //                nameLabel.text = user.name
    //            } catch {
    //                print(error.localizedDescription)
    //            }
    //        }
    //        .resume()
    //    }
    //
    //
    
    private  func getSingelUsersDetailsUsingJSONDecoder(){
        guard let url = URL(string: "https://gorest.co.in/public/v2/users/284900") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data , response , error in
            guard let apiData = data else { return }
            do{
                let user = try JSONDecoder().decode(User.self, from: apiData)
                print(user.name)
            } catch {
                print("error.localizedDescription" )
            }
        }
        .resume()
    }
    
    
    //    private  func getUsersUsingJSONDecoder(){
    //        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "GET"
    //        request.httpBody = nil
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        URLSession.shared.dataTask(with: request) { data , response , error in
    //            guard let apiData = data else { return }
    //            do{
    //                self.arrUSers = try JSONDecoder().decode([User].self, from: apiData)
    //                DispatchQueue.main.async {
    //                    self.userTabelView.reloadData()
    //                }
    //            } catch {
    //                print(error.localizedDescription)
    //            }
    //        }
    //        .resume()
    //    }
}

extension ViewController: UITabBarDelegate ,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrUSers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let user = arrUSers[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(user.name) \n \(user.email)"
        return cell
    }
}

//class User{
//    var id: Int
//    var name: String
//    var email: String
//    var gender: String
//    var status: String
//
//    init(id: Int, name: String, email: String, gender: String, status: String) {
//        self.id = id
//        self.name = name
//        self.email = email
//        self.gender = gender
//        self.status = status
//    }
//    init(userDetails: Dictionary<String,AnyObject>){
//        id = userDetails["id"] as! Int
//        name = userDetails["name"] as! String
//        email = userDetails["email"] as! String
//        gender = userDetails["gender"] as! String
//        status = userDetails["status"] as! String
//    }
//}

struct User: Decodable{
    var id: Int
    var name: String
    var email: String
    var gender: String
    var Status: String
}
