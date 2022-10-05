//
//  InputViewController.swift
//  Neurognosis
//
//  Created by Yanying Huo on 4/25/22.
//

import UIKit

class InputViewController: UIViewController {

    var listOfSymptoms: String!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var muscleNeuron: CheckBox!
    @IBOutlet weak var speechDisorderNeuron: CheckBox!
    @IBOutlet weak var neuronMuscle: CheckBox!
    @IBOutlet weak var neuronLackOfCoordination: CheckBox!
    @IBOutlet weak var neuronAbnormalWalking: CheckBox!
    @IBOutlet weak var lackOfCoordinationNeuron: CheckBox!
    @IBOutlet weak var neuronSpeechDisorder: CheckBox!
    @IBOutlet weak var neuronSpondylosis: CheckBox!
    @IBOutlet weak var deformitiesNeuron: CheckBox!
    @IBOutlet weak var neuronDeformities: CheckBox!
    @IBOutlet weak var neuronMusculoskeletal: CheckBox!
    @IBOutlet weak var neuronDysphagia: CheckBox!
    @IBOutlet weak var spondylosisNeuron: CheckBox!
    @IBOutlet weak var abnormalWalkingNeuron: CheckBox!
    
   
    var muscleNeuron0 = "0"
    var speechDisorderNeuron0 = "0"
    var neuronMuscle0 = "0"
    var neuronLackOfCoordination0 = "0"
    var neuronAbnormalWalking0 = "0"
    var lackOfCoordinationNeuron0 = "0"
    var neuronSpeechDisorder0 = "0"
    var neuronSpondylosis0 = "0"
    var deformitiesNeuron0 = "0"
    var neuronDeformities0 = "0"
    var neuronMusculoskeletal0 = "0"
    var neuronDysphagia0 = "0"
    var spondylosisNeuron0 = "0"
    var abnormalWalkingNeuron0 = "0"
    
    var popUpWindow: PopUpWindow!
    
    let plistManager = PListManager()
    
    var diagnosis = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
    
    }
    
    func callAPI(){
        
        guard let url = URL(string: "http://127.0.0.1:8701/symptoms") else{
            return
        }

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8)
            {
                print(string)
                self.plistManager.writePlist(namePlist: "Data", key: "symptoms", data: string as AnyObject)
//                let diagnosis0 = self.plistManager.readPlist(namePlist: "Data", key: "symptoms")
//
//                print(diagnosis0)
            }
        }
        
        task.resume()
    }
    

    @IBAction func submitAction(_ sender: Any)
    {
        plistManager.writePlist(namePlist: "Data", key: "diagnosis", data: "NA" as AnyObject)
        
        if muscleNeuron.isChecked
        {
            muscleNeuron0 = "1"
        }
        else
        {
            muscleNeuron0 = "0"
        }
    
        if speechDisorderNeuron.isChecked
        {
            speechDisorderNeuron0 = "1"
        }
        else
        {
            speechDisorderNeuron0 = "0"
        }
        
        if neuronMuscle.isChecked
        {
            neuronMuscle0 = "1"
        }
        else
        {
            neuronMuscle0 = "0"
        }
        
        if neuronLackOfCoordination.isChecked
        {
            neuronLackOfCoordination0 = "1"
        }
        else
        {
            neuronLackOfCoordination0 = "0"
        }
        
        if neuronAbnormalWalking.isChecked
        {
            neuronAbnormalWalking0 = "1"
        }
        else
        {
            neuronAbnormalWalking0 = "0"
        }
        
        if lackOfCoordinationNeuron.isChecked
        {
            lackOfCoordinationNeuron0 = "1"
        }
        else
        {
            lackOfCoordinationNeuron0 = "0"
        }
        
        if neuronSpeechDisorder.isChecked
        {
            neuronSpeechDisorder0 = "1"
        }
        else
        {
            neuronSpeechDisorder0 = "0"
        }
        
        if neuronSpondylosis.isChecked
        {
            neuronSpondylosis0 = "1"
        }
        else
        {
            neuronSpondylosis0 = "0"
        }
        
        if deformitiesNeuron.isChecked
        {
            deformitiesNeuron0 = "1"
        }
        else
        {
            deformitiesNeuron0 = "0"
        }
        
        if neuronDeformities.isChecked
        {
            neuronDeformities0 = "1"
        }
        else
        {
            neuronDeformities0 = "0"
        }
        
        if neuronMusculoskeletal.isChecked
        {
            neuronMusculoskeletal0 = "1"
        }
        else
        {
            neuronMusculoskeletal0 = "0"
        }
        
        if neuronDysphagia.isChecked
        {
            neuronDysphagia0 = "1"
        }
        else
        {
            neuronDysphagia0 = "0"
        }
        
        if spondylosisNeuron.isChecked
        {
            spondylosisNeuron0 = "1"
        }
        else
        {
            spondylosisNeuron0 = "0"
        }
        
        if abnormalWalkingNeuron.isChecked
        {
            abnormalWalkingNeuron0 = "1"
        }
        else
        {
            abnormalWalkingNeuron0 = "0"
        }
        
        let urlString = "http://127.0.0.1:8701/predictALS?in_ALS=0" + "&in_MuscleNeuron=" + muscleNeuron0 + "&in_SpeechNeuron=" + speechDisorderNeuron0 + "&in_NeuronMuscle=" + neuronMuscle0 +  "&in_NeuronCoordination=" + neuronLackOfCoordination0 + "&in_NeuronWalking=" + neuronAbnormalWalking0 +  "&in_CoordinationNeuron=" + lackOfCoordinationNeuron0 + "&in_NeuronSpeech=" + neuronSpeechDisorder0 + "&in_NeuronSpondylosis=" + neuronSpondylosis0 +  "&in_DeformitiesNeuron=" + deformitiesNeuron0 +  "&in_NeuronDeformities=" + neuronDeformities0 + "&in_NeuronMusculoSkeletal="  +  neuronMusculoskeletal0 + "&in_NeuronDysphagia=" + neuronDysphagia0 + "&in_SpondylosisNeuron=" + spondylosisNeuron0 + "&in_WalkingNeuron=" + abnormalWalkingNeuron0
        var request = URLRequest(url: URL(string: urlString)!)
        print(urlString)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                    self.plistManager.writePlist(namePlist: "Data", key: "diagnosis", data: dataString as AnyObject)
                    let diagnosis0 = self.plistManager.readPlist(namePlist: "Data", key: "diagnosis")
                    let diagnosis1 = diagnosis0 as! String
                    print(diagnosis1 + "hola")
                    DispatchQueue.main.async {
                        self.diagnosis = diagnosis1
                        var phrase = "You do not have ALS."
                        
                        if(self.diagnosis.contains("Yes"))
                        {
                            phrase = "You have ALS."
                        }
                        self.popUpWindow = PopUpWindow(title: "Diagnosis", text: phrase, buttontext: "OK")
                        self.present(self.popUpWindow, animated: true, completion: nil)
                    }
                    
                }
        }
        
        task.resume()
        
    }
    
//    func decodeAPI(){
//        guard let url = URL(string: "http://127.0.0.1:8701/symptoms") else{return}
//
//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//            
//            let decoder = JSONDecoder()
//
//            if let data = data{
//                do{
//                    let tasks = try decoder.decode([Post].self, from: data)
//                    tasks.forEach{ i in
//                        print(i.title)
//                    }
//                }catch{
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
