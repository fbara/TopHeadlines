//
//  CountryListView.swift
//  CountryListView
//
//  Created by Frank Bara on 8/23/21.
//

import SwiftUI

struct CountryListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var country: Country
    
    var body: some View {
        List(Country.countries) { country in
            HStack {
                Text("\(country.flag) \(country.name)")
                Spacer()
            }.contentShape(Rectangle())
                .onTapGesture {
                    self.country = country
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

