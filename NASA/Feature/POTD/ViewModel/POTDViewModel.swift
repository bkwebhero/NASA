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
    
    @Published var selectedDate: Date = Date()
    @Published var photoOfTheDay: PhotoOfTheDay?
    @Published var error: NetworkError?
    
    func load() {
        photoOfTheDay = nil
        potdUseCase.invoke(for: selectedDate)
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
    
    var title: String? {
        return photoOfTheDay?.title
    }
    
    var url: URL? {
        return photoOfTheDay?.urlParsed
    }
    
    var explanation: String? {
        return photoOfTheDay?.explanation
    }
    
    var copyright: String? {
        return photoOfTheDay?.copyright
    }
    
    var isVideo: Bool {
        return url?.absoluteString.contains("youtube") ?? false
    }
}
