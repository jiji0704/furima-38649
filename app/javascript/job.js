document.addEventListener("DOMContentLoaded", () => {
  const jobInput = document.querySelector("#job");
    if (jobInput){
      const inputElement = document.getElementById("job");
      inputElement.addEventListener("input", () => {
        const keyword = document.getElementById("job").value;
    
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/users/search/?keyword=${keyword}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          const job = XHR.response.keyword;
          const searchResult = document.getElementById("search-result");
          job.forEach((job) => {
          const childElement = document.createElement("div");
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", job.id);
          childElement.innerHTML = job.job_name;
          searchResult.appendChild(childElement);
         });
        };
      });
    };
  });