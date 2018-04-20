let links = document.getElementsByClassName("delete");
links = Array.from(links);
links.forEach(function(link){
    link.addEventListener("click", (event) => {
        event.preventDefault();
        const url = `admindashboard.php?ID=${link.dataset.id}`;
        fetch(url)
        .then(function(){
            const post = document.getElementById(`post-${link.dataset.id}`);
            post.innerHTML = "";
        })
            
        
       
      })
})
