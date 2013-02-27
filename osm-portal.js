// Enable page switcher, which is disabled by default
var switcher = document.getElementById('switcher');
switcher.style.display = 'block';

// Pages
var selected_page = 0;
var pages = [];

// Run through all radios, install onclick events and determine currently selected radio
{
	var radios = switcher.getElementsByTagName('input');
	for (r = 0; r < radios.length; r++) {
		if (radios[r].checked) {
			selected_page = r;
		}
		radios[r].onclick = function(newpage) { return function() {
			pages[selected_page].style.display = 'none';
			selected_page = newpage;
			pages[selected_page].style.display = 'block';
		}}(r);
	}
}

// Fill pages array, and hide all pages except for selected one
{
	var numpage = 0;
	var divs = document.getElementsByTagName('div');
	for (d = 0; d < divs.length; d++) {
		if (divs[d].className === 'page') {
			divs[d].style.display = (numpage == selected_page ? 'block' : 'none');
			pages.push(divs[d]);
			numpage++;
		}
	}
}
