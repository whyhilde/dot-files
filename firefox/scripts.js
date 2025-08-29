// acceleration of any video by 3 times
javascript:void(document.querySelector('video').playbackRate = 3);


// quick search for selected text
javascript:(function(){let text=window.getSelection().toString();if(text){window.open('https://www.duckduckgo.com/search?q='+encodeURIComponent(text));}})();


// disable JavaScript on page
javascript:(function(){document.body.innerHTML+='<iframe src="'+location.href+'" style="position:fixed;top:0;left:0;width:100%;height:100%;border:none;z-index:9999;"></iframe>';})();


// delete all cookies of current site
javascript:(function(){document.cookie.split(';').forEach(c=>{document.cookie=c.replace(/^ +/,'').split('=')[0]+'=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/';});alert('Cookies очищены!');})();