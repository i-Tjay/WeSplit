import SwiftUI
struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0, 30, 45, 50]
    
    var totalPerPerson:Double{
        let peoplecount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerperson = grandTotal / peoplecount
        
        return amountPerperson
    }
    
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format:
                                .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(1..<100) {
                        Text("*\($0) people")
                    }
                }
                Section {
                    Text("How much tip do you want to leave?")
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code:
                                                            Locale.current.currencyCode ?? "USD"))
               }
            }
            .navigationTitle("We Split")
          }
        }
    }
}
