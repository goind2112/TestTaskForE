//
//  TagScrollView.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 31.03.2023.
//

import SwiftUI

struct TagScrollView: View {
    var body: some View {
        ScrollView(.horizontal ,showsIndicators: false) {
            HStack(spacing: 20.8) {
                HStack(spacing: 21) {
                    ForEach(0..<R.Images.Page1.arrayTagImageLeft.count, id: \.self) {index in
                        Button {
                            print(index)
                        } label: {
                            VStack(spacing: 0) {
                                Image(uiImage: R.Images.Page1.arrayTagImageLeft[index])
                                    .resizable()
                                    .frame(width: 42, height: 38)
                                Text(R.Strings.Page1.arrayTagTextLeft[index])
                                    .padding(.top, 14.8)
                                    .font(R.Fonts.montserrat(with: 7))
                                    .foregroundColor(R.Colors.textPlaceholder)
                            }
                        }
                        
                    }
                }
                HStack(spacing: 17.2) {
                    HStack(spacing: 16.7) {
                        ForEach(0..<R.Images.Page1.arrayTagImageCenter.count, id: \.self) {index in
                            Button {
                                print(index)
                            } label: {
                                VStack(spacing: 0) {
                                    Image(uiImage: R.Images.Page1.arrayTagImageCenter[index])
                                        .resizable()
                                        .frame(width: 42, height: 38)
                                    Text(R.Strings.Page1.arrayTagTextRight[index])
                                        .padding(.top, 14.3)
                                        .font(R.Fonts.montserrat(with: 7))
                                        .foregroundColor(R.Colors.textPlaceholder)
                                }
                            }
                        }
                    }
                    HStack(spacing: 17) {
                        ForEach(0..<R.Images.Page1.arrayTagImageRight.count, id: \.self) {index in
                            Button {
                                print(index)
                            } label: {
                                VStack(spacing: 0) {
                                    Image(uiImage: R.Images.Page1.arrayTagImageRight[index])
                                        .resizable()
                                        .frame(width: 42, height: 38)
                                    Text(R.Strings.Page1.arrayTagTextRight[index])
                                        .padding(.top, 13.8)
                                        .font(R.Fonts.montserrat(with: 7))
                                        .foregroundColor(R.Colors.textPlaceholder)
                                }
                            }
                            
                        }
                    }
                }
                
            }
            .padding(.leading, 15)
            .padding(.trailing, 14.4)
            .padding(.bottom, 36.5)
        }
    }
}

struct TagScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TagScrollView()
    }
}
