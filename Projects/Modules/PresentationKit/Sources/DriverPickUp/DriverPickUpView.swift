import ComposableArchitecture
import SwiftUI

public struct DriverPickUpView: View {
    private struct Constants {
        static let Margin: CGFloat = 20
        static let Corner: CGFloat = 12
        
        enum Colors {
            static let placeholder: Color? = Color(red: 0.68, green: 0.72, blue: 0.78)
            static let content: Color? = Color(uiColor: .black)
        }
    }
    
    public let store: StoreOf<DriverPickUpFeature>

    public init(store: StoreOf<DriverPickUpFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                      // Space Between
                        VStack(alignment: .leading, spacing: 8) {
                            // Head2
                            Text("Pick-up Details")
                              .font(
                                PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 26)
                              )
                              .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                            // Body2
                            Text("Set a pick-up schedule")
                              .font(
                                PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                              )
                              .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                        }
                        .padding(.horizontal, Constants.Margin)
                        .padding(.vertical, 0)
                        .frame(width: 375, alignment: .topLeading)
                        .padding(.bottom, 60)
                      
                        VStack(alignment: .leading, spacing: 32) {
                            VStack(alignment: .leading, spacing: 8) {
                                // Body2
                                Text("Pick-up Date")
                                  .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                  )
                                  .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                
                                HStack(alignment: .center, spacing: 0) {
                                    DatePicker(
                                        "",
                                        selection: viewStore.binding(
                                            get: \.pickUpDate,
                                            send: { .didChangePickUpDate($0) }
                                        ),
                                        in: Date()...,
                                        displayedComponents: [.date, .hourAndMinute]
                                    )
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                                }
                                .padding(.leading, 20)
                                .padding(.vertical, 0)
                                .frame(maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .leading)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.95, green: 0.96, blue: 0.96), lineWidth: 1)
                                )
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.vertical, 0)
                            .frame(width: 375, alignment: .topLeading)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                // Body2
                                Text("Pick-up Location")
                                  .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                  )
                                  .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                
                                TextField("Select Location", text: viewStore.binding(
                                    get: \.pickUpLocationText,
                                    send: { .didChangePickUpLocationText($0) }
                                ))
                                .font(PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 17))
                                .foregroundColor(viewStore.$pickUpLocationText.wrappedValue.isEmpty ? Constants.Colors.placeholder : Constants.Colors.content)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 0)
                                .frame(maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .leading)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.95, green: 0.96, blue: 0.96), lineWidth: 1)
                                )
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.vertical, 0)
                            .frame(width: 375, alignment: .topLeading)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Arrival Date")
                                  .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                  )
                                  .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                
                                HStack(alignment: .center, spacing: 0) {
                                    DatePicker(
                                        "",
                                        selection: viewStore.binding(
                                            get: \.arriveDate,
                                            send: { .didChangeArriveDate($0) }
                                        ),
                                        in: Date()...,
                                        displayedComponents: [.date, .hourAndMinute]
                                    )
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 0)
                                .frame(maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .leading)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.95, green: 0.96, blue: 0.96), lineWidth: 1)
                                )
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.vertical, 0)
                            .frame(width: 375, alignment: .topLeading)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                // Body2
                                Text("Arrival Location")
                                    .font(
                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                    )
                                    .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                
                                TextField("Select Location", text: viewStore.binding(
                                    get: \.arriveLocationText,
                                    send: { .didChangeArriveLocationText($0) }
                                ))
                                .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 17)
                                )
                                .foregroundColor(viewStore.$arriveLocationText.wrappedValue.isEmpty ? Constants.Colors.placeholder : Constants.Colors.content)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 0)
                                .frame(maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .leading)
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.95, green: 0.96, blue: 0.96), lineWidth: 1)
                                )
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.vertical, 0)
                            .frame(width: 375, alignment: .topLeading)
                            .ignoresSafeArea(.keyboard, edges: .bottom)
                        }
                        .padding(0)
                    }
                    .padding(.horizontal, 0)
                    .padding(.vertical, 24)
                }
                .scrollDismissesKeyboard(.immediately)
                
                VStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Confirm")
                                .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 16)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                        .background(Color(red: 0.34, green: 0.62, blue: 0.95))
                        .cornerRadius(Constants.Corner)
                    }
                    .padding(.top, 12)
                    .padding([.leading, .trailing], 20)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color.white)
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
    }
}

struct PickUpDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverPickUpView(store: .init(initialState: DriverPickUpFeature.State(), reducer: {
            DriverPickUpFeature()
        }))
    }
}
