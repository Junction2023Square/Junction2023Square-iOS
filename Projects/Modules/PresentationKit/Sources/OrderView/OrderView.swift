import SwiftUI
import ComposableArchitecture
import CoreKit

public struct OrderView: View {
    public let store: StoreOf<OrderFeature>

    public init(store: StoreOf<OrderFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        VStack(spacing: 15) {
                            HStack {
                                Image.pizza
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(width: geometry.size.width, height: 230)
                            
                            Spacer()
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Pizza shop")
                                        .font(
                                            Font.custom("Pretendard", size: 32)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.gray)
                                            
                                            Text("4.8 (35 ratings)")
                                        }
                                        
                                        HStack {
                                            Image(systemName: "clock.fill")
                                                .foregroundColor(.gray)
                                            
                                            Text("10-20 min, 530m")
                                        }
                                    }
                                }
                                Spacer()
                            }
                            .padding(.leading, 24)
                            
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Text("Menu")
                                        .font(
                                            Font.custom("Pretendard", size: 26)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                                    Spacer()
                                }
                                .padding(.leading, 24)
                                
                                ForEach(viewStore.counts.indices, id: \.self) { index in
                                    menuView(viewStore: viewStore, index: index)
                                }
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.top)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Order 7,600￦")
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: 350, maxHeight: 55)
                    }
                    .background(Color(red: 0.95, green: 0.34, blue: 0.45))
                    .cornerRadius(10)
                }
            }
        }
    }

    @ViewBuilder
    private func menuView(viewStore: ViewStoreOf<OrderFeature>, index: Int) -> some View {
        HStack {
            HStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.83, green: 0.85, blue: 0.88))
                    .cornerRadius(10)
                    .frame(width: 50, height: 50)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Chicken Sandwich")
                        .font(
                            Font.custom("Pretendard", size: 15)
                            .weight(.semibold)
                        )
                    Text("7,600￦")
                        .font(
                        Font.custom("Pretendard", size: 13)
                        .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.63))
                }
            }
            .padding(.leading, 24)

            Spacer()

            HStack(alignment: .center, spacing: 12) {
                HStack(alignment: .top, spacing: 4) {
                    Text("-")
                        .frame(width: 20)
                }
                .padding(4)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.68, green: 0.72, blue: 0.78), lineWidth: 1)
                )
                .onTapGesture {
                    viewStore.send(.decrementButtonTapped(index: index))
                }

                Text("\(viewStore.counts[index])")

                HStack(alignment: .top, spacing: 4) {
                    Text("+")
                        .frame(width: 20)
                }
                .padding(4)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.68, green: 0.72, blue: 0.78), lineWidth: 1)
                )
                .onTapGesture {
                    viewStore.send(.incrementButtonTapped(index: index))
                }
            }
            .padding(.trailing, 20)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(store: .init(initialState: OrderFeature.State(), reducer: {
            OrderFeature()
        }))
    }
}
