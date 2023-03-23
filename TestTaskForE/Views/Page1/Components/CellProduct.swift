//
//  CellProduct.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 14.03.2023.
//

import SwiftUI


struct CellProduct: View {
    let productImage: UIImage
    let category: String
    let productLable: String
    let productPrise: String
    
    var body: some View {
        ZStack {
            Image(uiImage: productImage)
                .resizable()
                .frame(width: 114, height: 149)
                .cornerRadius(15)
            
            VStack(spacing: 0) {
                Spacer()
                HStack(spacing: 0) {
                    Text(category)
                        .frame(width: 35,height: 12)
                        .background(R.Colors.CellElements.grey.opacity(0.7))
                        .cornerRadius(15)
                        .padding(.leading, 7)
                        .font(R.Fonts.montserrat(with: 6, .semiBold))
                        .foregroundColor(R.Colors.CellElements.textBlack)
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text(productLable)
                        .padding(.top, 6)
                        .padding(.leading, 7)
                        .padding(.trailing, 20)
                        .font(R.Fonts.montserrat(with: 8, .bold))
                        .foregroundColor( R.Colors.CellElements.textWhite)
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text("$ \(productPrise)")
                        .padding(.top, 17)
                        .padding([.leading, .bottom], 7)
                        .font(R.Fonts.montserrat(with: 8, .bold))
                        .foregroundColor(R.Colors.CellElements.textWhite)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(uiImage: R.Images.CellElements.plus)
                            .resizable()
                            .frame(width: 7, height: 7)
                            .frame(width: 20, height: 20)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    }
                    .padding(.top, 12)
                    .padding([.trailing, .bottom], 5)
                }
            }
        }
        .frame(width: 114, height: 149)
    }
}


struct CellProductForFlashSale: View {
    let productImage: UIImage
    let amountOfDiscount: String
    let category: String
    let productLable: String
    let productPrise: String
    
    
    var body: some View {
        ZStack {
            Image(uiImage: productImage)
                .resizable()
                .frame(width: 174, height: 221)
                .cornerRadius(15)
            VStack(spacing: 0) {
                HStack {
                    VStack(spacing: 0) {
                        Image(uiImage: R.Images.CellElements.logo)
                            .frame(width: 24, height: 24)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(R.Colors.CellElements.border, lineWidth: 1)
                            }
                            .padding([.top,.leading], 7)
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Text("\(amountOfDiscount)% off")
                            .frame(width: 49,height: 18)
                            .background(R.Colors.CellElements.red)
                            .cornerRadius(15)
                            .padding(.top, 7)
                            .padding(.trailing, 8)
                            .font(R.Fonts.montserrat(with: 10, .bold))
                            .foregroundColor(R.Colors.CellElements.textWhite)
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text(category)
                        .frame(width: 50,height: 17)
                        .background(R.Colors.CellElements.grey.opacity(0.7))
                        .cornerRadius(15)
                        .padding(.leading, 10)
                        .font(R.Fonts.montserrat(with: 10, .semiBold))
                        .foregroundColor(R.Colors.CellElements.textBlack)
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text(productLable)
                        .padding(.top, 11)
                        .padding(.leading, 10)
                        .padding(.trailing, 70)
                        .font(R.Fonts.montserrat(with: 12, .bold))
                        .foregroundColor(R.Colors.CellElements.textWhite)
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text("$ \(productPrise)")
                        .padding(.vertical, 16)
                        .padding(.leading, 10)
                        .font(R.Fonts.montserrat(with: 10, .bold))
                        .foregroundColor(R.Colors.CellElements.textWhite)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(uiImage: R.Images.CellElements.heart)
                            .resizable()
                            .frame(width: 12, height: 10)
                            .frame(width: 25, height: 25)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    }
                    
                    Button {
                        
                    } label: {
                        Image(uiImage: R.Images.CellElements.plus)
                            .resizable()
                            .frame(width: 12, height: 10)
                            .frame(width: 35, height: 35)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 4)
                }
            }
        }
        .frame(width: 174, height: 221)
    }
}

