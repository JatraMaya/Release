//
//  SelectedAvatarView.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 22/07/23.
//

import SwiftUI

struct SelectedAvatarView: View {
    var avatar: String = ""
    var isSelected: Bool = false
    var body: some View {

        ZStack{
            if isSelected{
                Circle().frame(width: 65, height: 65)
            }
            Image(avatar).resizable().frame(width: 60, height: 60)
        }
    }
}
