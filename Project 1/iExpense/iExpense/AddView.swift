//
//  AddView.swift
//  iExpense
//
//  Created by Manish Harsha Bajracharya on 19/01/2025.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var currencyType: String = "NPR"
    @State private var amount: Double = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    var expenses: Expenses
    
    let types = ["Personal", "Business", "Groceries"]
    let currencyTypes = Locale.Currency.isoCurrencies.map { $0.identifier }
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Currency", selection: $currencyType ) {
                    ForEach(currencyTypes, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: currencyType))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Add New Expense"))
            .toolbar{
                Button("Save") {
                    let item = ExpenseItems(name: name, type: type,currencyType: currencyType, amount: amount)
                    expenses.items.append(item)
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
