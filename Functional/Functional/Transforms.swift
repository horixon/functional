//
//  Transforms.swift
//  Functional
//
//  Created by justin on 3/25/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//
struct Zip<T0,T1> {
    typealias Element=(T0,T1)
    static func unzip<S:SequenceType where S.Generator.Element == Element>(source:S) -> (SequenceOf<T0>,SequenceOf<T1>) {
        return (source|Seq.map{(e: Element) -> T0 in return e.0 }, source|Seq.map{(e: Element) -> T1 in return e.1 })
    }
}

public struct Seq {
    
    public static func filter<S:SequenceType>(includeElement:(S.Generator.Element)->Bool ) -> (S) -> SequenceOf<S.Generator.Element> {
        typealias E=S.Generator.Element
        typealias G=GeneratorOf<E>
        
        return {(source:S) -> SequenceOf<E> in
            return SequenceOf<E>{ () -> G in
                
                var generator = source.generate()
                return G {
                    if var current = generator.next()  {
                        while !includeElement(current) {
                            if let next = generator.next() {
                                current = next
                            }else {
                                return Optional.None
                            }
                        }
                        return current
                    }
                    else {
                        return Optional.None
                    }
                }
            }
        }
    }
    
    public static func reduce<S:SequenceType,U>(initial:U,combine:(U, S.Generator.Element)-> U) -> (S) -> U {
        
        return {
            (source:S) -> U in
            return Swift.reduce(source, initial, combine)
        }
    }
    
    public static func zip<S0:SequenceType, S1:SequenceType>(s0:S0,s1:S1) -> SequenceOf<(S0.Generator.Element,S1.Generator.Element)>{
        typealias U=(S0.Generator.Element,S1.Generator.Element)
        typealias G=GeneratorOf<U>
        
        return SequenceOf<U>{ () -> G in
            
            var s0generator = s0.generate()
            var s1generator = s1.generate()
            return G{
                
                let x:S0.Generator.Element? = s0generator.next()
                let y:S1.Generator.Element? = s1generator.next()
                
                if  x != nil && y != nil {
                    return (x!,y!)
                }
                else {
                    return Optional.None
                }
            }
        }
    }
    
    public static func unzip<T0, T1, S:SequenceType where S.Generator.Element == Zip<T0, T1>.Element>(source:S) ->  (SequenceOf<T0>,SequenceOf<T1>) {
        return Zip<T0,T1>.unzip(source)
    }
    
    public static func map<S:SequenceType,T>(transform:(S.Generator.Element)-> T) -> (S) -> SequenceOf<T> {
        
        return {(source:S) -> SequenceOf<T> in
            return SequenceOf<T>{() -> GeneratorOf<T> in
                
                var generator = source.generate()
                
                return GeneratorOf<T> {
                    if let current = generator.next() {
                        return transform(current)
                    }
                    return Optional.None
                }
            }
        }
    }
}