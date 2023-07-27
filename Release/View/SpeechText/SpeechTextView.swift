//
//  SpeechTextView.swift
//  Release
//
//  Created by mora hakim on 20/07/23.
//

import SwiftUI

struct SpeechTextView: View {
    @Environment(\.dismiss) var dismiss
    //    @AppStorage("text") var kalimat = ""
    @State private var currentDate = Date()
    @State var title: String = ""
    @State var content: String = ""
    @State private var isKeyboardHidden: Bool = true
    @State var isEdit: Bool = false
    @State var isCancel: Bool = false
    
    @ObservedObject var noteViewModel = NoteViewModel()
    @StateObject var viewModel = CoreDataViewModel()
    @State var isAlert: Bool = false
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: currentDate)
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(20)
                        .frame(height: 560)
                        .padding()
                    VStack {
                        HStack {
//                            Spacer()
                            ZStack {
                                if title.isEmpty {
                                    Text("Untitle")
                                        .foregroundColor(.white)
                                        .font(.custom("Poppins-semiBold", size: 15))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    //                                          .padding(.leading)
                                }
                                TextField("", text: $title)
                                    .font(.custom("Poppins-semiBold", size: 15))
                            }
                            //                            .padding(.leading, 70)
                            Spacer()
                            Text(formattedDate)
                                .foregroundColor(Color.white)
                                .font(.custom("Poppins-semiBold", size: 15))
                        }.padding(.horizontal)
                        TextField("", text: $content)
                            .frame(width: 325, height: 500)
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(20)
                            .multilineTextAlignment(.leading)
                            .lineLimit(300, reservesSpace: true)
                            .autocorrectionDisabled(true)
                    }.padding(.vertical)
                        .padding(.horizontal)
                        .onTapGesture {
                            hideKeyboard()
                        }
                    
                }
                Spacer()
                HStack {
                    Button {
                        isCancel.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(Color("Primary"))
                            .fontWeight(.bold)
                    }
                    .padding(.trailing, 70)
                    .alert("Unsaved Changes", isPresented: $isCancel) {
                                Button("Keep Editing") { }
                        Button("Discard Changes", role: .destructive) {}
                                
                            } message: {
                                Text("Are you sure you want to continue?")
                            }
                    Button {
                        guard let selectedDate = dateFromFormattedString(formattedDate) else {
                            print("Invalid date format")
                            return
                        }
                        viewModel.addJournal(text: content, date: selectedDate, title: title)
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
                                Button {
                                    
                                } label: {
                                    Text("Finish").font(.custom("Poppins-Medium", size: 17))
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(Color.white)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                                }
                                .background(Color("Primary"))
                                .cornerRadius(20)
                                .padding()
                            }
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.hidden)
                            
                        }
                    }
                    
                }
                Spacer()
            }  .navigationBarTitle(Text("Anger Record").font(.custom("Poppins-Medium", size: 17)))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    // Kode untuk menangani aksi tombol di sini
                    isEdit.toggle()
                }) {
                    if isEdit {
                        Text("Done").font(.custom("Poppins-Medium", size: 17)).foregroundColor(Color.black)
                    }else {
                        Image("Edit")
                            .resizable()
                            .frame(width: 18, height: 18)
                        
                    }
                })
        }
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
