//
//  AngerJourneyView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 21/07/23.
//

import SwiftUI

struct AngerJourneyView: View {
    @State var angerJourneySelection: Int = 0
    var body: some View {
        VStack {
            Picker(selection: $angerJourneySelection, label: Text("Selection")) {
                Text("List").tag(0)
                Text("History").tag(1)
                Text("Summary").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()

                if angerJourneySelection == 0{
                    ListTypeView().animation(.easeIn, value: angerJourneySelection)
                } else if angerJourneySelection == 1 {
                    CalenderTypeView()
                        .animation(.easeIn, value: angerJourneySelection)
                } else {
                    SummaryTypeView()
                        .animation(.easeIn, value: angerJourneySelection)
                }
            Spacer()
        }
    }
}

struct Test: View {
    var body: some View {
        Text("Tab 1")
    }
}

struct Test2: View {
    var body: some View {
        Text("Tab 2")
    }
}

struct AngerJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        AngerJourneyView()
    }
}
