//
//  FeedServiceMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import Foundation

final class FeedServiceMock: FeedServiceable {
    var astroPods = [AstroPod]()
    
    var fetchAstroPodInvoked = false
    func fetchAstroPod(startDate: String, endDate: String) async -> Result<[AstroPod], any Error> {
        fetchAstroPodInvoked = false
        
        if startDate == "valid" && endDate == "valid" {
            return .success(astroPods)
        }
        
        let error = NSError(domain: "something went wrong", code: 404)
        return .failure(error)
    }
    
    func generateData(count: Int) {
        let data = [
            AstroPod(date: "2024-05-07", explanation: "Apakah cinta masih sama jika kau tahu ujungnya Satu perkenalan dua pendekatan apa kau bosan Bencana-bencana di luar rencana Janji-janji fana membuat merana hm Cerita kita takkan seperti di layar-layar kaca Gemas romantis tak masuk logika Cerita kita kan berjalan perlahan dan sederhana hm Saling mengerti hanya lewat bicara hm Cerita kita takkan seperti di layar-layar kaca Gemas romantis tak masuk logika hm Cerita kita kan berjalan perlahan dan sederhana hm Saling mengerti hanya lewat bicara hm Lepas dan hangat Bercinta lewat kata", mediaType: "image", serviceVersion: "v1", title: "Bercinta Lewat Kata (From Jatuh Cinta Seperti di Film-Film)", url: "https://lh3.googleusercontent.com/GAXIOpbXvYXYcyRudmXmEwifN_hFAnh8W4DERf5w-9BbTic3Lzhc5eMRdvb7xUUvKP_Fs0GuqLK4T6V_=w544-h544-l90-rj"),
            AstroPod(date: "2024-05-08", explanation: "There is bitter in everyday But then I feel it That you would be the only one Sometimes it doesn't have to be so sure The sweetest love can be so hard to find We'll be better in every way But then I would go to be in other space Sometimes, the bitter of love can be so good It's like a coffee with a rainbow's mood Sometimes you feel off but sometimes you feel it right Is it to be, or it is not to be To fall in love again, to be the one for me Sometimes you fall, but there'll be time we'll be together", mediaType: "image", serviceVersion: "v1", title: "bitterlove Ardhito Pramono", url: "https://lh3.googleusercontent.com/K7HGO9eAKxFsPL3_zcljZjPzfshI3i_-S4tcD3T4pA3-E8IaNOLTeZ73q85t-ZIByaw-o5p7Tyc_J1Rq=w544-h544-l90-rj"),
            AstroPod(date: "2024-05-09", explanation: "Sudah tertulis begitu indah Sepanjang rekah cerita kau taklukkan Rindu yang meradang di khayalanku Dan biar selalu tentang bahagia Adalah ketika di palung hatimu Terukir ribuan alasan untuk Mencintai diriku Dan mengarungi dirinya Ternyata tak begitu indah Mencintai diriku Dan mengarungi dirinya Ternyata tak begitu indah Dan aku akan enggan bersumpah", mediaType: "image", serviceVersion: "v1", title: "Ruang Kecil Bilal Indrajaya", url: "https://lh3.googleusercontent.com/ZT8KL6EjO-ktnYWGYDkUVAdefc6rJFxBXsRxdVHWyvUxyfaEkJaRLyLjXMy_vB4yotnMTXyQgu461pA=w544-h544-l90-rj"),
            AstroPod(date: "2024-05-10", explanation: "A great big bang and dinosaurs Fiery raining meteors It all ends unfortunately But you're gonna live forever in me I guarantee, just wait and see Parts of me were made by you And planets keep their distance too The moon's got a grip on the sea And you're gonna live forever in me I guarantee, it's your destiny", mediaType: "image", serviceVersion: "v1", title: "You're Gonna Live Forever in Me", url: "https://lh3.googleusercontent.com/CGl3Yq5YEWEcRkXdLLrXlVaM4h0vlXOrei3yzXXuuG8gF8Og4Hp0GbkiXAhBRiH9Z2QlEa3eJxmaqcFY=w544-h544-l90-rj"),
            AstroPod(date: "2024-05-11", explanation: "Berdiam di dalam rumah ini denganmu Dari malam hingga malam lagi Terkungkung langkah ragu tak ke mana-mana Dari Rabu hingga Rabu lagi Semakin banyak waktu tuk bicara Semakin kupaham harapmu apa Semakin banyak waktu tuk bersama Bersyukurku kau utuh jiwa raga Bila ini belum kan reda Tetap kita saling menjaga uh Hari depan tak ada yang tau Hadirmu sangat berharga kuingin engkau tau Aku sayang kamu Em", mediaType: "image", serviceVersion: "v1", title: "Adaptasi Tulus", url: "https://lh3.googleusercontent.com/vNgubMQUiW7RRLYNMVHuLpeC1Z2LahUFsdqpnJ6A-wFnIqBmN5WzKqxf_-RDhvgr_DOsho9iYXbbETCNxg=w544-h544-l90-rj"),
            AstroPod(date: "2024-05-12", explanation: "Selusin purnama berganti, berikan cahaya Menanti gulita, kapan kau berlalu? Lama tak kulihat senyummu Semusim angin malam halangi terang tidurku Seribu baju pengantin malam kini Menari di gantung lemari Dan kini ternyata ujung cerita bak kurnia dewata Hatiku berseri, senyum mentari datang kembali Pilu yang dulu hilang (kini berganti merdu) Badai telah berlalu", mediaType: "image", serviceVersion: "v1", title: "Badai Telah Berlalu", url: "https://lh3.googleusercontent.com/zDuGlg8G1tR5b-GY5lPYzQ3QxB50R7tTQBgK_ivqx5IkGlOOci6E7eFRgHqfF-rFfj2zkJ0WJayaPc5y=w544-h544-l90-rj"),
            AstroPod(date: "2024-05-13", explanation: "Kamu bilang aku tak sama Tak seperti saat pertama Aku bilang mungkin pikiranmu saja Kamu bilang 'ku tak peduli Tak seperti pertama kali Aku bilang janganlah ragu sendiri Mengapa? Mengapa oh mengapa? Banyak keraguan dalam hatimu, oh kasih Dengarkanlah Hanya kamulah satu-satunya Di antara Yang pernah singgah di relung jiwa Dan takkan pernah lagi ada Manusia lainnya Sudah cukup satu Hanya kamulah satu-satunya", mediaType: "image", serviceVersion: "v1", title: "Satu-Satunya HIVI!", url: "https://lh3.googleusercontent.com/5YnOqZXxVbhg78sgwulxJQnDjinTAk87QME4MUEf90AqQV-11AKykZ4iLZgXY9Li2YRlQAbE3dDissOTOg=w544-h544-l90-rj")
        ]
        
        astroPods = Array(data.prefix(through: count - 1))
    }
}


