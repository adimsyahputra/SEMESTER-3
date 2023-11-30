<?php
require "session.php";
require "koneksi.php";

$queryKategori = mysqli_query($con, "SELECT * FROM kategori");
$jumlahKategori = mysqli_num_rows($queryKategori);
$query = mysqli_query($con, "SELECT produk.*, kategori.nama AS nama_kategori FROM produk
            LEFT JOIN kategori ON produk.kategori_id = kategori.id_kategori");
$jumlahProduk = mysqli_num_rows($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produk</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome/css/fontawesome.min.css">
</head>

<style>
    .no-decoration{
        text-decoration: none;
    }
</style>
<body>
    <?php require "navbar.php"; ?>
    <div class="container mt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">
                    <a href="../adminpanel" class="no-decoration text-muted">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    Produk
                </li>
            </ol>
        </nav>

        <!-- tambah produk -->
        <div class="my-5 col-12 col-md-6">
            <h3>Tambah Produk</h3>

            <form action="produk-detail.php" method="post" enctype="multipart/form-data">
                <div>
                    <label for="nama">Nama</label>
                    <input type="text" name="nama" id="nama" class="form-control" autocomplete="off" required> 
                </div>

                <div>
                    <label for="kategori">Kategori</label>
                    <select name="kategori" id="kategori" class="form-control" required>
                        <option value="">Pilih Satu</option>

                        <?php
                        while($data=mysqli_fetch_array($queryKategori)){
                        ?>
                            <option value="<?php echo $data['id_kategori']; ?>"><?php echo $data['nama']?></option>
                        <?php
                        }
                        ?>
                    </select>
                </div>

                <div>
                    <label for="harga">Harga</label>
                    <input type="number" class="form-control" name="harga" required>
                </div>

                <div>
                    <label for="foto">Foto</label> 
                    <input type="file" name="foto" id="foto" class="form-control">
                </div>

                <div>
                    <label for="detail">Details</label>
                    <textarea name="detail" id="detail" cols="30" rows="10" class="form-control"></textarea>
                </div>

                <div>
                    <label for="ketersediaan_stok">Ketersediaan Stok</label>
                    <select name="ketersediaan_stok" id="ketersediaan_stok" class="form-control">
                        <option value="tersedia">tersedia</option>
                        <option value="habis">habis</option>
                    </select>
                </div>

                <div>
                    <button type="submit" class="btn btn-primary mt-3" name="simpan">Simpan</button>
                </div>
            </form>

            <?php
                
                function generateRandomString($length = 10) {
                    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                    $randomString = '';
                
                    for ($i = 0; $i < $length; $i++) {
                        $randomString .= $characters[rand(0, strlen($characters) - 1)];
                    }
                
                    return $randomString;
                }
                
                
                if (isset($_POST['simpan'])) {
                    $nama = htmlspecialchars($_POST['nama']);
                    $kategori = htmlspecialchars($_POST['kategori']);
                    $harga = htmlspecialchars($_POST['harga']);
                    $detail = htmlspecialchars($_POST['detail']);
                    $ketersediaan_stok = htmlspecialchars($_POST['ketersediaan_stok']);

                    // Penanganan file foto
                    $target_dir = "../images/";
                    $nama_file = basename($_FILES["foto"]["name"]);
                    $target_file = $target_dir . $nama_file;
                    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
                    $image_size = $_FILES["foto"]["size"];

                    $random_name = generateRandomString(20);
                    $new_name = $nama_file;

                    if ($nama == '' || $kategori == '' || $harga == '') {
                        // Pesan kesalahan jika data tidak lengkap
                        echo '<div class="alert alert-warning mt-3" role="alert">Nama, kategori, dan harga wajib diisi</div>';
                    } else {
                        if ($nama_file != '') {
                            if ($image_size > 500000) {
                                // Pesan kesalahan jika ukuran file terlalu besar
                                echo '<div class="alert alert-warning mt-3" role="alert">File tidak boleh lebih dari 500 Kb</div>';
                            } else {
                                // Pengecekan tipe file
                                $allowed_types = array('jpg', 'jpeg', 'png', 'gif');
                                if (!in_array($imageFileType, $allowed_types)) {
                                    // Pesan kesalahan jika tipe file tidak diizinkan
                                    echo '<div class="alert alert-warning mt-3" role="alert">File wajib bertipe JPG, PNG, atau GIF</div>';
                                } else {
                                    if (!file_exists($target_dir)) {
                                        mkdir($target_dir, 0755, true);
                                    }
                                    // Check if the file is successfully uploaded
                                    if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_dir . $new_name)) {
                                        // Query insert untuk produk table
                                        $queryTambah = mysqli_query($con, "INSERT INTO produk (kategori_id, nama, harga, foto, detail, stok) VALUES 
                                            ('$kategori', '$nama', '$harga', '$new_name', '$detail', '$ketersediaan_stok')");
                                    
                                        if ($queryTambah) {
                                            // Pesan sukses jika produk berhasil disimpan
                                            echo '<div class="alert alert-primary mt-3" role="alert">Produk Berhasil Disimpan</div>';
                                            echo '<meta http-equiv="refresh" content="4; url=produk.php" />';
                                        } else {
                                            // Tampilkan pesan kesalahan SQL jika query tidak berhasil
                                            echo mysqli_error($con);
                                        }
                                    } else {
                                        // Tampilkan pesan kesalahan jika file tidak dapat diunggah
                                        echo '<div class="alert alert-warning mt-3" role="alert">Gagal mengunggah file</div>';
                                    }
                                }
                            }
                        } else {
                            // Tampilkan pesan kesalahan jika file foto tidak diunggah
                            echo '<div class="alert alert-warning mt-3" role="alert">Foto produk wajib diunggah</div>';
                        }
                    }
                    ?>
  
                            <div class="alert alert-warning mt-3" role="alert">
                                Foto produk wajib diunggah
                            </div>
            <?php
                        }
            ?>
        </div>

        <div class="table-responsive mt-5">
    <table class="table">
        <thead>
            <tr>
                <th>No.</th>
                <th>Nama</th>
                <th>Kategori</th>
                <th>Harga</th>
                <th>Ketersediaan Stok</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
                if($jumlahProduk == 0){
            ?>
                <tr>
                    <td colspan=6 class="text-center">Data produk tidak tersedia</td>
                </tr>
            <?php
                }
                else{
                    $jumlah = 1;
                    while($data=mysqli_fetch_array($query)){
            ?>
                        <tr>
                            <td><?php echo $jumlah; ?></td>
                            <td><?php echo $data['nama']; ?></td>
                            <td>
                            <?php
                                // Check if the key exists before accessing it
                                if(isset($data['nama_kategori'])) {
                                    echo $data['nama_kategori'];
                                } else {
                                    echo "Nama Kategori Tidak Tersedia";
                                }
                            ?>
                            </td>
                            <td><?php echo $data['harga']; ?></td>
                            <td><?php echo $data['stok']; ?></td>
                            <td>
                                <a href="produk-detail.php?id=<?php echo $data['id_produk']; ?>" class="btn btn-info">
                                <i class="fas fa-search"></i></a>
                            </td>
                        </tr>
            <?php
                        $jumlah++;
                    }
                }
            ?>
        </tbody>
    </table>
</div>
    </div>

    </div>

    <script src="../bootstrap/js/bootstrap.bundel.min.js"></script>
    <script src="../fontawesome/js/all.min.js"></script>
</body>
</html>