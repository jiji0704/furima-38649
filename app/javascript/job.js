document.addEventListener("DOMContentLoaded", () => {
  const jobInput = document.querySelector("#job");
      if (jobInput){
        const inputElement = document.getElementById("job");
        inputElement.addEventListener("input", () => {
          const keyword = document.getElementById("job").value;      
          const XHR = new XMLHttpRequest();
          XHR.open("GET", `/userinfos/search/?keyword=${keyword}`, true);
          XHR.responseType = "json";
          XHR.send();
          XHR.onload = () => {
            const searchResult = document.getElementById("search-result");
            searchResult.innerHTML = "";
            if (XHR.response) {
              const job = XHR.response.keyword;
              job.forEach((job) => {
                const childElement = document.createElement("div");
                childElement.setAttribute("class", "child");
                childElement.setAttribute("id", job.id);
                childElement.innerHTML = job.job;
                searchResult.appendChild(childElement);
                const clickElement = document.getElementById(job.id);
                clickElement.addEventListener("click", () => {
                document.getElementById("job").value = clickElement.textContent;
                clickElement.remove();
              });
            });
           };
          };
        });
      };
    });