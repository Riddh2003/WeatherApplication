<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WeatherApplication</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<style>
*{
margin : 0;
padding : 0;
box-sizing :  border-box;
font-family : "Ubuntu",sans-serif;
}
body{
	display : flex;
	width : 100%;
	height : 100vh;
	align-items : center;
	justify-content : center;
	background : linear-gradient(rgb(0,0,139,0.8),#448EE4,#87CEFA,rgba(255,255,255,0.5));
}
.weatherBox{
	background:rgba(255, 255, 255, 0.7);
	border-radius : 20px;
	width : 380px;
	height : 47%;
	display:flex;
	flex-direction : column;
	align-items : center;
	justity-content : space-between;
	padding : 30px;
}
.search{
	width : 350px;
	height : 10%;
	display : flex;
	overflow : 0;
	align-items : center;
	padding :  0 10px;
	margin-bottom : 10px;
}
.searchInput{
	width : 300px;
	height : 40px;
	padding : 10px;
	font-size : 15px;
	overflow : 0;
	border : 0;
	border-radius : 5px;
	background : #fff;
}
.searchButton{
	width : 40px;
	height :  40px;
	border : 0;
	overflow : 0;
	background : #fff;
	border-radius : 3px;
	margin-left : 5px;
}
.weatherDetails{
	width : 330px;
	height : 90%;
}
.weatherIcon{
	display : flex;
	align-items : center;
	justify-content : center;
	width : 100%;
	height : 170px;
}
.weatherIcon img{
	width : 50%;
	height : 90%;
}
.weatherIcon h2{
	margin-left: 20px;
	color : #FF8C00;
}
.weatherIcon .temp{
	display : flex;
	flex-direction : column;
	align-items : center;
	justify-content : space-between;
}
.cityDetails{
	display : flex;
	align-items : center;
	justify-content : space-around;
	flex-direction : column;
	margin-top : 5px;
}
.date{
	margin-top : 5px;
}
.windDetails{
	display : flex;
	align-items : center;
	justify-content : space-between;
	margin-top : 10px;
}
.humidityBox{
	display : flex;
	align-items : center;
	justify-content : space-around;
	width : 150px;	
}
.humidityBox img{
	width : 50px;
}
.windSpeed{
	width : 150px;
	display : flex;
	align-items : center;
	justify-content : space-between;
}
.windSpeed img{
	width : 50px;
}
</style>
<body>
	<div class = "weatherBox">
		<form action ="MyServlet" method="post" class ="search">		
			<input type="text" placeholder="Enter City Name" class="searchInput" value ="Gujarat" name="city" valuehidden/>
			<button class = "searchButton"><i class="fa-solid  fa-magnifying-glass"></i></button>
		</form>
		<div class="weatherDetails">
			<div class="weatherIcon">
				<img src="" alt="Clouds" id="weather-icon">
				<div class = "temp">
					<h2>${temperature}&#176c</h2>
					<h2>${weatherCondition}</h2>				
				</div>
				<input type="hidden" id="wc" value="${weatherCondition}"></input>				
			</div>
			<div class="cityDetails">
				<div class="place"><h2><strong>${city}</strong></h2></div>
				<div class="date">${date}</div>			
			</div>
			<div class="windDetails">
				<div class="humidityBox">
					<img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png">
					<div class="humidity">
						<span>Humidity</span>
						<h2>${humidity}%</h2>
					</div>
				</div>
				<div class="windSpeed">
					<img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png">
					<div class="wind">
						<span>Wind Speed</span>
						<h2>${windSpeed}</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var weatherIcon = document.getElementById("weather-icon");
	var val = document.getElementById("wc").value;
	
	switch(val){
	case 'Clouds':
		weatherIcon.src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwFTkt5z_dxU6w1UnS1PxiZV3HDiPGsAW5Lrsp09MnlCmkQre9GzO8MnGytaaY1eZoqBN6SMJ4U578_uDtiuXswovr1T3o-Kt5KK0mlN_zC0RDodJFaKHQ3Uk-HIZ3vuMvAKNJi8DDFwWA7F6BOxz78Oh-UePwJTuc3PG0ZIZypPE1xlMPl5z46joaEw/s320/Clouds.png";
		break;
	case 'Clear':
		weatherIcon.src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7pmzNCftryAfpa1YBSzVeYtjgxDQnw09Ug0HVV47J8GEtHPYTH9hJgZ2M1k0YgE0pcZ1qekr4C14zyPCiVuQAfXLClK8Ww3hYB6v77yElP7Lo5BnUKo4n-w6yB17FAbw51WST6YKS0GMwyA4fYNxOZxEyNL6HhUfFRgVhOW0GyRdBRriMHFQ-qfh4cA/s320/sun.png";
		break;
	case 'Rain':
		weatherIcon.src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgDW_NdwvxV796rkFf43qmUDiTQePn5dg7PDfn1SijfpjtB0AWJMBcifU6LWyW7iOtjZhfqIJnKEGQ1PwbbXS7NoKMSAmvy7i2ljWXMYLue3EBIBBR2qTFbs6QCe5eoFr2CU9WzCVJ8u0J3z3eAo3Ajv1LXamZASFtbj9sA_gD-Kp3hfgAk17Xh17RoLQ/s320/rainy.png";
		break;
	case 'Mist':
		weatherIcon.src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVpL23l0t1U_ibWi01TFcHMF6J_t-9Ada5PavGlwG4M_mKIcx0pV1md9SN9ip1d84NaVowml5Do16XO3nsuttnM2-Ov05d-wCjEYjdzaOYfKvijw8k6Hfj9pOiPyEZTp2W20EPbTeONTgJE2Rdxs4KZUfg6f2PmbMF1094NcqJ7DwSFUQwYiRmVCNvuA/s320/mist.png";
		break;
	case 'Snow':
		weatherIcon.src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-P3iT_uQK95qFY4h7QGdEtbRc1aVQo9BZy0ZWyPBvCNrP-4wnRStw0xYj9e4xa4ZlYISeNZqVJ33UP4YukR4jBennDD_obIN4QxYNZHdzG_z6_MNL2U08wMXwdFhtfvitW5LGiHgrwMJFC8QJFqbSO3woGSBqOdagGxaEQ20_S31Gc-GYL4vYzPzaPw/s320/snow.png";
		break;
	case 'Haze':
		weatherIcon.src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjld66Ia5g_hpBn3Impi3zzOBHqWkjQInGLxTb2uXksuCsrkQU8HjlVyLobEJEGg8fRSIxeFzldGEHUmWcaiZBwAcRy4dGDpFX1BjTSB56qmBjW5tEW3RSC9_mCuLU_a8RuXchxGY7Oc8HLLl-IfaDW19Z0ZJJfNae9tECXRIyEu7rmJ3da08z8cI-phw/s320/haze.png";
		break;
	case 'Smoke':
		weatherIcon.src="https://upload.wikimedia.org/wikipedia/commons/2/23/Smoke_icon_iOS.png";
		break;
	}
</script>
</html>