//
//  POTDViewModel.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import Foundation
import Combine

class POTDViewModel: ObservableObject {
    private var potdUseCase: FetchPOTDUseCase = FetchPOTDUseCase()
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var photoOfTheDay: PhotoOfTheDay?
    @Published var error: NetworkError?
    
    func load() {
        potdUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                    self.photoOfTheDay = nil
                    self.error = error
                }
            } receiveValue: { data in
                self.photoOfTheDay = data
            }
            .store(in: &subscriptions)
    }
    
}
