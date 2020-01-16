//
//  ViewController.swift
//  JsonFileViewerApp
//
//  Created by Erkan on 1/15/20.
//  Copyright © 2020 ErkanVolkan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
           let decoder=JSONDecoder()
        do{
            let obj=try decoder.decode(JsonService.self, from: dataJson)
            for car in obj.car {
        print("CAR")
                print(car.object_summary.type)
                print(car.object_summary.name)
                print(car.object_summary.color)
                print(car.object_summary.description)
                print(car.doors)
                print(car.price)
                print(car.milage)
                
            }
            for computer in obj.computer {
                print("Computer")
                print(computer.object_summary.type)
                print(computer.object_summary.name)
                print(computer.object_summary.color)
                print(computer.object_summary.description)
                print(computer.purchase_date)
                print(computer.image.width)
                print(computer.image.height)
                print(computer.image.url)
            }
            for cat in obj.cat{
            print("Cat")
            print(cat.object_summary.type)
            print(cat.object_summary.name)
            print(cat.object_summary.color)
            print(cat.object_summary.description)
            print(cat.age)
            print(cat.favorite_toy)
            print(cat.image.width)
            print(cat.image.height)
            print(cat.image.url)
            }
            for dog in obj.dog{
            print("Dog")
            print(dog.object_summary.type)
            print(dog.object_summary.name)
            print(dog.object_summary.color)
            print(dog.object_summary.description)
            print(dog.age)
            print(dog.favorite_toy)
            print(dog.image.width)
            print(dog.image.height)
            print(dog.image.url)
            }
            
        } catch {
            print("\(error)")
        }
        
    }
    let dataJson="""
    {
      "car": [{
            "object_summary": {
               "type": "consumer product",
               "name": "ford",
               "color": "red",
               "description": "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of car say they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods.[2][3] Cars came into global use during the 20th century, and developed economies depend on them. The year 1886 is regarded as the birth year of the modern car when German inventor Karl Benz patented his Benz Patent-Motorwagen. Cars became widely available in the early 20th century. One of the first cars that were accessible to the masses was the 1908 Model T, an American car manufactured by the Ford Motor Company. Cars were rapidly adopted in the US, where they replaced animal-drawn carriages and carts, but took much longer to be accepted in Western Europe and other parts of the world."
            },
            "doors": "2",
            "price": "$30000",
            "milage": "100 miles"
          }],
         "computer": [{
            "object_summary": {
               "type": "hardware",
               "name": "mac",
               "color": "silver",
               "description": "A computer is a device that can be instructed to carry out sequences of arithmetic or logical operations automatically via computer programming. Modern computers have the ability to follow generalized sets of operations, called programs. These programs enable computers to perform an extremely wide range of tasks.Computers are used as control systems for a wide variety of industrial and consumer devices. This includes simple special purpose devices like microwave ovens and remote controls, factory devices such as industrial robots and computer-aided design, and also general purpose devices like personal computers and mobile devices such as smartphones. Early computers were only conceived as calculating devices. Since ancient times, simple manual devices like the abacus aided people in doing calculations. Early in the Industrial Revolution, some mechanical devices were built to automate long tedious tasks, such as guiding patterns for looms. More sophisticated electrical machines did specialized analog calculations in the early 20th century. The first digital electronic calculating machines were developed during World War II. The speed, power, and versatility of computers have been increasing dramatically ever since then."
            },
            "purchase_date": "March 4, 2018",
            "image": {
               "url": "https://seniorsnoworlando.org/wp-content/uploads/2014/05/IMG_0009-1038x576.jpg",
               "width": "50px",
               "height": "50px"
            }
          }],
          "cat": [{
            "object_summary": {
               "type": "animal",
               "name": "Max",
               "color": "orange",
               "description": "The domestic cat (Felis silvestris catus or Felis catus)[1][5] is a small, typically furry, carnivorous mammal. They are often called house cats[6] when kept as indoor pets or simply cats when there is no need to distinguish them from other felids and felines. They are often valued by humans for companionship and for their ability to hunt vermin. There are more than seventy cat breeds recognized by various cat registries."
            },
            "age": "2 years",
            "favorite_toy": "ball",
            "image": {
               "url": "https://www.petful.com/wp-content/uploads/2016/06/american-shorthair-cat-750x434.jpg",
               "width": "50px",
               "height": "50px"
            }
          }],
          "dog": [{
            "object_summary": {
               "type": "animal",
               "name": "Jimmy",
               "color": "black",
               "description": "The domestic dog (Canis lupus familiaris when considered a subspecies of the gray wolf or Canis familiaris when considered a distinct species)[4] is a member of the genus Canis (canines), which forms part of the wolf-like canids,[5] and is the most widely abundant terrestrial carnivore.[6][7][8][9][10] The dog and the extant gray wolf are sister taxa[11][12][13] as modern wolves are not closely related to the wolves that were first domesticated,[12][13] which implies that the direct ancestor of the dog is extinct.[14] The dog was the first species to be domesticated[13][15] and has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes."
            },
            "age": "3 years",
            "favorite_toy": "stuff animal",
            "image": {
               "url": "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000934/Beagle-On-White-08.jpg",
               "width": "50px",
               "height": "50px"
            }
          }]
    }
    """.data(using: .utf8)!

    struct JsonService:Codable{
        var computer:[PcResult]
        var car:[CarResult]
        var cat,dog:[AnimalResult]
    }
    struct AnimalResult:Codable{
        struct object_summary:Codable{
                let type,name,color,description:String
                
                }
        struct image:Codable{
                let url,width,height:String
                }
        let age,favorite_toy:String
        let object_summary:object_summary
        let image:image
        
    }
    struct PcResult:Codable{
        struct object_summary:Codable{
                let type,name,color,description:String
        }
        struct image:Codable{
                let url,width,height:String
        }
                let purchase_date:String
                let object_summary:object_summary
                let image:image
    }

    struct CarResult:Codable{
        struct object_summary:Codable{
                let type,name,color,description:String
        }
                let doors,price,milage:String
                let object_summary:object_summary
    }


}



