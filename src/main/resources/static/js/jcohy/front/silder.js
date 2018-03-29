var obj=null;
var As=document.getElementById('topnav').getElementsByTagName('a');
obj = As[0];
for(i=1;i<As.length;i++){
    //去掉域名的前缀
    var  a_href =  As[i].href.split('/').slice(3).join('/');
    var  win_href = window.location.href.split('/').slice(3).join('/');
    // console.log(a_href);
    // console.log(win_href);

    if(a_href.indexOf(win_href.substring(0,win_href.indexOf("/"))) === 0)
        obj=As[i];

    if(win_href === "" || win_href === null){
        obj=As[0];
    }

}
obj.id='topnav_current';