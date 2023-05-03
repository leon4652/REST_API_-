    	function show(contentId) {
// location.href =
// '${root}/attraction?action=areaPage&sido=${sidoCode}&content=' + contentId;
			fetch("${root}/attraction?action=areaContent&sido=${sidoCode}&content=" + contentId)
			.then((response) => {
				console.log(response);
				return response.json();
			})
			.then((data) => {
				console.log(data);
				makeList(data, contentId);
			})
    	}
    	
    	function makeList(data, contentId) {
// <ul>
// <li class="item category" style="background-image:
// url(${attraction[firstImage]});">
// <div onclick="">${attraction[title]}</div>
// </li>
// </ul>
			console.dir(data);
        	let divEle = document.querySelector('#type' + contentId);
    		let ulEle = document.createElement('ul');
    		
    		for(let d of data) {
    			console.log(d.firstImage, d.title);
    			
    			ulEle.innerHTML += `<li class="item category" style="background-image: url('${d.firstImage}');">
                  	<div onclick="">${d.title}</div>
    	          </li>`;
    		}
    		divEle.appendChild(ulEle);
    	}