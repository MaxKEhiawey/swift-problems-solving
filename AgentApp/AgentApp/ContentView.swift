//
//  ContentView.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 03/07/2023.
//

import SwiftUI
import Combine
import CryptoKit

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    var body: some View {

        ScrollView(.vertical, showsIndicators: false){

          ForEach(vm.receivedData, id: \.self) { facility in
              SingleFacility(vm: vm, facility: facility)
                  .padding(.vertical, 16)
          }
        }
        .padding()
    }
}

struct SingleOption: View {

    let option: Option
    @State var isSelectecd: Bool = false

    var body: some View {
        VStack {

                Image(option.icon)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(6)
            }

            Text(option.name )
    }
}


struct SingleFacility: View {

    @StateObject var vm = ViewModel()
    let facility: Facility
    @State var isSelectecd: Bool = false
    var body: some View {
       // ScrollView(.vertical, showsIndicators: false){
            VStack {
                Text(facility.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            }
            .padding()

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 16) {

                    ForEach(facility.options, id: \.self) { option in

                        HStack {
                            if vm.selectedOptions[facility.facility_id]?.id == option.id  {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                            } else {
                                Image(systemName: "circle")
                            }

                            SingleOption(option: option)
                        }.onTapGesture {
                            vm.handleSelection(facilityID: facility.facility_id, option: option)
                            let offD = vm.isOptionExcluded(facilityID: facility.facility_id, optionID: option.id)
                            print(offD, "BOOL")
                        }
                        .disabled(vm.isOptionExcluded(facilityID: facility.facility_id, optionID: option.id))
                    }
                }
            }
        }


    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    // MARK: -
struct AgentModel: Codable {
    let facilities: [Facility]
    let exclusions: [[Exclusion]]
}

    // MARK: - Exclusion
struct Exclusion: Codable {
    let facility_id, options_id: String
}

    // MARK: - Facility
struct Facility: Codable, Hashable {
    var facility_id, name: String
    let options: [Option]
}

    // MARK: - Option
struct Option: Codable, Hashable {
    var name, icon, id: String
}


class Network {

    func fetchData () -> AnyPublisher<AgentModel, Error> {

        guard let requestURL = URL(string: "https://my-json-server.typicode.com/iranjith4/ad-assignment/db") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let request = URLSession.shared.dataTaskPublisher(for: requestURL)

        return request
            .map({$0.data})
            .receive(on: DispatchQueue.main)
            .decode(type: AgentModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        }

}

class ViewModel: ObservableObject {

    @Published var receivedData: [Facility] = []
    @Published var exclusions: [[Exclusion]] = []
    @Published var selectedOptions: [String: Option] = [:]

    let network = Network()
    var disposableBag = Set<AnyCancellable>()

    init() {
        fetchData()
    }

    func fetchData() {
        network.fetchData()
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Done!")
                    case .failure(let error):
                        print(error)
                }
            } receiveValue: {[ weak self] response in
                self?.receivedData = response.facilities
                self?.exclusions = response.exclusions
            }.store(in: &disposableBag)
    }

    func handleSelection(facilityID: String, option: Option) {
        if let currentSelection = selectedOptions[facilityID] {
            if currentSelection.id == option.id {
                selectedOptions[facilityID] = nil
            } else {
                selectedOptions[facilityID] = option
            }
            print("selected", selectedOptions)
        } else {
            selectedOptions[facilityID] = option
            print("selected", selectedOptions)
        }
    }
    func isOptionExcluded(facilityID: String, optionID: String) -> Bool {
      //  exclusionCombinations.contains(where: { $0 == (facilityID, optionID) })
        var isDisabled = false

        for pairedExclusions in exclusions {

            if selectedOptions.contains(where: { ($0.key, $0.value.id) == (pairedExclusions[0].facility_id, pairedExclusions[0].options_id ) }) {

                isDisabled = (pairedExclusions[1].facility_id, pairedExclusions[1].options_id) == (facilityID, optionID)

            } else if selectedOptions.contains(where: { ($0.key, $0.value.id) == (pairedExclusions[1].facility_id, pairedExclusions[1].options_id) }) {

                isDisabled = (pairedExclusions[0].facility_id, pairedExclusions[0].options_id) == (facilityID, optionID)
            }
        }
        return isDisabled
    }

}

class DataManager {
        // Function to encrypt data using AES encryption
    func encryptData(data: Data, key: SymmetricKey) throws -> Data {
        let sealedBox = try AES.GCM.seal(data, using: key)
        let ciphertext = sealedBox.combined!
        return ciphertext
    }

        // Function to decrypt data using AES decryption
    func decryptData(ciphertext: Data, key: SymmetricKey) throws -> Data {
        let sealedBox = try AES.GCM.SealedBox(combined: ciphertext)
        let decryptedData = try AES.GCM.open(sealedBox, using: key)
        return decryptedData
    }
    func manageData() {
            // Example usage
        do {
                // Generate a random encryption key
            let encryptionKey = SymmetricKey(size: .bits256)

                // Data to be encrypted
            let originalData = "Hello, world!".data(using: .utf8)!

                // Encrypt the data
            let encryptedData = try encryptData(data: originalData, key: encryptionKey)
            print("Encrypted Data: \(encryptedData)")

                // Decrypt the data
            let decryptedData = try decryptData(ciphertext: encryptedData, key: encryptionKey)
            let decryptedString = String(data: decryptedData, encoding: .utf8)
            print("Decrypted Data: \(decryptedString ?? "")")
        } catch {
            print("Error: \(error)")
        }
    }
}
