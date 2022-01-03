//
//  SceneDelegate.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import Foundation

class QuestionBank{
    
    var list = [Question]()
    init() {
        list.append(Question(image: "1test",
                             questionText: (NSLocalizedString("ALGORITHM", comment: "")),
                             choiceA: (NSLocalizedString("A. الحلقة",comment: "")),
                             choiceB: (NSLocalizedString("B. المصفوفة",comment: "")),
                             choiceC: (NSLocalizedString("C.الاخطاء",comment: "")),
                             choiceD: (NSLocalizedString("D.عملية او مجموعة قواعد يجب اتباعها",comment: "")),
                             answer: 4))
        
        list.append(Question(image: "2test",
                             questionText:(NSLocalizedString( "BOOLEAN",comment: "")),
                             choiceA: (NSLocalizedString("A. مربع",comment: "")),
                             choiceB: (NSLocalizedString("B. كود",comment: "")),
                             choiceC: (NSLocalizedString("C. القيمة تكون صحيحة او خاطئة",comment: "")),
                             choiceD: (NSLocalizedString("صيغة ",comment: "")),
                             answer: 3))
        
        list.append(Question(image: "3test",
                             questionText:"BorderRadius",
                             //                             questionText:(NSLocalizedString( "BorderRadius",comment: "")),
                             choiceA:(NSLocalizedString( "A. الوان",comment: "")),
                             choiceB:(NSLocalizedString( "B. الحدود",comment: "")),
                             choiceC:(NSLocalizedString( "C.دائرة ",comment: "")),
                             choiceD:(NSLocalizedString( "D.شكل ",comment: "")),
                             answer: 2))
        
        list.append(Question(image: "4test",
                             //                             questionText:(NSLocalizedString( " BUG",comment: "")),
                             questionText: " BUG",
                             choiceA:(NSLocalizedString( "A.خطأ برمجي",comment: "")),
                             choiceB: (NSLocalizedString("B. نملة",comment: "")),
                             choiceC: (NSLocalizedString("C. حشرة",comment: "")),
                             choiceD:(NSLocalizedString( "D.خطأ منطقي",comment: "")),
                             answer: 1))
        
        list.append(Question(image: "5test" ,
                             //                             questionText:(NSLocalizedString( "CSS",comment: "")),
                             questionText:"CSS",
                             choiceA: (NSLocalizedString("A.دالة" ,comment: "")),
                             choiceB: (NSLocalizedString("B. برمجية" ,comment: "")),
                             choiceC: (NSLocalizedString("C. حلقة" ,comment: "")),
                             choiceD: (NSLocalizedString("D.(Cascading Style Sheet)",comment: "")),
                             answer: 4))
        
        list.append(Question(image: "6test" ,
                             //                             questionText:(NSLocalizedString( "DEBUG",comment: "")),
                             questionText:"DEBUG",
                             choiceA: (NSLocalizedString("A. تصحيح برمجي" ,comment: "")),
                             choiceB: (NSLocalizedString("B. زوايا" ,comment: "")),
                             choiceC: (NSLocalizedString("C. خطأ برمجي" ,comment: "")),
                             choiceD: (NSLocalizedString("D. لعبة",comment: "")),
                             answer: 1))
        
        list.append(Question(image: "2test",
                             questionText:(NSLocalizedString( "القيمة المنطقية BOOLEAN ",comment: "")),
                             choiceA: (NSLocalizedString("A. مربع",comment: "")),
                             choiceB: (NSLocalizedString("B. كود",comment: "")),
                             choiceC: (NSLocalizedString("C. القيمة تكون صحيحة او خاطئة",comment: "")),
                             choiceD: (NSLocalizedString("صيغة ",comment: "")),
                             answer: 3))
    }
}

//
//
//                     questionText: (NSLocalizedString("ALGORITHMالخوارزمية ", comment: "")),
//                     choiceA: (NSLocalizedString("A. الحلقة",comment: "")),
//                     choiceB: (NSLocalizedString("B. المصفوفة",comment: "")),
//                     choiceC: (NSLocalizedString("C.الاخطاء",comment: "")),
//                     choiceD: (NSLocalizedString("D.عملية او مجموعة قواعد يجب اتباعها",comment: "")),
//                     answer: 4))
//
//list.append(Question(image: "2test",
//                     questionText:(NSLocalizedString( "القيمة المنطقية BOOLEAN ",comment: "")),
//choiceA: (NSLocalizedString("A. مربع",comment: "")),
//choiceB: (NSLocalizedString("B. كود",comment: "")),
//choiceC: (NSLocalizedString("C. القيمة تكون صحيحة او خاطئة",comment: "")),
//choiceD: (NSLocalizedString("صيغة ",comment: "")),
//answer: 3))
//
//list.append(Question(image: "3test",
//                     questionText:(NSLocalizedString( "BorderRadius",comment: "")),
//                     choiceA:(NSLocalizedString( "A. الوان",comment: "")),
//                     choiceB:(NSLocalizedString( "B. الحدود",comment: "")),
//                     choiceC:(NSLocalizedString( "C.دائرة ",comment: "")),
//                     choiceD:(NSLocalizedString( "D.شكل ",comment: "")),
//                     answer: 2))
//
//list.append(Question(image: "4test",
//                     questionText:(NSLocalizedString( " BUG",comment: "")),
//                     choiceA:(NSLocalizedString( "A.خطأ برمجي",comment: "")),
//                     choiceB: (NSLocalizedString("B. نملة",comment: "")),
//                     choiceC: (NSLocalizedString("C. حشرة",comment: "")),
//                     choiceD:(NSLocalizedString( "D.خطأ منطقي",comment: "")),
//                     answer: 1))
//
//list.append(Question(image: "5test" ,
//                     questionText:(NSLocalizedString( "CSS",comment: "")),
//                     choiceA: (NSLocalizedString("A.دالة" ,comment: "")),
//                     choiceB: (NSLocalizedString("B. برمجية" ,comment: "")),
//                     choiceC: (NSLocalizedString("C. حلقة" ,comment: "")),
//                     choiceD: (NSLocalizedString("D.(Cascading Style Sheet)",comment: "")),
//                     answer: 4))
//
//list.append(Question(image: "6test" ,
//                     questionText:(NSLocalizedString( "DEBUG",comment: "")),
//                     choiceA: (NSLocalizedString("A. تصحيح برمجي" ,comment: "")),
//                     choiceB: (NSLocalizedString("B. زوايا" ,comment: "")),
//                     choiceC: (NSLocalizedString("C. خطأ برمجي" ,comment: "")),
//                     choiceD: (NSLocalizedString("D. لعبة",comment: "")),
//                     answer: 1))
//}
//}
