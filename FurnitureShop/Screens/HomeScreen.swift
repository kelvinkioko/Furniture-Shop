//
//  HomeScreen.swift
//  FurnitureShop
//
//  Created by Kelvin Kioko on 24/10/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count, id: \.self) { index in
                                    CategoryView(isActive: index == selectedIndex, text: categories[index])
                                        .onTapGesture {
                                            selectedIndex = index
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 20) {
                                ForEach (0 ..< 4) { index in
                                    NavigationLink(
                                        destination: DetailsScreen(),
                                        label: {
                                            ProductCardView(
                                                image: Image("chair_\(index + 1)"),
                                                size: 210
                                            )
                                        }
                                    )
                                    .toolbar(.hidden)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 20) {
                                ForEach (0 ..< 4) { index in
                                    ProductCardView(
                                        image: Image("chair_\(index + 1)"),
                                        size: 210
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                HStack {
                    BottomNavBarItem(image: Image("Home"), action: {})
                    BottomNavBarItem(image: Image("fav"), action: {})
                    BottomNavBarItem(image: Image("shop"), action: {})
                    BottomNavBarItem(image: Image("User"), action: {})
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: UIImage(named: "Profile")!)
                    .resizable()
                    .frame(width: 42, height: 42, alignment: .center)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                
                TextField("Search furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan_2")
                    .padding(.all, 12)
                    .foregroundColor(Color.white)
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black)
            
            if (isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian chair")
                .foregroundColor(Color.black)
                .font(.title3)
                .fontWeight(.bold)
                .opacity(0.8)
            
            HStack (spacing: 2) {
                ForEach (0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                
                Text("$1299")
                    .foregroundColor(Color.green)
                    .font(.title3)
                    .fontWeight(.bold)
                    .opacity(0.8)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(28.0)
    }
}

struct BottomNavBarItem: View {
    
    let image: Image
    let action: ()-> Void
    
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
