<?php
	include_once('config.php');
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Tugas Membuat Blog</title>

		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<style>
			.topnav {
					  overflow: hidden;
					  background-color: #e9e9e9;
					}

					.topnav a {
					  float: left;
					  display: block;
					  color: black;
					  text-align: center;
					  padding: 14px 16px;
					  text-decoration: none;
					  font-size: 17px;
					}

					.topnav a:hover {
					  background-color: #ddd;
					  color: black;
					}
		</style>
	</head>
	<body>

		<!-- CONTENT GOES HERE -->
		<div class="container" style="background-color: #F8F8FF;">
			<div class="blog-header">
				<h1 class="blog-title" style="font-family: Harlow Solid Italic;">Vini Anggraini
					<img src="img/instagram.jpg" style="margin-left: 620px; height: 40px;">
				  	<img src="img/twitter.png" style="height: 40px;">
				  	<img src="img/facebook.png" style="height: 40px;">
				  	<img src="img/whatsap.jpg" style="height: 40px;">
				  	<img src="img/email.jpg" style="height: 40px;">
				</h1>
				<!-- <p class="lead blog-description" style="background-color: #FFB6C1; font-family: Comic Sans MS;">Selamat Datang di Blog Vini Anggraini </p>-->

				<div class="topnav" style='background-color: #FFB6C1;'>
				  <a class="active" href="#home" style="font-family: 30px">Home</a>
				  <a href="#Kegiatan">Kegiatan</a>
				  <a href="#Family">Family</a>
				  <a href="#Photo">Photo</a>
				 </div>
				 <br>
				<img src="img/work.jpg" style="width: 100%; height: 400px;">
				<marquee style="text-align: center; font-size: 20px;"><i>“The man who does more than he is paid for will soon be paid more than he does” -  Napoleon Hill</i></marquee>
			</div>

			<br>
			<div class="row">
				<div class="col-md-3">
					<a href="add.php" class="btn btn-primary btn-block">Tambah Artikel</a>
					<br><br>
					<img src="img/yoga.jpeg" style="width: 100%; height: 250px">
					<br><br>
					<img src="img/gambar.jpg" style="width: 100%; height: 250px">
					<br><br><br>
					<img src="img/memahami.jpg" style="width: 100%; height: 250px">
					<br><br><br>
					<img src="img/asus.jpeg" style="width: 100%; height: 265px">
					<br><br><br>
					<img src="img/kopi.jpeg" style="width: 100%; height: 260px">
					<br>
				</div>

				<div class="col-md-9 blog-main">
					<div class="row"></div>
					<?php
						if(isset($_GET['submit'])){
							$search_keyword = $_GET['search_keyword'];
						}else{

							$search_keyword = "";		
						}

						echo $search_keyword;

						$result = mysqli_query($mysqli, "select * from artikel join kategori on artikel.id_kategori = kategori.id_kategori where judul_artikel like '%$search_keyword%' order by tanggal_artikel desc");
					?>

					<form action="index.php" method="GET">
						<div class="row content">
							<div class="col-md-11">
								<div class="form-group">
									<input class="form-control" type="text" name="search_keyword" placeholder="search...">
								</div>

								<!-- <div class="col-md-3">
									<a href="index.php" class="btn btn-default btn-block">Reset</a>
								</div> -->
							</div>	
							<input type="submit" class="btn btn-primary" name="submit" value="search">
						</div>
					</form>

					<?php
						//fungsi cek jumlah baris dari hasil query
						if(mysqli_num_rows($result) == 0){
							echo "<em>Tidak ada artikel</em>";
						}else{
							while($artikel_data = mysqli_fetch_array($result)){
								?>
								<div class="blog-post">
									<h2 class="blog-post-title" style="color: #FFA07A; font-family: AR JULIAN;"><?php echo $artikel_data['judul_artikel']; ?></h2>
									<p class="blog-post-meta"><?= $artikel_data['tanggal_artikel'] ?> by <a href="#"><?= $artikel_data['author_artikel'] ?></a></p>

									<span class="label1 label1-success"><b><?php echo $artikel_data['nama_kategori']; ?></b></span>

									<p style="text-align: justify; font-family: Goudy Old Style; font-size: 20px;">
										<?= $artikel_data['isi_artikel'] ?>
										<!-- <a href="artikel1.php">baca selengkapnya</a> -->
									</p>
									
									<a href="edit.php?id_artikel=<?php echo $artikel_data['id_artikel']; ?>" class="btn btn-primary">Edit</a>
									<a href="delete.php?id_artikel=<?php echo $artikel_data['id_artikel']; ?>" class="btn btn-danger" onclick="return confirm('Apakah anda yakin akan menghapus artikel ini?');">Delete</a>
								</div>
								<?php
							}
						}
					?>
				</div>
			</div>

		<br><br>
		<div class="row">
		<div class="col-md-12" style="text-align: center; background-color: #FFB6C1; font-family: Comic Sans MS;">
			<h4>@2018 Tugas ke 8 Vini Anggraini</h4>
		</div>
		</div>
		</div>
		</div>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>