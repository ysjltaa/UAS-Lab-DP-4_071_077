program PerhitunganGajiKaryawan;

uses crt;

type
  // Mendefinisikan tipe record untuk karyawan
  TKaryawan = record
    nama: string[50];
    jabatan: string[30];
    gajiPokok: real;
    tunjangan: real;
    gajiTotal: real;
  end;

var
  karyawan: array[1..30] of TKaryawan;
  jumlahKaryawan, i: Integer;

{ Fungsi untuk menghitung tunjangan berdasarkan jabatan }
function HitungTunjangan(jabatan: string; gajiPokok: real): real;
begin
  if jabatan = 'Manager' then
    HitungTunjangan := gajiPokok * 0.3  // 30% tunjangan untuk Manager
  else if jabatan = 'Staf' then
    HitungTunjangan := gajiPokok * 0.1  // 10% tunjangan untuk Staf
  else if jabatan = 'Pekerja' then
    HitungTunjangan := gajiPokok * 0.05 // 5% tunjangan untuk Pekerja
  else
    HitungTunjangan := 0; // Tidak ada tunjangan untuk jabatan lainnya
end;

{ Prosedur untuk memasukkan data karyawan }
procedure InputDataKaryawan(var k: TKaryawan; nomor: Integer);
begin
  writeln('Masukkan Data Karyawan ke-', nomor);
  write('Nama: ');
  readln(k.nama);
  write('Jabatan (Manager/Staf/Pekerja): ');
  readln(k.jabatan);
  write('Gaji Pokok: ');
  readln(k.gajiPokok);
  k.tunjangan := HitungTunjangan(k.jabatan, k.gajiPokok);
  k.gajiTotal := k.gajiPokok + k.tunjangan;
end;

{ Prosedur untuk menampilkan data karyawan }
procedure TampilkanDataKaryawan(k: TKaryawan; nomor: Integer);
begin
  writeln('Karyawan ke-', nomor);
  writeln('Nama         : ', k.nama);
  writeln('Jabatan      : ', k.jabatan);
  writeln('Gaji Pokok   : Rp ', k.gajiPokok:0:2);
  writeln('Tunjangan    : Rp ', k.tunjangan:0:2);
  writeln('Gaji Total   : Rp ', k.gajiTotal:0:2);
  writeln;
end;

begin
  clrscr;
  writeln('=== Program Perhitungan Gaji Karyawan ===');
  
  { Input jumlah karyawan }
  write('Masukkan jumlah karyawan: ');
  readln(jumlahKaryawan);
  
  { Input data karyawan secara berulang }
  for i := 1 to jumlahKaryawan do
  begin
    InputDataKaryawan(karyawan[i], i);
  end;
  
  { Menampilkan data karyawan }
  writeln('=== Data Karyawan ===');
  for i := 1 to jumlahKaryawan do
  begin
    TampilkanDataKaryawan(karyawan[i], i);
  end;

  readln;
end.