import Foundation
// Sachin Daingade.

var greeting = "Hello, playground"

func serviceOne(complition: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() +  .seconds(1), execute: {
        complition("Service one Completed")
    })
}

func serviceTwo(complition: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() +  .seconds(2), execute: {
        complition("Service two Completed")
    })
}

func serviceThree(complition: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3), execute: {
        complition("Service three Completed")
    })
}


func comsumeServicesGather() {
    let group = DispatchGroup()
    var captureValues = ""
    
    group.enter()
   
    serviceOne { str in
        captureValues.append(" ")
        captureValues.append(str)
        captureValues.append(" ")
        group.leave()
    }
    
    group.enter()
    serviceTwo { str in
        captureValues.append(" ")
        captureValues.append(str)
        captureValues.append(" ")

        group.leave()
    }
    
    group.enter()
    serviceThree { str in
        captureValues.append(" ")
        captureValues.append(str)
        captureValues.append(" ")
       
        group.leave()
    }
    
    group.notify(queue: .main) {
        print("Notify excuted \(captureValues)")
    }
    
   
}

comsumeServicesGather()
