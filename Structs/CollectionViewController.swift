//
//  CollectionViewController.swift
//  Structs
//
//  Created by paco williams on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    
    
    @IBOutlet var lessonView: UICollectionView!
    
    
    var lessons: [Lesson] = []
    
    var dataLoader = Helper();
    var structs: [Struct]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLoader = Helper()
        
        structs = dataLoader.readJSONFilesGetStructs()
    
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let topicView = segue.destination as! TopicsTableViewController
        
        let index = lessonView.indexPathsForSelectedItems?.first?.row
        
        let lesson = structs[index!]
        topicView.DataStructure = lesson.lesson
        
        //send topics for this specific struct
        topicView.Topics = structs[index!].topics
        
        
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    
//
//     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        return CGSize(width: 400, height: 500)
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return structs.count
    }
    
    
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Lesson", for: indexPath) as! LessonCell
               
    
        
        let lesson = structs[indexPath.row]
        cell.title.text! = lesson.lesson
        cell.difficulty.text! = lesson.level
        cell.desc.text! = lesson.description
        cell.percentage.text = String("\(lesson.percentage * 100) % Completed")
        cell.progressBar.progress = lesson.percentage
        
        
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 0.2
        cell.layer.borderWidth = 1
    
            
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
