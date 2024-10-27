// class Penjualan {
//   String? idPenjualan;
//   String? tanggalPenjualan;
//   String? totalHarga;
//   String? createdAt;
//   String? pelangganIdPelanggan;
//   String? akunIdAkun;
//   Pelanggan? pelanggan;
//   Akun? akun;

//   Penjualan(
//       {this.idPenjualan,
//       this.tanggalPenjualan,
//       this.totalHarga,
//       this.createdAt,
//       this.pelangganIdPelanggan,
//       this.akunIdAkun,
//       this.pelanggan,
//       this.akun});

//   Penjualan.fromJson(Map<String, dynamic> json) {
//     idPenjualan = json['id_penjualan'];
//     tanggalPenjualan = json['tanggal_penjualan'];
//     totalHarga = json['total_harga'];
//     createdAt = json['createdAt'];
//     pelangganIdPelanggan = json['pelangganIdPelanggan'];
//     akunIdAkun = json['akunIdAkun'];
//     pelanggan = json['pelanggan'] != null
//         ? Pelanggan.fromJson(json['pelanggan'])
//         : null;
//     akun = json['akun'] != null ? Akun.fromJson(json['akun']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id_penjualan'] = idPenjualan;
//     data['tanggal_penjualan'] = tanggalPenjualan;
//     data['total_harga'] = totalHarga;
//     data['createdAt'] = createdAt;
//     data['pelangganIdPelanggan'] = pelangganIdPelanggan;
//     data['akunIdAkun'] = akunIdAkun;
//     if (pelanggan != null) {
//       data['pelanggan'] = pelanggan!.toJson();
//     }
//     if (akun != null) {
//       data['akun'] = akun!.toJson();
//     }
//     return data;
//   }
// }

// class Pelanggan {
//   String? kodePelanggan;
//   String? nama;

//   Pelanggan({this.kodePelanggan, this.nama});

//   Pelanggan.fromJson(Map<String, dynamic> json) {
//     kodePelanggan = json['kode_pelanggan'];
//     nama = json['nama'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['kode_pelanggan'] = kodePelanggan;
//     data['nama'] = nama;
//     return data;
//   }
// }

// class Akun {
//   String? kodePetugas;
//   String? nama;

//   Akun({this.kodePetugas, this.nama});

//   Akun.fromJson(Map<String, dynamic> json) {
//     kodePetugas = json['kode_petugas'];
//     nama = json['nama'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['kode_petugas'] = kodePetugas;
//     data['nama'] = nama;
//     return data;
//   }
// }
