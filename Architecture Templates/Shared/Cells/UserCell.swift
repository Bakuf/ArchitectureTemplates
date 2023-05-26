//
//  UserCell.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 18/05/23.
//

import SwiftUI

struct UserCell: HostedView {
    
    let user: String
    let userName: String
    
    let colors: [Color] = [.red, .cyan, .mint, .orange, .blue, .gray, .indigo, .purple]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20,
                             style: .continuous)
            .fill(colors.randomElement()!.gradient)
            HStack(spacing: 20) {
                Image(systemName: "person.fill")
                    .font(.largeTitle)
                VStack(alignment: .leading, spacing: 5) {
                    Text(user)
                        .font(.title)
                    Text("@" + userName)
                        .font(.body)
                }
                Spacer()
                Image(systemName: "mail")
                    .font(.body)
                Image(systemName: "house")
                    .font(.body)
            }
            .foregroundColor(.white)
            .padding()
        }
        .padding()
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: "Rodrigo", userName: "bakuf")
    }
}
