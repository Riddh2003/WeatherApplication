package Program;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Api key
		String apiKey = "fe5d9a8425cdccc40b9de59290855e03";
		//city by user
		String city = request.getParameter("city");
		String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey;
		
		try {
			URL url = new URL(apiUrl);
			//url  coonetion astablish
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			//data read by inputstream
			InputStream inputStream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(inputStream);
			
			//data store in string
			StringBuilder responseContent = new StringBuilder();
			
			//Input from the reader , will create scanner object
			Scanner sc = new Scanner(reader);
			while(sc.hasNext()) {
				responseContent.append(sc.nextLine());
			}
			sc.close();
			
			//Typecasting into json
			Gson gson = new Gson();
			JsonObject jsonObject = gson.fromJson(responseContent.toString(),JsonObject.class);
			
			//Date & Time
			long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
			String date = new Date(dateTimestamp).toString();
			
			//Temperature 
			double temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
			int temperatureCelsius = (int)(temperatureKelvin - 273.15);
			
			//Humidity
			int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
			
			//Wind Speed
			double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
			
			//weather Condition
			String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
			
			//set the data as request attribute(for sending to the jsp)
			request.setAttribute("date",date);
			request.setAttribute("city",city);
			request.setAttribute("temperature",temperatureCelsius);
			request.setAttribute("weatherCondition",weatherCondition);
			System.out.println(weatherCondition);
			request.setAttribute("humidity",humidity);
			request.setAttribute("windSpeed",windSpeed);
			request.setAttribute("weatherData",responseContent.toString());
			
			connection.disconnect();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//forward the request to the weather.jsp page for client/readering
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
