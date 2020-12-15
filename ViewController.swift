//
//  ViewController.swift
//  PL301project
//
//  Created by  rehab  on 11/20/20.
//  Copyright © 2020  rehab . All rights reserved.



import Foundation

import UIKit




class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
 
        struct Person{
            
            var fandlastName: String
            
            var Salary : Int
        }
        
        
        
        
        
    
    
        
        // File location
        let fileURLProject = Bundle.main.path(forResource: "employees_salary", ofType: "txt")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
            
        } catch let error as NSError {
            print("Failed reading from URL: \(String(describing: fileURLProject)), Error: " + error.localizedDescription)
        }
    
        
        let filemgr = FileManager.default
        
        if filemgr.fileExists(atPath: "/Applications") {
            
          
        } else {
            print("File not found")
        }

        
        
        //now split that string into an array of "rows" of data.  Each row is a string.
        let rows = readStringProject .components(separatedBy: "\n")
        
        
        
        
        
        
        
        
        
        
        
        
        
        var people = [Person]()
       
        var max = 0
        
        var min = 5000
        var sumSalary = 0
        
        var sumofSalayrs = 0
        
        
        
        //now loop around each row, and split it into each of its columns
        for row in rows {
            let columns = row.components(separatedBy: ",")
            
            //check that we have enough columns
            
            if columns.count == 2 {
            
                
                
                // put fandlastName  in columns 0
                let  fandlastName = columns[0]
                
                let Salary2 = columns[1]
                let Salary3 = Int(Salary2) ?? 0
        
                
                //casting for Salary to be integar
                let Salary4 = (Salary2 as NSString).integerValue
                
                
               let  person = Person(fandlastName: fandlastName, Salary: Salary4 )
                people.append(person)
               
                  print(person)
            
                
           
                
                
                
                
            
            var maxSalary = person.Salary
                
                if  maxSalary > max{
                    
                    max=maxSalary
                    
                }
                
 
                var minSalary = person.Salary
                
                if  minSalary < min{
                    
                    min = minSalary}
        
                  sumofSalayrs = person.Salary + sumofSalayrs
                
        
                
                
                }
            
            
        
                
            }
        
        
        
        
        /*
        let filename = "employeessalary.txt"
        
        let decomentdirURL = try! FileManager.default.url(for:.documentDirectory ,in:.userDomainMask, appropriateFor:nil,create:true)
        let fileURL = decomentdirURL.appendingPathComponent(filename).appendingPathExtension("text")
        
        print ("File Path : \(fileURL.path)")
        
        let WriteString =  people
        
        
        do{
            try  WriteString.write(to: fileURL, atomically: true , encoding: String.Encoding.utf8)
            
        }catch let error as NSError {
            
           /print ("failnd to write to URL ")
            print (error )
         }
        */
    
      
        
            print(max)
        
        
            print(min)
     
            print(sumofSalayrs)
        
        
        
        
      /*
        
     
        print("Enter name of employee : ")
        
        var  input: String = " "
        input  = readLine()!
            
        var output : String
        output=input + "," + input + "!"
        
        
        print(output)
        
        
             //people.remove(at: 2)
        
        
        */
        
        
        
            
        }

    
            
        }
        
        
   
        
    
        
       
        
        

   
    


public class Soundex {
    
    private static let en_mapping_string = Array("01230120022455012623010202".characters)
    private static let en_alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
    private let mapping: [Character:Character] = Soundex.buildMapping(codes:en_alphabet,alphabet:en_mapping_string)
    
    private static func buildMapping(codes: Array<Character>, alphabet: Array<Character>) -> [Character:Character] {
        var retval: [Character:Character] = [:]
        for (index,code) in codes.enumerated() {
            retval[code] = alphabet[index]
        }
        return retval
    }
    
    private var soundexMapping: Array<Character> = Array(repeating:" ",count:4)
    
    private func getMappingCode(s: String, index:Int) -> Character {
        let i = s.index(s.startIndex, offsetBy: index)
        
        let mappedChar = mapChar(c:s[i])
        
        if (index>1 && !(mappedChar=="0"))
        {
            let j = s.index(s.startIndex,offsetBy:index-1)
            
            let hwChar = s[j]
            
            if (hwChar=="H" || hwChar=="W")
            {
                let k = s.index(s.startIndex,offsetBy:index-2)
                let prehwChar = s[k]
                let firstCode = mapChar(c:prehwChar)
                if (firstCode==mappedChar || "H"==prehwChar || "W"==prehwChar) {
                    return "0"
                }
            }
        }
        
        return mappedChar
    }
    
    private func mapChar(c: Character) -> Character {
        if let val = mapping[c] {
            return val
        }
        return "0" // not specified in original Soundex specification, if character is not found, code is 0
    }
    
    public func soundex(of: String) -> String {
        
        guard (of.characters.count>0) else {
            return ""
        }
        
        let str=of.uppercased()
        
        var out: Array<Character> = Array("    ".characters)
        var last: Character = " "
        var mapped: Character = " "
        var incount=1
        var count = 1
        
        out[0]=str[str.startIndex]
        last = getMappingCode(s:str, index: 0)
        while (incount < str.characters.count && count < out.count) {
            mapped = getMappingCode(s:str, index: incount)
            incount += 1
            if (mapped != "0") {
                if (mapped != "0" && mapped != last) {
                    out[count]=mapped
                    count += 1
                }
            }
        }
        return String(out)
    }
}
 
        
        
        



    
    
  
    
    
    
    
    
    
 

    
    
        
        
        
        
  





