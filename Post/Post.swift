//
//  Post.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import Foundation
import UIKit

struct Post {
    let author: String
    let description: String
    let image: UIImage
    var likes: Int
    var views: Int

    static func makeMockModelPost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "maybe_elf", description: "Компания Ричарда Брэнсона Virgin Galactic снова перенесла запуск коммерческих туристических полетов из-за проблем с поставками комплектующих и дефицита сотрудников. Теперь первый полёт состоится не ранее 2023 года.", image: UIImage(named: "Новость1")!, likes: 12, views: 689))
        post.append(Post(author: "maybe_elf", description: "Hyundai построит новый исследовательский центр в Университете штата Монтана в Бозмане, который займётся созданием автомобилей максимальной проходимости. Ранее компания уже показала несколько концептов шагающих автомобилей.", image: UIImage(named: "Новость2")!, likes: 230, views: 1234))
        post.append(Post(author: "IgnatChuker", description: "Финансовый регулятор обвинил NVIDIA в искажении финансовых отчетов за 2018 год", image: UIImage(named: "Новость3")!, likes: 165, views: 567))
        post.append(Post(author: "denis-19", description: "Американский суд отклонил иск Трампа к Twitter", image: UIImage(named: "Новость4")!, likes: 345, views: 1600))
        post.append(Post(author: "denis-19", description: "WSJ: китайские компании Lenovo и Xiaomi решили по-тихому уйти с рынка РФ из-за санкций США", image: UIImage(named: "Новость5")!, likes: 456, views: 2200))
        return post
    }
}
