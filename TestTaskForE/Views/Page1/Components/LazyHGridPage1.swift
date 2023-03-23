//
//  Secto.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

struct LazyHGridPage1: View {
    
    let cells: [Product]
    let sectionName: String
    let isDiscount: Bool
    
    init(cells: [Product], sectionName: String, isDiscount: Bool) {
        self.cells = cells
        self.sectionName = sectionName
        self.isDiscount = isDiscount
    }
    
    private var gridItemLayout = [GridItem(.flexible())]
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Text(sectionName)
                    .font(R.Fonts.montserrat(with: 13, .semiBold))
                    .foregroundColor(R.Colors.textBlack)
                    .padding(.leading, 11)
                Spacer()
                Button {
                    print("work")
                } label: {
                    Text("View all")
                        .font(R.Fonts.montserrat(with: 10))
                        .foregroundColor(R.Colors.textPlaceholder)
                        .padding(.trailing, 12)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: gridItemLayout, spacing: 9) {
                    ForEach(cells, id: \.self) { product in
                        
                        if let discount = product.discount {
                            if isDiscount {
                                CellProductForFlashSale(productImage: product.image,
                                                        amountOfDiscount: discount,
                                                        category: product.category,
                                                        productLable: product.name,
                                                        productPrise: product.price)
                                .onTapGesture {
                                    print(product.id)
                                }
                            }
                            
                        } else {
                            if !isDiscount {
                                CellProduct(productImage: product.image,
                                            category: product.category,
                                            productLable: product.name,
                                            productPrise: product.price)
                                .onTapGesture {
                                    print(product.id)
                                }
                            }
                        }
                    }
                }
                .padding(.leading, 11)
                .padding(.top, 9)
            }
        }
    }
}

