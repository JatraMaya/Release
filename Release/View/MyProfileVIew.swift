//
//  MyProfileVIew.swift
//  Release!
//
//  Created by Ahmad Fadly Iksan on 20/07/23.
//

import SwiftUI

struct MyProfileVIew: View {
    let avatarLists: [Avatar] = [Avatar(id: 1, name: "a"),
                                Avatar(id: 2, name: "b"),
                                Avatar(id: 3, name: "c"),
                                Avatar(id: 4, name: "d"),
                                Avatar(id: 5, name: "e"),
                                Avatar(id: 6, name: "f")]
    
    @AppStorage("avatar") var avatarImage: String = "a"
    @AppStorage("username") var username: String = ""

    var body: some View {
        VStack{
            Text("My Profile").font(.custom("Poppins-SemiBold", size: 17)).padding(.top, 15)
            Spacer()
            Image(avatarImage).resizable().frame(width: 200, height: 200)
            Text("Choose Avatar:").frame(width: 300, alignment: .leading).font(.custom("Poppins-SemiBold", size: 17))
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(avatarLists, id: \.id){ avatar in
                        Button{
                            avatarImage = avatar.name
                        }label: {
                            SelectedAvatarView(avatar: avatar.name, isSelected: avatar.name == avatarImage ? true : false )
                        }
                    }
                                    }
                }.frame(width: 330)
                Text("Write your name:").frame(width: 300, alignment: .leading).font(.custom("Poppins-SemiBold", size: 17)).fontWeight(.semibold)
                TextField("", text: $username)
                    .font(.custom("Poppins-Medium", size: 16))
                    .textFieldStyle(TextFieldCustomStyle())
                    .frame(width: 320, height: 48)
            NavigationLink(destination: DashboardView() ,label: {
                    Text("Save").font(.custom("Poppins-Medium", size: 17))
                        .frame(width:320, height: 48)
                        .foregroundColor(.white).background(Color("Primary"))
                        .cornerRadius(radius: 20, corners: .allCorners).shadow(radius:3, x: 0, y: 5)
                }).disabled(username.isEmpty)
                .opacity(!username.isEmpty ? 1 : 0.6)
                Spacer()
            }
    }
}

struct MyProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileVIew()
    }
}
