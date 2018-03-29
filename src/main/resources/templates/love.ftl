<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Our Story of &amp; love</title>
	    
        <link type="text/css" rel="stylesheet" href="story/default.css">
		<script type="text/javascript" src="story/jquery.js"></script>
		<script type="text/javascript" src="story/jscex.js"></script>
		<script type="text/javascript" src="story/jscex-parser.js"></script>
		<script type="text/javascript" src="story/jscex-jit.js"></script>
		<script type="text/javascript" src="story/jscex-builderbase.js"></script>
		<script type="text/javascript" src="story/jscex-async.js"></script>
		<script type="text/javascript" src="story/jscex-async-powerpack.js"></script>
		<script type="text/javascript" src="story/functions.js" charset="utf-8"></script>
		<script type="text/javascript" src="story/love.min.js" charset="utf-8"></script>
	    <style type="text/css">
            .STYLE1 {color: #666666}
        </style>

    <#--<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> -->
    <#--<script> -->
        <#--(adsbygoogle = window.adsbygoogle || []).push({ -->
            <#--google_ad_client: "ca-pub-9126125536332163", -->
            <#--enable_page_level_ads: true }); -->
    <#--</script>-->
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({
           google_ad_client:"ca-pub-9126125536332163",
           enable_page_level_ads:true
        });
    </script>

</head>
    <body>
			<audio autoplay="autopaly">
					<source src="${ctx!}/music/全世界宣布爱你.mp3"audio/mp3" />
			</audio>
        <div id="main">
    <div id="error">本页面采用HTML5编辑，目前您的浏览器无法显示，请换成谷歌(<a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html?hl=zh-CN&brand=CHMI">Chrome</a>)或者火狐(<a href="http://firefox.com.cn/download/">Firefox</a>)浏览器，或者其他游览器的最新版本。</div>
            <div id="wrap">
                <div id="text">
			        <div id="code">
			        	<span class="say"> Our Story</span><br>
						<span class="say"> </span><br>
						<span class="say"> </span> <br>
                        <span class="say"> <font color="cc1883"> 不经意相识, 或许,只是缘分，或许,只是缘分，或许，是上天注定。</font></span><br>
						<span class="say"> <font color="cc1883">但你已经走进了我的世界。</font></span><br>
                        <span class="say"> </span><br>
			        	<span class="say"> <font color="FF00FA">我在这里，你在那里。爱就彼此心里。</font></span><br>
                        <span class="say"> <font color="FF00FA">不曾消减。</font></span><br>
						<span class="say"> </span><br>
			        	<span class="say"> <font color="228567">虽然相隔千里，但心从未分离。</font></span><br>
                        <span class="say"> <font color="228567">心念彼此。</font></span><br>
						<span class="say"> </span><br>
			        	<span class="say"> <font color="cc1883">喜欢你傻傻的笑，喜欢你可爱的样子。</font></span><br>
                        <span class="say"> <font color="cc1883">感谢你让我遇见了你。</font></span><br>
						<span class="say"> </span><br>
			        	<span class="say"> <font color="228567">愿陪伴在你左右，一直守护你，呵护你。</font></span><br>
                        <span class="say"> </span><br>
                        <span class="say"> <font color="228567">..陪伴才是最长情的告白..</font></span><br>
						<span class="say"> </span><br>
			        </div>
                </div>
                <div id="clock-box">
                    Mr.超<span class="STYLE1">与</span>Ms.静<span class="STYLE1">已经相识了</span>
                  <div id="clock"></div>
              </div>
                <canvas id="canvas" width="1100" height="680"></canvas>
            </div>
            
        </div>
    
    <script>
    </script>

    <script>
    (function(){
        var canvas = $('#canvas');
		
        if (!canvas[0].getContext) {
            $("#error").show();
            return false;
        }

        var width = canvas.width();
        var height = canvas.height();
        
        canvas.attr("width", width);
        canvas.attr("height", height);

        var opts = {
            seed: {
                x: width / 2 - 20,
                color: "rgb(190, 26, 37)",
                scale: 2
            },
            branch: [
                [535, 680, 570, 250, 500, 200, 30, 100, [
                    [540, 500, 455, 417, 340, 400, 13, 100, [
                        [450, 435, 434, 430, 394, 395, 2, 40]
                    ]],
                    [550, 445, 600, 356, 680, 345, 12, 100, [
                        [578, 400, 648, 409, 661, 426, 3, 80]
                    ]],
                    [539, 281, 537, 248, 534, 217, 3, 40],
                    [546, 397, 413, 247, 328, 244, 9, 80, [
                        [427, 286, 383, 253, 371, 205, 2, 40],
                        [498, 345, 435, 315, 395, 330, 4, 60]
                    ]],
                    [546, 357, 608, 252, 678, 221, 6, 100, [
                        [590, 293, 646, 277, 648, 271, 2, 80]
                    ]]
                ]] 
            ],
            bloom: {
                num: 700,
                width: 1080,
                height: 650,
            },
            footer: {
                width: 1200,
                height: 5,
                speed: 10,
            }
        }

        var tree = new Tree(canvas[0], width, height, opts);
        var seed = tree.seed;
        var foot = tree.footer;
        var hold = 1;

        canvas.click(function(e) {
            var offset = canvas.offset(), x, y;
            x = e.pageX - offset.left;
            y = e.pageY - offset.top;
            if (seed.hover(x, y)) {
                hold = 0; 
                canvas.unbind("click");
                canvas.unbind("mousemove");
                canvas.removeClass('hand');
            }
        }).mousemove(function(e){
            var offset = canvas.offset(), x, y;
            x = e.pageX - offset.left;
            y = e.pageY - offset.top;
            canvas.toggleClass('hand', seed.hover(x, y));
        });

        var seedAnimate = eval(Jscex.compile("async", function () {
            seed.draw();
            while (hold) {
                $await(Jscex.Async.sleep(10));
            }
            while (seed.canScale()) {
                seed.scale(0.95);
                $await(Jscex.Async.sleep(10));
            }
            while (seed.canMove()) {
                seed.move(0, 2);
                foot.draw();
                $await(Jscex.Async.sleep(10));
            }
        }));

        var growAnimate = eval(Jscex.compile("async", function () {
            do {
    	        tree.grow();
                $await(Jscex.Async.sleep(10));
            } while (tree.canGrow());
        }));

        var flowAnimate = eval(Jscex.compile("async", function () {
            do {
    	        tree.flower(2);
                $await(Jscex.Async.sleep(10));
            } while (tree.canFlower());
        }));

        var moveAnimate = eval(Jscex.compile("async", function () {
            tree.snapshot("p1", 240, 0, 610, 680);
            while (tree.move("p1", 500, 0)) {
                foot.draw();
                $await(Jscex.Async.sleep(10));
            }
            foot.draw();
            tree.snapshot("p2", 500, 0, 610, 680);

            // 会有闪烁不得意这样做, (＞﹏＜)
            canvas.parent().css("background", "url(" + tree.toDataURL('image/png') + ")");
            canvas.css("background", "#ffe");
            $await(Jscex.Async.sleep(300));
            canvas.css("background", "none");
        }));

        var jumpAnimate = eval(Jscex.compile("async", function () {
            var ctx = tree.ctx;
            while (true) {
                tree.ctx.clearRect(0, 0, width, height);
                tree.jump();
                foot.draw();
                $await(Jscex.Async.sleep(25));
            }
        }));

        var textAnimate = eval(Jscex.compile("async", function () {
		    var together = new Date();
		    together.setFullYear(2017,10,-19); 			//时间年月日
		    together.setHours(18);						//小时	
		    together.setMinutes(50);					//分钟
		    together.setSeconds(3);					//秒前一位
		    together.setMilliseconds(2);				//秒第二位

		    $("#code").show().typewriter();
            $("#clock-box").fadeIn(500);
            while (true) {
                timeElapse(together);
                $await(Jscex.Async.sleep(1000));
            }
        }));

        var runAsync = eval(Jscex.compile("async", function () {
            $await(seedAnimate());
            $await(growAnimate());
            $await(flowAnimate());
            $await(moveAnimate());

            textAnimate().start();

            $await(jumpAnimate());
        }));

        runAsync().start();
    })();
    </script>
	<p style="text-align:center;">©2017- <a href="http://www.jcohy.com">我们的爱情故事</a>&nbsp;友情链接：&nbsp;
    <a href="${ctx!}/index" target="_blank" style="color: #45aed6">Jcohy</a>
        &nbsp;&nbsp;
    <img src="images/gongan.png"><a href="http://www.miitbeian.gov.cn"
                                    target="_blank" rel="nofollow" style="color: #45aed6">京ICP备17050179号-1 </a>&nbsp;
	</p>
	
	</body></html>
