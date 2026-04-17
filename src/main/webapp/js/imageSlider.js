document.addEventListener("DOMContentLoaded", function(){

    let index = 0;
    const slides = document.querySelectorAll(".slides img");
    const dots = document.querySelectorAll(".dot");
    const thumbs = document.querySelectorAll(".thumbnails img");

	console.log("slides:", slides.length);
	console.log("dots:", dots.length);
	console.log("thumbs:", thumbs.length);
	
	
    function showSlide(i){
		
		if(slides.length === 0) return;
		
        slides.forEach(s => s.classList.remove("active"));
        dots.forEach(d => d.classList.remove("active"));
        thumbs.forEach(t => t.classList.remove("active"));
	
        slides[i].classList.add("active");
        dots[i].classList.add("active");
        thumbs[i].classList.add("active");
    }

    function changeSlide(n){
        index = (index + n + slides.length) % slides.length;
        showSlide(index);
    }

    function setSlide(n){
        index = n;
        showSlide(index);
    }

    window.changeSlide = changeSlide;
    window.setSlide = setSlide;

    setInterval(()=>{
        changeSlide(1);
    }, 3000);

});