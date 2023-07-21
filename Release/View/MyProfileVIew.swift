//
//  MyProfileVIew.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 20/07/23.
//

import SwiftUI

struct MyProfileVIew: View {
    let avatarLists: [Avatar] = [Avatar(id: 0, name: "a"),
                                 Avatar(id: 1, name: "b"),
                                 Avatar(id: 2, name: "c"),
                                 Avatar(id: 3, name: "d"),
                                 Avatar(id: 4, name: "e"),
                                 Avatar(id: 5, name: "f")]
    @AppStorage("avatarIndex") var avatarIndex: Int = 0
    @AppStorage("username") var username: String = ""
    @AppStorage("isOnboarding") var isOnboarding: Bool = false

    var body: some View {
        VStack{
            Text("My Profile").font(.custom("Poppins-SemiBold", size: 17)).padding(.top, 15)
            Spacer()
            Image(avatarLists[avatarIndex].name).resizable().frame(width: 200, height: 200)
            Text("Choose Avatar:").frame(width: 300, alignment: .leading).font(.custom("Poppins-SemiBold", size: 17))
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(avatarLists, id: \.id){ avatar in

                        Button{
                            avatarIndex = avatar.id
//                            avatar.isSelectedToggle()
                        }label: {
                            ZStack{
                                if avatar.isSelected{
                                    Circle().fill(Color("Primary")).frame(width: 75, height: 75)
                                }
                                Image(avatar.name).resizable().frame(width: 70, height: 70)
                            }
                        }
                    }
                }
            }.frame(width: 330)
                Text("Write your name:").frame(width: 300, alignment: .leading).font(.custom("Poppins-SemiBold", size: 17)).fontWeight(.semibold)
            TextField("", text: $username).border(Color("Primary"), width: 2).frame(width: 322, height: 48)
            Button{
                isOnboarding = true
            }label: {
                Text("Save").font(.custom("Poppins-Medium", size: 17))
                    .frame(width:105, height: 48)
                    .foregroundColor(.white).background(Color("Primary"))
                    .cornerRadius(radius: 20, corners: .allCorners).shadow(radius:3, x: 0, y: 5)
            }
            Spacer()
        }
    }
}

struct MyProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileVIew()
    }
}
