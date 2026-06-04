import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';

class AppDictionary {
  static const Map<String, Map<String, String>> _dict = {
    'home': {
      'id': 'Beranda',
      'en': 'Home',
    },
    'history': {
      'id': 'Sejarah',
      'en': 'History',
    },
    'visitor_info': {
      'id': 'Info Kunjungan',
      'en': 'Visitor Info',
    },
    'explore': {
      'id': 'Eksplorasi',
      'en': 'Explore',
    },
    'facilities': {
      'id': 'Fasilitas',
      'en': 'Facilities',
    },
    'gallery': {
      'id': 'Galeri',
      'en': 'Gallery',
    },
    'contact': {
      'id': 'Kontak',
      'en': 'Contact',
    },
    'map': {
      'id': 'Peta Interaktif',
      'en': 'Interactive Map',
    },
    'quiz': {
      'id': 'Kuis Sejarah',
      'en': 'History Quiz',
    },
    'book_ticket': {
      'id': 'PESAN TIKET',
      'en': 'BOOK TICKET',
    },
    // Home Screen
    'hero_title': {
      'id': 'FORT ROTTERDAM',
      'en': 'FORT ROTTERDAM',
    },
    'hero_subtitle': {
      'id': 'Saksi Bisu Sejarah Kota Daeng',
      'en': 'Silent Witness to the History of Daeng City',
    },
    'hero_desc': {
      'id': 'Jelajahi keagungan benteng peninggalan Kerajaan Gowa-Tallo yang menjadi saksi bisu perkembangan kota Makassar dari masa ke masa.',
      'en': 'Explore the majesty of the fortress inherited from the Gowa-Tallo Kingdom, a silent witness to the development of Makassar city through the ages.',
    },
    'start_explore': {
      'id': 'MULAI EKSPLORASI',
      'en': 'START EXPLORING',
    },
    'learn_history': {
      'id': 'PELAJARI SEJARAH',
      'en': 'LEARN HISTORY',
    },
    'open_daily': {
      'id': 'Buka Setiap Hari',
      'en': 'Open Daily',
    },
    'open_hours': {
      'id': '08:00 - 18:00 WITA',
      'en': '08:00 - 18:00 WITA',
    },
    'ticket_price': {
      'id': 'Tiket Masuk',
      'en': 'Entrance Ticket',
    },
    'ticket_value': {
      'id': 'Mulai Rp 5.000',
      'en': 'From Rp 5.000',
    },
    'location': {
      'id': 'Lokasi',
      'en': 'Location',
    },
    'location_value': {
      'id': 'Pusat Kota Makassar',
      'en': 'Makassar City Center',
    },
    'tour_guide': {
      'id': 'Pemandu Wisata',
      'en': 'Tour Guide',
    },
    'tour_guide_value': {
      'id': 'Tersedia di lokasi',
      'en': 'Available on site',
    },
    'about_title': {
      'id': 'Kilas Balik Sejarah',
      'en': 'Historical Flashback',
    },
    'about_desc': {
      'id': 'Dibangun pada tahun 1545 oleh Raja Gowa ke-9, benteng yang awalnya bernama Benteng Ujung Pandang ini memiliki bentuk unik menyerupai penyu yang sedang merangkak turun ke lautan. Bentuk ini melambangkan filosofi Kerajaan Gowa yang berjaya di darat maupun di laut.',
      'en': 'Built in 1545 by the 9th King of Gowa, this fort, originally named Benteng Ujung Pandang, has a unique shape resembling a sea turtle crawling down to the ocean. This shape symbolizes the philosophy of the Gowa Kingdom, which triumphed on both land and sea.',
    },
    'read_more': {
      'id': 'BACA SELENGKAPNYA',
      'en': 'READ MORE',
    },
    'spots_title': {
      'id': 'Titik Eksplorasi Utama',
      'en': 'Main Exploration Spots',
    },
    'spots_desc': {
      'id': 'Temukan bangunan-bangunan bersejarah yang ada di dalam kompleks Fort Rotterdam.',
      'en': 'Discover the historical buildings inside the Fort Rotterdam complex.',
    },
    'quiz_title': {
      'id': 'Uji Pengetahuanmu',
      'en': 'Test Your Knowledge',
    },
    'quiz_desc': {
      'id': 'Sudah mempelajari sejarah Fort Rotterdam? Ayo buktikan seberapa jauh kamu mengenalnya lewat kuis interaktif yang seru dan menantang.',
      'en': 'Have you studied the history of Fort Rotterdam? Let\'s prove how well you know it through a fun and challenging interactive quiz.',
    },
    'start_quiz': {
      'id': 'MULAI KUIS',
      'en': 'START QUIZ',
    },
    'map_title': {
      'id': 'LOKASI KAMI',
      'en': 'OUR LOCATION',
    },
    'map_subtitle': {
      'id': 'Temukan Fort Rotterdam',
      'en': 'Discover Fort Rotterdam',
    },
    'open_maps': {
      'id': 'BUKA DI GOOGLE MAPS',
      'en': 'OPEN IN GOOGLE MAPS',
    },
    'visitor_info_title': {
      'id': 'Informasi Pengunjung',
      'en': 'Visitor Information',
    },
    'visitor_info_desc': {
      'id': 'Rencanakan kunjungan Anda ke Fort Rotterdam dengan informasi lengkap mengenai jam buka, harga tiket, dan panduan akses.',
      'en': 'Plan your visit to Fort Rotterdam with complete information regarding opening hours, ticket prices, and access guides.',
    },
    'footer_copyright': {
      'id': '© 2026 RotterdamXplore. Hak Cipta Dilindungi.',
      'en': '© 2026 RotterdamXplore. All Rights Reserved.',
    },
    'hl_open': { 'id': 'JAM BUKA', 'en': 'OPEN HOURS' },
    'hl_open_val': { 'id': '08:00 – 18:00', 'en': '08:00 – 18:00' },
    'hl_ticket': { 'id': 'TIKET', 'en': 'TICKET' },
    'hl_ticket_val': { 'id': 'Mulai Rp 5.000', 'en': 'From Rp 5.000' },
    'hl_buildings': { 'id': 'BANGUNAN', 'en': 'BUILDINGS' },
    'hl_buildings_val': { 'id': '16 Gedung', 'en': '16 Buildings' },
    'hl_est': { 'id': 'BERDIRI SEJAK', 'en': 'ESTABLISHED' },
    'hl_est_val': { 'id': '± Tahun 1545', 'en': '± Year 1545' },
    'about_subtitle': { 'id': 'TENTANG FORT ROTTERDAM', 'en': 'ABOUT FORT ROTTERDAM' },
    'about_title2': { 'id': 'Benteng yang Menyimpan Seribu Cerita', 'en': 'A Fortress that Holds a Thousand Stories' },
    'vis_info_header': { 'id': 'INFORMASI KUNJUNGAN', 'en': 'VISITOR INFORMATION' },
    'vis_plan_visit': { 'id': 'Rencanakan\nKunjungan Anda', 'en': 'Plan\nYour Visit' },
    'vis_op_hours_title': { 'id': 'Jam Operasional', 'en': 'Operating Hours' },
    'vis_weekday': { 'id': 'Senin – Jumat', 'en': 'Monday – Friday' },
    'vis_weekend': { 'id': 'Sabtu – Minggu & Libur', 'en': 'Saturday – Sunday & Holidays' },
    'vis_note': { 'id': 'Catatan', 'en': 'Note' },
    'vis_note_desc': { 'id': 'Pengunjung terakhir masuk 30 menit sebelum tutup', 'en': 'Last entry is 30 minutes before closing time' },
    'vis_ticket_title': { 'id': 'Harga Tiket Masuk', 'en': 'Entrance Ticket Price' },
    'vis_ticket_child': { 'id': 'Anak-anak (< 12 thn)', 'en': 'Children (< 12 yrs)' },
    'vis_ticket_student': { 'id': 'Pelajar / Mahasiswa', 'en': 'Students' },
    'vis_ticket_adult': { 'id': 'Dewasa Umum', 'en': 'General Adults' },
    'vis_ticket_foreigner': { 'id': 'Wisatawan Mancanegara', 'en': 'Foreign Tourists' },
    'vis_ticket_group': { 'id': 'Rombongan (min. 20)', 'en': 'Groups (min. 20)' },
    'vis_ticket_discount': { 'id': 'Diskon 20%', 'en': '20% Discount' },
    'vis_access_title': { 'id': 'Akses & Transportasi', 'en': 'Access & Transportation' },
    'vis_address_label': { 'id': 'Alamat Lengkap', 'en': 'Full Address' },
    'vis_address_val': { 'id': 'Jl. Ujung Pandang No.1, Bulo Gading, Kec. Ujung Pandang, Makassar', 'en': 'Jl. Ujung Pandang No.1, Bulo Gading, Kec. Ujung Pandang, Makassar' },
    'vis_transit_label': { 'id': 'Angkutan Umum', 'en': 'Public Transit' },
    'vis_transit_val': { 'id': 'Pete-pete jurusan Pantai Losari, turun di depan benteng', 'en': 'Local public transport (Pete-pete) heading to Losari Beach, get off in front of the fort' },
    'vis_ride_label': { 'id': 'Ojek Online', 'en': 'Ride Hailing' },
    'vis_ride_val': { 'id': 'Cari "Fort Rotterdam" atau "Benteng Ujung Pandang"', 'en': 'Search for "Fort Rotterdam" or "Benteng Ujung Pandang"' },
    'vis_rules_title': { 'id': 'Aturan & Larangan', 'en': 'Rules & Regulations' },
    'vis_rule_food': { 'id': 'Dilarang membawa makanan dan minuman ke dalam area museum', 'en': 'No outside food and drinks allowed in the museum area' },
    'vis_rule_touch': { 'id': 'Dilarang menyentuh artefak dan koleksi museum', 'en': 'Do not touch museum artifacts and collections' },
    'vis_rule_litter': { 'id': 'Dilarang membuang sampah sembarangan', 'en': 'Littering is strictly prohibited' },
    'vis_rule_pets': { 'id': 'Dilarang membawa hewan peliharaan', 'en': 'No pets allowed' },
    // Facilities Screen
    'fac_title': { 'id': 'FASILITAS UMUM', 'en': 'PUBLIC FACILITIES' },
    'fac_subtitle': { 'id': 'Kenyamanan Pengunjung Benteng', 'en': 'Comfort of Fortress Visitors' },
    'fac_parking_title': { 'id': 'Area Parkir', 'en': 'Parking Area' },
    'fac_parking_desc': { 'id': 'Tersedia area parkir luas untuk motor, mobil, dan bus pariwisata.', 'en': 'Spacious parking area available for motorcycles, cars, and tour buses.' },
    'fac_prayer_title': { 'id': 'Mushola', 'en': 'Prayer Room' },
    'fac_prayer_desc': { 'id': 'Fasilitas ibadah yang bersih dan nyaman di dalam area benteng.', 'en': 'Clean and comfortable worship facilities inside the fortress area.' },
    'fac_toilet_title': { 'id': 'Toilet Umum', 'en': 'Public Toilet' },
    'fac_toilet_desc': { 'id': 'Terdapat di beberapa titik strategis yang mudah dijangkau.', 'en': 'Located at several strategic points that are easily accessible.' },
    'fac_wheelchair_title': { 'id': 'Akses Kursi Roda', 'en': 'Wheelchair Access' },
    'fac_wheelchair_desc': { 'id': 'Beberapa area utama ramah disabilitas, namun belum semua gedung.', 'en': 'Some main areas are wheelchair friendly, but not all buildings yet.' },
    'fac_status_available': { 'id': 'TERSEDIA', 'en': 'AVAILABLE' },
    'fac_status_limited': { 'id': 'TERBATAS', 'en': 'LIMITED' },
    // History Screen
    'hist_title': { 'id': 'SEJARAH BENTENG', 'en': 'FORTRESS HISTORY' },
    'hist_subtitle': { 'id': 'Dari Kerajaan Gowa hingga Warisan Dunia', 'en': 'From the Kingdom of Gowa to World Heritage' },
    'hist_era1_year': { 'id': '± 1545 M', 'en': '± 1545 AD' },
    'hist_era1_title': { 'id': 'Pendirian oleh Kerajaan Gowa', 'en': 'Founded by the Gowa Kingdom' },
    'hist_era1_desc': {
      'id': 'Benteng ini pertama kali dibangun oleh Raja Gowa ke-9, Daeng Matanre Karaeng Tumapa\'risi\' Kallonna. Benteng ini awalnya bernama Benteng Ujung Pandang, dibangun dengan konstruksi tanah liat sederhana untuk melindungi wilayah bandar niaga Kerajaan Gowa dari serangan musuh.',
      'en': 'This fortress was first built by the 9th King of Gowa, Daeng Matanre Karaeng Tumapa\'risi\' Kallonna. Originally named Ujung Pandang Fort, it was constructed from simple clay to protect the Gowa Kingdom\'s trade port area from enemy attacks.'
    },
    'hist_era2_year': { 'id': '1634 M', 'en': '1634 AD' },
    'hist_era2_title': { 'id': 'Dibangun Ulang dengan Batu', 'en': 'Rebuilt with Stones' },
    'hist_era2_desc': {
      'id': 'Raja Gowa ke-14, Sultan Alauddin, memprakarsai perombakan benteng. Dinding tanah liat diganti dengan struktur batu padas hitam yang didatangkan dari daerah Maros dan direkatkan dengan putih telur. Benteng ini menjadi salah satu pertahanan terkuat Gowa.',
      'en': 'The 14th King of Gowa, Sultan Alauddin, initiated the fort\'s redevelopment. Clay walls were replaced with black slate stone structures brought from the Maros region and bonded with egg white. The fortress became one of Gowa\'s strongest defenses.'
    },
    'hist_era3_year': { 'id': '1667 M', 'en': '1667 AD' },
    'hist_era3_title': { 'id': 'Jatuh ke Tangan VOC', 'en': 'Fell into the Hands of VOC' },
    'hist_era3_desc': {
      'id': 'Setelah perang sengit Makassar, Gowa kalah akibat aliansi VOC dan Arung Palakka. Sultan Hasanuddin dipaksa menandatangani Perjanjian Bongaya. Benteng diserahkan ke Belanda, lalu namanya diganti menjadi Fort Rotterdam oleh Cornelis Speelman untuk mengenang tempat kelahirannya.',
      'en': 'After the fierce Makassar War, Gowa fell due to the alliance of VOC and Arung Palakka. Sultan Hasanuddin was forced to sign the Treaty of Bongaya. The fort was handed over to the Dutch, and renamed Fort Rotterdam by Cornelis Speelman to honor his birthplace.'
    },
    'hist_era4_year': { 'id': '1830 – 1855 M', 'en': '1830 – 1855 AD' },
    'hist_era4_title': { 'id': 'Masa Pengasingan Pangeran Diponegoro', 'en': 'Exile of Prince Diponegoro' },
    'hist_era4_desc': {
      'id': 'Pasca ditangkap secara licik oleh Belanda di akhir Perang Jawa, pemimpin perjuangan Pangeran Diponegoro diasingkan di sini. Beliau ditahan di ruang tahanan sempit hingga akhir hayatnya pada 8 Januari 1855. Makam beliau terletak tidak jauh dari benteng.',
      'en': 'After being deceitfully captured by the Dutch at the end of the Java War, the rebellion leader Prince Diponegoro was exiled here. He was kept in a narrow prison room until his death on January 8, 1855. His tomb is located not far from the fort.'
    },
    'hist_era5_year': { 'id': '1970 – Kini', 'en': '1970 – Present' },
    'hist_era5_title': { 'id': 'Pemugaran & Cagar Budaya', 'en': 'Restoration & Cultural Heritage' },
    'hist_era5_desc': {
      'id': 'Benteng ini diserahkan kembali kepada pemerintah Indonesia dan dikelola sebagai cagar budaya nasional yang dilindungi undang-undang. Kompleks ini direvitalisasi menjadi pusat pelestarian sejarah, rumah bagi Museum La Galigo, serta ruang kreatif budaya di Makassar.',
      'en': 'The fortress was handed back to the Indonesian government and managed as a national cultural heritage protected by law. The complex was revitalized into a historical preservation center, home to the La Galigo Museum, and a cultural creative space in Makassar.'
    },
    'hist_fact_age': { 'id': 'Tahun Usia Benteng', 'en': 'Years of Fort Age' },
    'hist_fact_area': { 'id': 'Luas Kompleks', 'en': 'Complex Area' },
    'hist_fact_buildings': { 'id': 'Gedung Bersejarah', 'en': 'Historical Buildings' },
    // Contact Screen
    'con_title': { 'id': 'PEMESANAN TIKET', 'en': 'TICKET BOOKING' },
    'con_subtitle': { 'id': 'Mari Terhubung Bersama Kami', 'en': 'Let\'s Connect with Us' },
    'con_header': { 'id': 'Hubungi Kami', 'en': 'Contact Us' },
    'con_desc': { 'id': 'Silakan hubungi pengelola untuk keperluan pemesanan tiket rombongan, penelitian, atau izin acara.', 'en': 'Please contact the management for group ticket bookings, research purposes, or event permits.' },
    'con_addr': { 'id': 'ALAMAT', 'en': 'ADDRESS' },
    'con_tel': { 'id': 'TELEPON', 'en': 'TELEPHONE' },
    'con_email': { 'id': 'EMAIL', 'en': 'EMAIL' },
    'con_form_title': { 'id': 'Formulir Pemesanan Tiket', 'en': 'Ticket Booking Form' },
    'con_form_name': { 'id': 'NAMA LENGKAP', 'en': 'FULL NAME' },
    'con_form_institution': { 'id': 'INSTITUSI / SEKOLAH', 'en': 'INSTITUTION / SCHOOL' },
    'con_form_participants': { 'id': 'JUMLAH PESERTA', 'en': 'NUMBER OF PARTICIPANTS' },
    'con_form_date': { 'id': 'TANGGAL KUNJUNGAN', 'en': 'VISITATION DATE' },
    'con_form_submit': { 'id': 'KIRIM PERMINTAAN', 'en': 'SUBMIT REQUEST' },
    // Main Menu Drawer
    'menu_title': { 'id': 'Menu Utama', 'en': 'Main Menu' },
    'menu_subtitle': { 'id': 'Jelajahi setiap sudut benteng bersejarah Makassar.', 'en': 'Explore every corner of Makassar\'s historical fortress.' },
    // Visitor Info Section Widget
    'vis_transit_bus_label': { 'id': 'Bus Trans Makassar (Teman Bus)', 'en': 'Trans Makassar Bus (Teman Bus)' },
    'vis_transit_bus_val': { 'id': 'Koridor 2, turun di Halte Fort Rotterdam atau sekitarnya', 'en': 'Corridor 2, get off at Fort Rotterdam Bus Stop or nearby' },
    'vis_transit_pete_label': { 'id': 'Angkutan Kota (Pete-pete)', 'en': 'City Transit (Pete-pete)' },
    'vis_transit_pete_val': { 'id': 'Jurusan Pantai Losari, turun tepat di depan pintu gerbang benteng', 'en': 'Losari Beach route, get off right in front of the fort gate' },
    'vis_transit_online_label': { 'id': 'Ojek / Taksi Online', 'en': 'Ride Hailing (Ojek/Taksi Online)' },
    'vis_transit_online_val': { 'id': 'Ketik tujuan "Fort Rotterdam" atau "Benteng Ujung Pandang"', 'en': 'Type destination "Fort Rotterdam" or "Benteng Ujung Pandang"' },
    'vis_facility_toilet_label': { 'id': 'Toilet Umum', 'en': 'Public Toilet' },
    'vis_facility_toilet_val': { 'id': 'Tersedia di beberapa titik, bersih dan terawat', 'en': 'Available at several locations, clean and well-maintained' },
    'vis_facility_mosque_label': { 'id': 'Musholla', 'en': 'Prayer Room (Musholla)' },
    'vis_facility_mosque_val': { 'id': 'Tersedia di area taman dalam untuk beribadah', 'en': 'Available in the inner garden area for worship' },
    'vis_facility_parking_label': { 'id': 'Area Parkir', 'en': 'Parking Area' },
    'vis_facility_parking_val': { 'id': 'Tersedia parkir luas untuk mobil, motor, maupun bus pariwisata', 'en': 'Spacious parking available for cars, motorcycles, and tour buses' },
    'vis_facility_souvenir_label': { 'id': 'Toko Souvenir', 'en': 'Souvenir Shop' },
    'vis_facility_souvenir_val': { 'id': 'Terdapat di dekat pintu keluar, menjual kerajinan khas Makassar', 'en': 'Located near the exit, selling traditional Makassar souvenirs' },
    // Attraction Details
    'att_detail_title': { 'id': 'Detail Titik Eksplorasi', 'en': 'Exploration Spot Detail' },
    'att_close_btn': { 'id': 'TUTUP', 'en': 'CLOSE' },
    'att_01_detail': {
      'id': 'Museum terbesar di Sulawesi Selatan yang didirikan pada tahun 1970 (cikal bakal Celebes Museum tahun 1938). Menyimpan lebih dari 40.000 koleksi benda bersejarah, etnografi, numismatik, keramik asing, senjata tradisional, dan naskah kuno Bugis-Makassar.',
      'en': 'The largest museum in South Sulawesi, established in 1970 (originating from Celebes Museum in 1938). It houses over 40,000 collections of historical, ethnographic, numismatic, foreign ceramic objects, traditional weapons, and ancient Bugis-Makassar manuscripts.'
    },
    'att_02_detail': {
      'id': 'Sel tahanan berukuran sempit dengan dinding sangat tebal tempat Pahlawan Nasional Pangeran Diponegoro diasingkan oleh pemerintah kolonial Belanda setelah ditangkap pada Perang Jawa. Beliau menghabiskan masa tahanannya selama 22 tahun di sini dari tahun 1833 hingga wafat pada 8 Januari 1855.',
      'en': 'A narrow prison cell with very thick walls where National Hero Prince Diponegoro was exiled by the Dutch colonial government after being captured during the Java War. He spent his 22 years of captivity here from 1833 until his death on January 8, 1855.'
    },
    'att_03_detail': {
      'id': 'Tembok benteng setinggi 7 meter dengan ketebalan mencapai 2 meter, terbuat dari batu padas hitam dan batu karang yang direkatkan dengan campuran kapur dan putih telur. Benteng ini memiliki lima bastion pertahanan yang kokoh di setiap sudutnya untuk mengawasi musuh dari darat dan laut.',
      'en': 'A 7-meter-high fortress wall with a thickness of up to 2 meters, built from black slate and coral stone bonded with lime and egg white mixture. The fortress has five sturdy defensive bastions at each corner to monitor enemies from land and sea.'
    },
    'att_04_detail': {
      'id': 'Area terbuka hijau (courtyard) yang berada tepat di tengah benteng, dikelilingi oleh bangunan-bangunan bergaya kolonial Belanda. Dahulu digunakan sebagai area apel militer VOC, kini taman asri ini menjadi ruang publik yang sering digunakan untuk pagelaran seni dan festival budaya Makassar.',
      'en': 'A green open space (courtyard) located right in the center of the fortress, surrounded by Dutch colonial-style buildings. Formerly used as a VOC military assembly area, this beautiful garden is now a public space often used for art performances and cultural festivals in Makassar.'
    },
    'att_05_detail': {
      'id': 'Salah satu bastion pertahanan utama yang terletak di sudut barat laut benteng. Penamaan Mandarsyah diambil dari nama Sultan Mandarsyah yang membantu pembangunan kembali benteng. Bastion ini memiliki meriam kuno yang terpasang menghadap ke arah laut Makassar untuk menghalau kapal perang musuh.',
      'en': 'One of the main defensive bastions located at the northwest corner of the fort. The name Mandarsyah is derived from Sultan Mandarsyah, who assisted in rebuilding the fort. This bastion features ancient cannons mounted facing the Makassar sea to repel enemy warships.'
    },
    'att_06_detail': {
      'id': 'Bangunan berarsitektur kolonial Belanda klasik yang awalnya berfungsi sebagai gereja Protestan bagi para tentara dan pejabat Belanda yang tinggal di dalam benteng. Memiliki jendela-jendela besar khas Eropa dan menara lonceng kecil di bagian atapnya, menjadikannya salah satu ikon bangunan tercantik.',
      'en': 'A classic Dutch colonial architecture building that originally served as a Protestant church for Dutch soldiers and officials living inside the fort. It features large European-style windows and a small bell tower on its roof, making it one of the prettiest iconic buildings.'
    },
    'att_07_detail': {
      'id': 'Salah satu gedung peninggalan VOC yang telah direvitalisasi menjadi pusat kegiatan seni dan pertunjukan budaya. Tempat ini aktif digunakan oleh seniman lokal Makassar untuk menyelenggarakan pertunjukan teater, pameran seni rupa, pertunjukan tari tradisional Pakarena, dan musik tradisional.',
      'en': 'One of the VOC heritage buildings that has been revitalized into a center for art activities and cultural performances. This venue is actively used by local Makassar artists to host theater shows, fine art exhibitions, traditional Pakarena dance performances, and traditional music.'
    },
    'att_08_detail': {
      'id': 'Ruang edukasi khusus yang menyimpan arsip sejarah Fort Rotterdam, salinan naskah kuno Lontara, jurnal penelitian sejarah, dan literatur kuno. Tempat ini menjadi rujukan utama bagi akademisi, peneliti, dan wisatawan yang ingin mendalami sejarah kejayaan maritim Kerajaan Gowa-Tallo.',
      'en': 'A dedicated educational room housing Fort Rotterdam historical archives, copies of ancient Lontara manuscripts, historical research journals, and ancient literature. This place is the main reference for academics, researchers, and tourists wanting to delve into the Gowa-Tallo Kingdom\'s maritime glory history.'
    },
    // Map Screen
    'map_header': { 'id': 'Denah Benteng', 'en': 'Fortress Map' },
    'map_desc': {
      'id': 'Jelajahi tata letak bersejarah Fort Rotterdam melalui panduan arsitektur pilihan ini.',
      'en': 'Explore the historical layout of Fort Rotterdam through this curated architectural guide.'
    },
    'map_legend_title': { 'id': 'Keterangan Lokasi', 'en': 'Location Legend' },
    'map_total_bastions': { 'id': '4 TOTAL BASTION', 'en': '4 TOTAL BASTIONS' },
    'map_b_buton_title': { 'id': 'Bastion Buton', 'en': 'Bastion Buton' },
    'map_b_buton_desc': {
      'id': 'Menara pengawas utama yang menghadap ke pelabuhan selatan, dibangun pada masa restorasi Belanda.',
      'en': 'The main observation tower overlooking the southern harbor, built during the Dutch restoration era.'
    },
    'map_b_bone_title': { 'id': 'Bastion Bone', 'en': 'Bastion Bone' },
    'map_b_bone_desc': {
      'id': 'Terletak di sisi timur, titik ini berfungsi sebagai stasiun artileri pertahanan utama untuk ancaman dari darat.',
      'en': 'Located on the eastern side, this point served as the primary defensive artillery station for inland threats.'
    },
    'map_b_bacan_title': { 'id': 'Bastion Bacan', 'en': 'Bastion Bacan' },
    'map_b_bacan_desc': {
      'id': 'Bastion sudut strategis yang saat ini menyimpan koleksi naskah sejarah museum.',
      'en': 'A strategic corner bastion that currently houses the museum\'s historical manuscript collection.'
    },
    'map_b_mandarsyah_title': { 'id': 'Bastion Mandarsyah', 'en': 'Bastion Mandarsyah' },
    'map_b_mandarsyah_desc': {
      'id': 'Titik benteng paling utara, menawarkan pemandangan panorama cakrawala Makassar modern.',
      'en': 'The northernmost fortification point, offering a panoramic view of the modern Makassar skyline.'
    },
  };

  static String tr(BuildContext context, String key) {
    final locale = Provider.of<LocaleProvider>(context).locale;
    if (_dict.containsKey(key)) {
      return _dict[key]![locale] ?? _dict[key]!['id']!;
    }
    return key;
  }
}
