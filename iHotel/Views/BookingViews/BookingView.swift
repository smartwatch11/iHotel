//
//  BookingView.swift
//  iHotel
//
//  Created by Egor Rybin on 21.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    @StateObject var viewModel = BookingViewModel()
    @State var isChecked = false
    @State var isEmailValid = true
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(.systemBackground))
                        .frame(height: 150)
                        .overlay(alignment: .top) {
                            VStack {
                                HStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color(red: 255/255, green: 199/255, blue: 0))
                                        .opacity(0.2)
                                        .frame(width: 149, height: 29)
                                        .overlay {
                                            HStack(spacing: 2) {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(Color(red: 1, green: 168/255, blue: 0))
                                                Text("\(viewModel.bookingModel?.horating ?? 0) \(viewModel.bookingModel?.rating_name ?? "")")
                                                    .font(.custom("SFProDisplay-Medium", size: 16))
                                                    .foregroundColor(Color(red: 1, green: 168/255, blue: 0))
                                            }
                                        }
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                .padding(.top)
                                
                                HStack {
                                    Text("\(viewModel.bookingModel?.hotel_name ?? "")")
                                        .font(.custom("SFProDisplay-Medium", size: 22))
                                        .padding(.leading, 20)
                                        .padding(.bottom, 5)
                                    Spacer()
                                }
                                
                                Button {
                                    print("disabled btn")
                                } label: {
                                    Text("\(viewModel.bookingModel?.hotel_adress ?? "")")
                                        .font(.custom("SFProDisplay-Medium", size: 14))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .padding(.top, 5)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(.systemBackground))
                        .frame(height: 280)
                        .overlay {
                            VStack(spacing: 10) {
                                BookingMainDataView(title: "Вылет из", data: viewModel.bookingModel?.departure ?? "")
                                BookingMainDataView(title: "Страна, город", data: viewModel.bookingModel?.arrival_country ?? "")
                                BookingMainDataView(title: "Даты", data: "\(viewModel.bookingModel?.tour_date_start ?? "") - \(viewModel.bookingModel?.tour_date_stop ?? "")")
                                BookingMainDataView(title: "Кол-во ночей", data: "\(viewModel.bookingModel?.number_of_nights ?? 0) ночей")
                                BookingMainDataView(title: "Отель", data: viewModel.bookingModel?.hotel_name ?? "")
                                BookingMainDataView(title: "Номер", data: viewModel.bookingModel?.room ?? "")
                                BookingMainDataView(title: "Питание", data: viewModel.bookingModel?.nutrition ?? "")
                            }
                        }
                    
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(.systemBackground))
                        .frame(height: 252)
                        .overlay {
                            VStack(alignment: .leading) {
                                Text("Информация о покупателе")
                                    .font(.custom("SFProDisplay-Medium", size: 22))
                                    .padding(.leading)
                                
                                PhoneView(phone: viewModel.phone)
                                EmailView(email: $viewModel.email, isEmailValid: $isEmailValid)
                                
                                Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту.")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                            }
                            .padding(.horizontal)
                        }
                    
                    ForEach(0..<viewModel.users.count , id:\.self){
                        index in
                        let label = "\(spellOutOrdinalNumber(num: index+1)) турист"
                        UserGroupFieldsView(content: {
                            UserTextFieldView(text: "Имя", modelTextField: $viewModel.users[index].userName, isWrong: $isChecked)
                            UserTextFieldView(text: "Фамилия", modelTextField: $viewModel.users[index].userSurname, isWrong: $isChecked)
                            UserDateFieldView(date: "Дата рождения", modelDateField: $viewModel.users[index].dateOfBirth, isWrong: $isChecked)
                            UserTextFieldView(text: "Гражданство", modelTextField: $viewModel.users[index].citizenship, isWrong: $isChecked)
                            UserTextFieldView(text: "Номер загранпаспорта", modelTextField: $viewModel.users[index].passportID, isWrong: $isChecked)
                            UserDateFieldView(date: "Срок действия загранпаспорта", modelDateField: $viewModel.users[index].validityPeriod, isWrong: $isChecked)
                        }, ordinalUserLabel: label)
                    }
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(.systemBackground))
                        .frame(height: 58)
                        .overlay {
                            HStack {
                                Text("Добавить туриста")
                                    .font(.custom("SFProDisplay-Medium", size: 22))
                                Spacer()
                                Button {
                                    viewModel.users.append(User())
                                } label: {
                                    Image(systemName: "plus.square.fill")
                                        .font(.system(size: 32))
                                }
                            }
                            .padding(.horizontal)
                        }
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(.systemBackground))
                        .frame(height: 156)
                        .overlay {
                            VStack(alignment: .leading, spacing: 10) {
                                TotalPriceView(title: "Тур", value: viewModel.bookingModel?.tour_price ?? 0)
                                TotalPriceView(title: "Топливный сбор", value: viewModel.bookingModel?.fuel_charge ?? 0)
                                TotalPriceView(title: "Сервисный сбор", value: viewModel.bookingModel?.service_charge ?? 0)
                                TotalPriceView(title: "К оплате", value: viewModel.totalPrice ?? 0)
                            }
                        }
                    
                    
                    
                    VStack {
                        Divider()
                        Button {
                            if viewModel.isWrongData() && viewModel.email.isEmpty {
                                viewModel.showAlert = true
                                isChecked = true
                                isEmailValid = !viewModel.emailIsEmpty()
                            } else if viewModel.email.isEmpty {
                                print(viewModel.email)
                                viewModel.showAlert = true
                                isEmailValid = !viewModel.emailIsEmpty()
                            } else if viewModel.isWrongData() {
                                viewModel.showAlert = true
                                isChecked = true
                                isEmailValid = true
                            } else {
                                coordinator.push(.success_order)
                            }
                        } label: {
                            Text("Оплатить \(viewModel.totalPrice ?? 0) ₽")
                                .foregroundColor(.white)
                                .font(.custom("SFProDisplay-Medium", size: 16))
                        }
                        .frame(height: 48)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 13/255, green: 114/255, blue: 255/255))
                        .cornerRadius(15)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    .background(Color(red: 1, green: 1, blue: 1))
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Данные заполнены неверно"),
                        message: Text("Убедитесь, что верно указана почта и все поля с информацией о туристах заполнены"),
                        dismissButton: .default(Text("ОК"))
                    )
                }
                .background(Color(red: 244/255, green: 244/255, blue: 247/255))
                .edgesIgnoringSafeArea(.top)
                
            }
            .navigationTitle("Бронирование")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {coordinator.pop()}, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }))
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    private func spellOutOrdinalNumber(num: Int) -> String{
        // Можно лучше
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = Locale(identifier: "ru-RU")
        guard let spelledOutNumber = formatter.string(from: num as NSNumber) else { return "" }
        
        var resultString = ""
        
        switch num % 10 {
        case 1: 
            if num / 10 == 1 {
                resultString = "Одинадцатый"
            } else {
                resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "первый" : " первый")
            }
        case 2: if num / 10 == 1 {
            resultString = "Двенадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "второй" : " второй")
        }
        case 3: if num / 10 == 1 {
            resultString = "Тринадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "третий" : " третий")
        }
        case 4: if num / 10 == 1 {
            resultString = "Четырнадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "четвертый" : " четвертый")
        }
        case 5: if num / 10 == 1 {
            resultString = "Пятнадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "пятый" : " пятый")
        }
        case 6: if num / 10 == 1 {
            resultString = "Шестнадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "шестой" : " шестой")
        }
        case 7: if num / 10 == 1 {
            resultString = "Семнадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "седьмой" : " седьмой")
        }
        case 8: if num / 10 == 1 {
            resultString = "Восемнадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "восьмой" : " восьмой")
        }
        case 9: if num / 10 == 1 {
            resultString = "Девятнадцатый"
        } else {
            resultString = spelledOutNumber.components(separatedBy: " ").dropLast().joined(separator: " ") + (num / 10 == 0 ? "девятый" : " девятый")
        }
        default:
            switch num / 10 {
            case 1: resultString = "Десятый"
            case 2: resultString = "Двацатый"
            case 3: resultString = "Тридцатый"
            case 4: resultString = "Сороковой"
            case 5: resultString = "Пятидесятый"
            case 6: resultString = "Шестидесятый"
            case 7: resultString = "Семидесятый"
            case 8: resultString = "Восьмидесятый"
            case 9: resultString = "Девяностый"
            case 10: resultString = "Сотый"
            default: 
                resultString = spelledOutNumber
            }
        }
        
        let firstLetter = resultString.prefix(1).capitalized
        let remainingLetters = resultString.dropFirst().lowercased()
        
        return firstLetter + remainingLetters
    }
}

#Preview {
    BookingView()
}
