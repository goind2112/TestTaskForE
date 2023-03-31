//
//  Page1.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 14.03.2023.
//

import SwiftUI

struct Page1: View {
    private enum Field {
        case searchField
    }
    @State var search = ""
    
    @FocusState private var focusedField: Field?
    
    @ObservedObject private var page1VM = Page1VM()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        Button {
                            
                        } label: {
                            HStack(spacing: 4) {
                                Text(R.Strings.Page1.location)
                                    .font(R.Fonts.montserrat(with: 8))
                                    .foregroundColor(R.Colors.textPlaceholder)
                                
                                Image(uiImage: R.Images.Page1.arrovDown)
                                    .frame(width: 6, height: 3)
                                    .padding(.trailing, 25)
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    
                    ZStack() {
                        TextField("", text: $search)
                            .textFieldModifire()
                            .textInputAutocapitalization(.never)
                            .placeholder(when: search.isEmpty) {
                                Text(R.Strings.Page1.searchBar).foregroundColor(R.Colors.textPlaceholder)
                                    .padding(.bottom, 3)
                                    .font(R.Fonts.montserrat(with: 13,.medium))
                                    .onTapGesture { focusedField = .searchField }
                            }
                            .focused($focusedField, equals: .searchField)
                        HStack {
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(uiImage: R.Images.Page1.magnifier)
                                    .resizable()
                                    .frame(width: 9, height: 9)
                                    .padding(.vertical, 7)
                                    .padding(.trailing, 15)
                            }
                        }
                    }
                    .padding(.horizontal, 57)
                    .padding(.bottom, 17)
                    
                    TagScrollView()
                }
                .background(R.Colors.background)
                
                ScrollView(showsIndicators: false) {
                    LazyHGridPage1(cells: page1VM.products,
                                   sectionName: R.Strings.Page1.latest,
                                   isDiscount: false)
                    
                    LazyHGridPage1(cells: page1VM.products,
                                   sectionName: R.Strings.Page1.flashSale,
                                   isDiscount: true)
                    .padding(.top, 23)
                    
                    LazyHGridPage1(cells: page1VM.products,
                                   sectionName: R.Strings.Page1.brands,
                                   isDiscount: false)
                    .padding(.top, 23)
                    .padding(.bottom, 63)
                }
                .background(R.Colors.background)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Button("Hide") {
                            focusedField = nil
                        }
                        Spacer()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("work")
                    } label: {
                        Image(uiImage: R.Images.Page1.hamburger)
                            .resizable()
                            .frame(width: 22, height: 21)
                    }
                }
                ToolbarItem() {
                    HStack(spacing: 3) {
                        Text(R.Strings.Page1.titleFirstElement)
                            .font(R.Fonts.montserrat(with: 18,.bold))
                            .lineLimit(1)
                            .frame(width: 84)
                            .padding(.leading, 65.21)
                        Text(R.Strings.Page1.titleSecondElement)
                            .font(R.Fonts.montserrat(with: 18, .bold))
                            .foregroundColor(R.Colors.buttonViolet)
                            .frame(width: 43)
                            .lineLimit(1)
                            .padding(.trailing, 56)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Image(uiImage: page1VM.profileImage)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(R.Colors.textPlaceholder, lineWidth: 1)
                        }
                        .padding(.trailing, 17)
                }
            }
        }
    }
}


struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
