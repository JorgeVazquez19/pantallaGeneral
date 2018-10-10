//
//  iOsViewController.swift
//  iOs
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class iOsViewController: UIViewController {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var summaryLabelView: UILabel!
    @IBOutlet weak var seasonsLabelView: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imagenFondo: UIImageView!
    
    internal var series: [Serie] = []
    internal var indexCurrentSerie = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Series"
        setupBarButtonsItems()
        loadAllSeries()
        mainImageView.layer.borderColor = UIColor.green.cgColor
        refreshUIWithSerie(series[indexCurrentSerie])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func refreshUIWithSerie(_ serie: Serie){
        titleLabel.text = serie.name
        mainImageView.image = UIImage(named: serie.imageFile)
        summaryLabelView.text = serie.summary
        seasonsLabelView.text = "Temporada: " + "\(serie.seasons!)"
        imagenFondo.image = UIImage(named: serie.imageFile)
    }
    
    private func setupBarButtonsItems(){
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        navigationItem.setLeftBarButton(cancelBarButton, animated: false)
        
        let actorsBarButton = UIBarButtonItem(title: "Actores", style: .plain, target: self, action: #selector(actorsPressed))
        navigationItem.setRightBarButton(actorsBarButton, animated: false)
    }
    
    @objc private func cancelPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func actorsPressed(){
        let mySerie = series[indexCurrentSerie]
        let actorsVC = ActorsViewController(actors: mySerie.actors)
        navigationController?.pushViewController(actorsVC, animated: true)
    }
    
    private func loadAllSeries(){
        
        let leonardo = Actor(name: "Leonardo Di Caprio", avatarImage: "")
        let antonio = Actor(name: "Antonio Banderas", avatarImage: "")
        let sandra = Actor(name: "Sandra Bullock", avatarImage: "")
        
        let strangerThings = Serie(name: "Stranger Things", imageFile: "Stranger_Things_logo", summary: "Me agacho que vienen collejas… Stranger Things es perfecta para un maratón rápido de verano con el nivel crítico tirando a derretido porque, al igual que Dark o The OA, está muy pero que muy sobrevalorada. Sin las referencias ochenteras y los 'homenajes' a otras historias ya contadas, el fenómeno no tendría cabida. Entra en la lista porque, pese al copieteo, tiene encanto, trabaja bien la tensión y cuenta con un reparto muy acertado.", seasons: 8, actors:[leonardo, sandra])
        
         let californication = Serie(name: "Californication", imageFile: "californication", summary: "Ya lo sé, no es la mejor serie de la lista, pero para mí es un referente vital. Californication tiene los diálogos más rápidos, lascivos, profundos, canallas, cañeros, románticos, ácidos, surrealistas, ofensivos y creativos que he visto nunca en televisión. Y aunque cuenta la vida de un escritor mujeriego, vicioso y tirando a acabado, también esconde una de las más bellas historias de amor. ", seasons: 7, actors:[antonio])
        
        let perdidos = Serie(name: "Perdidos", imageFile: "Perdidos", summary: "Si a estas alturas no la has visto, tienes deberes. La televisión actual no se podría entender sin esta serie que dio una nueva dimensión a la estructura de flashbacks y cliffhangers. Los dramas personales y hasta sentimentales también funcionan como un tiro dentro de un misterio que, de tanto sobredimensionarlo, al final era imposible que cumpliera las expectativas. Si ya la has visto, te diremos que ha envejecido mejor de que lo que seguramente pensabas.", seasons: 7, actors:[])
        
        series.append(strangerThings)
        series.append(californication)
        series.append(perdidos)
    }
    
    @IBAction func changeSeriesNext(_ sender: UIButton){
        indexCurrentSerie = (indexCurrentSerie + 1) % series.count
        refreshUIWithSerie(series[indexCurrentSerie])
    }
    @IBAction func changeSeriesPrevious(_ sender: UIButton){
        if(indexCurrentSerie == 0){
            indexCurrentSerie = series.count
        }
        indexCurrentSerie = (indexCurrentSerie - 1) % series.count
        refreshUIWithSerie(series[indexCurrentSerie])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
