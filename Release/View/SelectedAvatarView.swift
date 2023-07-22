//
//  SelectedAvatarView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 22/07/23.
//

import SwiftUI

struct AvatarList: Codable, Hashable {
    var avatarArray: [String] = ["a", "b", "c", "d", "e", "f"]
}

struct SelectedAvatarView: View {
    var avatarLis = AvatarList()
    @State var isSelected: Bool = false
    var body: some View {
        ZStack{
            if isSelected{
                Circle()
            }

        }
    }
}

struct SelectedAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedAvatarView()
    }
}
