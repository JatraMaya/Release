//
//  SpeechTextView.swift
//  Release
//
//  Created by mora hakim on 20/07/23.
//

import SwiftUI

struct SpeechResults: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var currentDate = Date()
    @State var title: String = ""
    @State var content: String = ""
    @State private var isKeyboardHidden: Bool = true
    @State var isEdit: Bool = false
    @State var isCancel: Bool = false
    @State var isHomeViewActive: Bool = false
    @State var isFinish: Bool = false
    @StateObject var viewModel = CoreDataViewModel()
    @State var isAlert: Bool = false
    @Binding var showTranscript: Bool
    @AppStorage("startMood") private var startMood: String = ""
    @AppStorage("endMood") private var endMood: String = ""
    @FocusState private var isTitleTextFieldFocused: Bool
    @State private var originalTitle: String = ""
    @State private var originalContent: String = ""
    @ObservedObject var speechResultsViewModel = SpeechResultsViewModel()
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: currentDate)
    }
    var body: some View {
        NavigationStack {
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
                                Spacer()
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
                            .padding(.top, 10)
                            TextField("", text: $content)
                                .frame(width: 325, height: 500)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(20)
                                .multilineTextAlignment(.leading)
                                .lineLimit(300, reservesSpace: true)
                                .autocorrectionDisabled(true)
                                .focused($isTitleTextFieldFocused)
                                .padding()
                        }
                        .padding(.horizontal)
                        .onTapGesture {
                            speechResultsViewModel.hideKeyboard()
                        }
                    }
                    .padding()
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
                            Button("Discard Changes", role: .destructive) {
                                title = originalTitle
                                content = originalContent
                            }
                        } message: {
                            Text("Are you sure you want to continue?")
                        }
                        Button {
                            guard let selectedDate =
                                    speechResultsViewModel.dateFromFormattedString(formattedDate) else {
                                print("Invalid date format")
                                return
                            }
                            viewModel.addJournal(text: content, date: selectedDate,
                                                 title: title,
                                                 mood: startMood, endMood: endMood)
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
                                        Text("You have recorded your emotions today!")
                                            .font(.custom("Poppins-Medium", size: 18))
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
                }
                .navigationBarTitle(Text("Anger Record").font(.custom("Poppins-Medium", size: 17)))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                    Button(action: {
                    isEdit.toggle()
                    if isEdit {
                        originalTitle = title
                        originalContent = content
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isTitleTextFieldFocused = true
                        }
                    } else {
                        DispatchQueue.main.async {
                            isTitleTextFieldFocused = false
                        }
                    }
                }) {
                    if isEdit {
                        Text("Done").font(.custom("Poppins-Medium", size: 17)).foregroundColor(Color.black)
                    } else {
                        Image("Edit")
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                }
                )
                .padding(.bottom, 16)
            }
            .onAppear {
                if isEdit {
                    DispatchQueue.main.async {
                        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder),
                                                        to: nil, from: nil, for: nil)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
