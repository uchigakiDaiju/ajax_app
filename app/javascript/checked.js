function check(){
  const posts = document.querySelectorAll(".post"); //postというclass名を持つ（class="post")奴ら全部、つまりメモ全部をpostsに代入しとけ
  posts.forEach(function(post){     //上記で全部constに入れたやつをforEachで一つずつ取り出して、postに代入
    if ( post.getAttribute("data-load") != null){ //nullじゃない：つまり存在すれば終わりreturn null;
      return null;
    }
    post.setAttribute("data-load", "true")
    post.addEventListener("click", ()=>{   //このaddEventListenerでクリック時に何か起きるようにしておく
       // ここにクリックした時に行う「何らかの処理」を記述していく
       const postId = post.getAttribute("data-id");
       const XHR = new XMLHttpRequest();
       XHR.open("GET", `/posts/${postId}`, true);
       XHR.responseType = "json";
       XHR.send();
       XHR.onload = ()=>{
        if (XHR.status != 200){
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null; //JavaScriptの処理から抜け出す。エラーが出た場合、15行目以降の処理を行わないが目的。
        }

         const item = XHR.response.post;
         if (item.checked === true) {
           post.setAttribute("data-check", "true");
         } else if (item.checked === false){
           post.removeAttribute("data-check");
         }
       };
    });
  });
}
setInterval(check, 1000);