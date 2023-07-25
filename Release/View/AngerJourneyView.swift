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
            Spacer()
            Spacer()

                if angerJourneySelection == 0{
                    ListTypeView()
                } else if angerJourneySelection == 1 {
                    CalenderTypeView()
                } else {
                    SummaryTypeView()
                }

            Spacer()
        }
    }
}

struct AngerJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        AngerJourneyView()
    }
}
