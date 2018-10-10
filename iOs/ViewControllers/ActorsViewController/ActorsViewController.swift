//
//  ActorsViewController.swift
//  iOs
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class ActorsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    internal var actors:[Actor] = []
    
    convenience init(actors: [Actor]){
        self.init()
        self.actors = actors
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actors"
        registerCells()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func registerCells(){
        let identifier = "ActorCell"
        let emptyIdentifier = "emptyCell"
        
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView?.register(cellNib, forCellReuseIdentifier: identifier)
        
        let cellNibEmpty = UINib(nibName: "TableViewEmptyCell", bundle: nil)
        tableView?.register(cellNibEmpty, forCellReuseIdentifier: emptyIdentifier)
    }
}

extension ActorsViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(actors.count != 0){
            return actors.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(actors.count == 0){
            return 175
        }else{
           return 55.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
            if(actors.count == 0){
                let emptyCell: TableViewEmptyCell = (tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as? TableViewEmptyCell)!
                return emptyCell
            }else{
                let cell: ActorCell = (tableView.dequeueReusableCell(withIdentifier: "ActorCell", for: indexPath) as? ActorCell)!
                cell.ActorLabel.text = "Ejemplo de nombre \(indexPath.row)"
                let actor = actors[indexPath.row]
                cell.ActorLabel.text = actor.name
                cell.delegate = self
                return cell
            }
            
            
            
    }
    extension ActorsViewController: EmptyStatusCellDelegate {
        func emptyStatusCellDidPressBack(cell: TableViewEmptyCell)
    }
}
