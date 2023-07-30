//
//  SpeechTextView.swift
//  Release
//
//  Created by mora hakim on 20/07/23.
//

import SwiftUI

struct SpeechTextView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
//    @AppStorage("text") var kalimat = ""
    @State private var currentDate = Date()
    @State var title: String = ""
    @State var content: String = ""
    @State private var isKeyboardHidden: Bool = true
    @State var isEdit: Bool = false
    @State var isCancel: Bool = false
    @State var isHomeViewActive: Bool = false
    @State var isFinish: Bool = false
    
    @ObservedObject var noteViewModel = NoteViewModel()
    @StateObject var viewModel = CoreDataViewModel()
    @State var isAlert: Bool = false
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: currentDate)
    }
    
    @Binding var showTranscript: Bool
    @AppStorage("startMood") private var startMood: String = ""
    @AppStorage("endMood") private var endMood: String = ""
    @FocusState private var isTitleTextFieldFocused: Bool
    @State private var originalTitle: String = ""
    @State private var originalContent: String = ""
   

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("Primary"))
                            .cornerRadius(20)
                            .frame(height: 575)
                            .padding()
                        VStack {
                            HStack(spacing: 40) {
                                Spacer() // Tambahkan spacer di sini
                                ZStack {
                                    if title.isEmpty {
                                        Text("Untitle")
                                            .foregroundColor(.white)
                                            .font(.custom("Poppins-semiBold", size: 15))
                                    }
                                    TextField("", text: $title)
                                        .font(.custom("Poppins-semiBold", size: 15))
                                        .foregroundColor(Color.white)
                                        .textFieldStyle(CenteredTextFieldStyle())
                                        .autocorrectionDisabled(true)
                                }
                                Text(formattedDate)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Poppins-semiBold", size: 15))
                            }
                            .padding(.horizontal)
                            .padding(.top, 20) // Mengatur padding atas
                            
                           
                            ZStack(alignment: .topLeading) {
                                TextField("", text: $content)
                                    .font(.custom("Poppins-semiBold", size: 15))
                                    .foregroundColor(Color.black)
                                    .background(Color.white)
                                    .textFieldStyle(LeadingTextFieldStyle())
                                    .cornerRadius(20)
                                    .padding()
                                    .autocorrectionDisabled(true)
                                    .lineLimit(300, reservesSpace: true)
                            }
                                

                                
                        }

                            .padding(.horizontal)
                            .onTapGesture {
                                hideKeyboard()
                            }
                        
                    }
                    .padding()
                    Spacer()
                    HStack {
                        Button {
//                            title = originalTitle
                            isCancel.toggle()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(Color("Primary"))
                                .fontWeight(.bold)
                        }
                        .padding(.trailing, 70)
                        .alert("Unsaved Changes", isPresented: $isCancel) {
                                    Button("Keep Editing") { }
                            Button("Discard Changes", role: .destructive) {
                                title = originalTitle
                                content = originalContent
                            }
                                    
                                } message: {
                                    Text("Are you sure you want to continue?")
                                }
                        Button {
                            guard let selectedDate = dateFromFormattedString(formattedDate) else {
                                print("Invalid date format")
                                return
                            }
                            viewModel.addJournal(text: content, date: selectedDate, title: title, mood: startMood, endMood: endMood)
                            isAlert.toggle()
                            
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color("Primary"))
                                    .cornerRadius(20)
                                    .frame(width: 138, height: 50)
                                
                                Text("Save")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                        }
                        .sheet(isPresented: $isAlert) {
                            if #available(iOS 16.0, *) {
                                VStack(spacing: 10) {
                                    Image("Confetti")
                                        .resizable()
                                        .frame(width: 320, height: 220)
                                        .scaledToFit()
                                    VStack(spacing: 10) {
                                        Text("Yeay!🥳").font(.custom("Poppins-Medium", size: 24))
                                            .padding(.bottom)
                                        Text("You have recorded your emotions today!").font(.custom("Poppins-Medium", size: 18))
                                    }
                                    
                                    Spacer()
                                  
                                                     Button(action: {
                                                         isHomeViewActive.toggle()
                                                       
                                                     }, label: {
                                                         Text("Finish")
                                                             .font(.custom("Poppins-Medium", size: 17))
                                                             .foregroundColor(Color.white)
                                                             .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                                                     })
                                                     .background(Color("Primary"))
                                                     .cornerRadius(20)
                                                     .padding()
                                         
                                }
                                .onAppear {
                                       if isAlert {
                                           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                               isHomeViewActive = true
                                               
                                           }
                                       }
                                   }
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.hidden)
                                
                            }
                        }.onDisappear {
                            isAlert = false
                        }
                        .background(
                            NavigationLink(
                                destination: DashboardView(),
                                isActive: $isHomeViewActive,
                                label: { EmptyView() }
                            )
                        )
                        
                    }
                    Spacer()
                }  .navigationBarTitle(Text("Anger Record").font(.custom("Poppins-Medium", size: 17)))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: Button(action: {
                        // Kode untuk menangani aksi tombol di sini
                        isEdit.toggle()
                        if isEdit {
                               // Request focus on the title TextField
                            originalTitle = title
                            originalContent = content
                               DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                   isTitleTextFieldFocused = true
                               }
                           } else {
                               // Resign focus from the title TextField
                               DispatchQueue.main.async {
                                   isTitleTextFieldFocused = false
                               }
                           }
                    }) {
                        if isEdit {
                            Text("Done").font(.custom("Poppins-Medium", size: 17)).foregroundColor(Color.black)
                        }else {
                            Image("Edit")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                        }
                    })
                    .padding(.bottom, 16)
                   
                
            }
            
            .onAppear {
                     // If isEdit is already true when the view appears,
                     // show the keyboard directly.
                     if isEdit {
                         DispatchQueue.main.async {
                             UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                         }
                     }
                
                 }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func dateFromFormattedString(_ formattedString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.date(from: formattedString)
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct CenteredTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.center) // Mengatur pengetikan menjadi pusat
            .frame(width: 100, height: 10) // Mengatur lebar dan tinggi TextField sesuai kebutuhan Anda
            // Memberikan border pada TextField
            .padding(.horizontal) // Memberikan padding horizontal untuk tampilan yang lebih baik
    }
}

struct LeadingTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.leading) // Mengatur pengetikan menjadi pusat
            .frame(width: 325, height: 480) // Mengatur lebar dan tinggi TextField sesuai kebutuhan Anda
            // Memberikan border pada TextField
            .padding(.horizontal) // Memberikan padding horizontal untuk tampilan yang lebih baik
            
    }
}


struct MultilineTextField: UIViewRepresentable {
    @Binding var content: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = content
    }
}
//
//TextField("", text: $content)
//    .frame(width: 325, height: 500)
//    .foregroundColor(Color.black)
//    .background(Color.white)
//    .cornerRadius(20)
//    .multilineTextAlignment(.leading)
//    .lineLimit(300, reservesSpace: true)
//    .autocorrectionDisabled(true)
//    .focused($isTitleTextFieldFocused)


