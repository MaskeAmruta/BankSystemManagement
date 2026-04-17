
window.onload = function (){
	var today = new Date().toISOString().split("T")[0];
	document.getElementById("startDate").value =today;
}

function endDateCalulate(){
	var sDate = new Date(document.getElementById("startDate").value);
	var tenure = parseInt(document.getElementById("tyear").value);
	
	if(!isNaN(tenure)){
		sDate.setMonth(sDate.getMonth() + tenure);
				
		var eDate = sDate.toISOString().split("T")[0];
		document.getElementById("endDate").value = eDate;
		
	}
	
	calulateEMI();
}

 
function calulateEMI(){
			var amount =parseInt(document.getElementById("reqamount").value);			
			var interestRate =parseFloat(document.getElementById("rate").value);
			var tenure =parseInt(document.getElementById("tyear").value);
			var monthlyRate = interestRate / 12 /100;
			var emi1 =(amount * monthlyRate * Math.pow(1 + monthlyRate,tenure)/Math.pow(1 + monthlyRate,tenure)-1);
					
			document.getElementById("emi").value = emi1.toFixed(2);		
		}		
		