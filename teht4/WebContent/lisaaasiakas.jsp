<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Insert title here</title>
</head>
<body>
<form id="tiedot">
	<table>
		<thead>	
			<tr>
				<th colspan="5" class="oikealle"><span id="takaisin">Takaisin listaukseen</span></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>	
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="submit" id="tallenna" value="Lisää"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function(){
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat2.jsp";
	});
	$("#tiedot").validate({						
		rules: {
			etunimi:  {
				required: true,
				minlength: 2
			},	
			sukunimi:  {
				required: true,
				minlength: 2
			},
			puhelin:  {
				required: true,
				minlength: 8,
				maxlength: 20
			},	
			sposti:  {
				required: true,
				email: true
			}	
		},
		messages: {
			etunimi: {     
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			puhelin: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			sposti: {
				required: "Puuttuu",
				email: "Ei ole kelvollinen sposti",
			}
		},			
		submitHandler: function(form) {	
			lisaaTiedot();
		}		
	}); 	
});
//Kutsutaan backin POST-metodia ja välitetään kutsun mukana uudet tiedot json-stringinä.

function lisaaTiedot(){	
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); //muutetaan lomakkeen tiedot json-stringiksi
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"POST", dataType:"json", success:function(result) { //result on joko {"response:1"} tai {"response:0"}       
		if(result.response==0){
    	$("#ilmo").html("Asiakkaan lisääminen epäonnistui.");
    }else if(result.response==1){			
    	$("#ilmo").html("Asiakkaan lisääminen onnistui.");
    	$("#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
}});	
}
</script>
</html>
