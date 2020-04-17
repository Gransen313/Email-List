//
//  Emails.swift
//  Email-List
//
//  Created by Sergey Borisov on 16.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import Foundation

struct EmailListModel {
    
    struct Email {
        
        let avatarURL: String
        let sender: String
        let subTitle: String
        let body: String
        let date: Date
    }
    
    static let emails = [
        Email(avatarURL: "https://i.ibb.co/Rhty5g0/Emily-Ratajkowski.jpg", sender: "Emily Ratajkowski", subTitle: "Why don't you call me?", body: "Hey, Why u don't call me? Do u know my number??? I've left my knickers in your room, u should give it back immediately!!!!", date: Date()),
        Email(avatarURL: "https://i.ibb.co/1022X5z/Godzilla.jpg", sender: "Godzilla", subTitle: "About a job!", body: "Hello! I haven't destroyed any cities for a too long time... I feel empty and realy sad. Could you rise up my mood, plaese)))", date: Date()),
        Email(avatarURL: "https://i.ibb.co/JFXSV21/Donald-Trump.png",sender: "Donald Trump", subTitle: "Help with corona", body: "Hey, we need some help with CoVid19. Do you remember about it? We've found this IVL were fakes.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/znJ8QkK/Habib-Nurmagomedov.jpg",sender: "Habib Nurmagomedov", subTitle: "Hi, bro!", body: "What's up, man? I'm going to stay in Dagestan until the end of the epidemy. What do you think about it?", date: Date()),
        Email(avatarURL: "https://i.ibb.co/gMLS9nv/Oleg-Veretennikov.jpg",sender: "Oleg Veretennikov", subTitle: "I'm sorry", body: "Better to remain silent and be thought a fool than to speak out and remove all doubt. I really don't know what it is about.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/SPydrJ2/Rafael-Nadal.jpg",sender: "Rafael Nadal", subTitle: "Pirthday party.", body: "Light travels faster than sound. This is why some people appear bright until you hear them speak.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/nPYVNp2/Anton-Chekhov.jpg",sender: "Anton Chekhov", subTitle: "Kashtanka", body: "I'm gonna have to be taking your car today. See I have some top secret clown business that supersedes any plans that you might have for this here vehicle.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/pf8htW9/Elton-John.jpg",sender: "sr. Elton John", subTitle: "My comming out!", body: "Men marry women with the hope they will never change. Women marry men with the hope they will change. Invariably they are both disappointed.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/PxdJ8N2/Ilya-Reznik.jpg",sender: "Ilya Reznik", subTitle: "For you.", body: "It would be nice to spend billions on schools and roads, but right now that money is desperately needed for political ads.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/3CD6myb/Pamela-Anderson.jpg",sender: "Pamela Anderson", subTitle: "About those fotos", body: "At every party there are two kinds of people – those who want to go home and those who don’t. The trouble is, they are usually married to each other.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/prTMd6R/Jacky-Chan.jpg",sender: "Jacky Chan", subTitle: "Where is my watch?", body: "Doctors are just the same as lawyers; the only difference is that lawyers merely rob you, whereas doctors rob you and kill you too.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/1n5R79T/Frodo-Baggings.jpg",sender: "Frodo Baggings", subTitle: "The ring", body: "To be sure of hitting the target, shoot first, and call whatever you hit the target.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/Fw2KyKZ/Michail-Bulgakov.jpg",sender: "Michail Bulgakov", subTitle: "Master and Margaret", body: "Be who you are and say what you feel, because those who mind don’t matter and those who matter don’t mind.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/YtZZXgR/Lorens-Fishborn.jpg",sender: "Lorens Fishborn", subTitle: "Who I am?", body: "The world is full of magical things patiently waiting for our wits to grow sharper.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/fk4m188/Kurt-Cobain.jpg",sender: "Kurt Cobain", subTitle: "All apologize", body: "Facebook just sounds like a drag, in my day seeing pictures of peoples vacations was considered a punishment.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/QNWqXyy/Denzel-Vashington.jpg",sender: "Denzel Vashington", subTitle: "Give me back all", body: "If there is anything the nonconformist hates worse than a conformist, it’s another nonconformist who doesn’t conform to the prevailing standard of nonconformity.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/SmvjRL4/Kerry-Hirouky-Tagava.jpg",sender: "Kerry Hirouky Tagava", subTitle: "Shan Tsung", body: "Money won’t buy happiness, but it will pay the salaries of a large research staff to study the problem.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/WvFGqpg/Aleksey-Oleynyk.jpg",sender: "Aleksey Oleynyk", subTitle: "I was able)", body: "The surest sign that intelligent life exists elsewhere in the universe is that it has never tried to contact us.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/H7ZCQD9/Usama-Abdul-Azis.jpg",sender: "Usama Abdul Azis", subTitle: "Tomorrow evening", body: "Before you judge a man, walk a mile in his shoes. After that who cares?… He’s a mile away and you’ve got his shoes!", date: Date()),
        Email(avatarURL: "https://i.ibb.co/bbhSvV8/Pussy-Riot.jpg",sender: "Pussy Riot", subTitle: "We are ready", body: "Going to church doesn’t make you a Christian any more than going to a garage makes you an automobile.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/ck0hkjM/Homer-Simpson.jpg",sender: "Homer Simpson", subTitle: "WHAT???", body: "Inside me there’s a thin person struggling to get out, but I can usually sedate him with four or five cupcakes.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/yhQNnvp/Sherlock-Holmes.jpg",sender: "Sherlock Holmes", subTitle: "See you soon", body: "But the fact that some geniuses were laughed at does not imply that all who are laughed at are geniuses. They laughed at Columbus, they laughed at Fulton, they laughed at the Wright Brothers. But they also laughed at Bozo the Clown.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/t2RKC46/Eldorado.jpg",sender: "Eldorado", subTitle: "Final SALE!!!", body: "My favorite machine at the gym is the vending machine.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/PM4zhMm/AlfaBank.png",sender: "Alfa Bank", subTitle: "Credit Card", body: "A bank is a place that will lend you money if you can prove that you don’t need it.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/L1QXvSc/Horse-Face.jpg",sender: "Horse Face", subTitle: "I'm Ksenya", body: "Don’t worry about the world coming to an end today. It is already tomorrow in Australia.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/6v7drxq/RudeElf.jpg",sender: "Rude Elf", subTitle: "We've killed Santa", body: "By the time a man realizes that his father was right, he has a son who thinks he’s wrong.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/XtDvmdS/Jason-Woorhees.jpg",sender: "Jason Woorhees", subTitle: "I've lost my head.", body: "When I was a boy I was told that anybody could become President. I’m beginning to believe it.", date: Date()),
        Email(avatarURL: "https://i.ibb.co/Wc0bxmG/Vasyly-Basta.jpg",sender: "Vasyly Basta", subTitle: "Fatness", body: "A stockbroker urged me to buy a stock that would triple its value every year. I told him, ‘At my age, I don’t even buy green bananas.'", date: Date()),
        Email(avatarURL: "https://i.ibb.co/42MMX9c/Jorge-Mosvidal.png",sender: "Jorge Mosvidal", subTitle: "Will you come on FightNight?", body: "tarbucks says they are going to start putting religious quotes on cups. The very first one will say, ‘Jesus! This cup is expensive!'", date: Date()),
        Email(avatarURL: "https://i.ibb.co/gFtm8Gd/LostSoul.jpg",sender: "Lost Soul", subTitle: "300 equally", body: "A study in the Washington Post says that women have better verbal skills than men. I just want to say to the authors of that study: ‘Duh.'", date: Date()),
        Email(avatarURL: "https://i.ibb.co/pyshbvf/Captain-Spaulding.jpg",sender: "Captain Spolding", subTitle: "Tutty-mtf-frutty", body: "Why? Don't we make ya laugh? Aren't we fuckin' funny? You best come up with an answer, cos I'm gonna come back here and check on you and your momma and if you ain't got a reason why you hate clowns, I'm gonna kill your whole fucking family.", date: Date())
    ]
}
