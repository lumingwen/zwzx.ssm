//幻灯大图函数
function datugundong() {
	var jqpfoc = jQuery("#focus_pic");
	jQuery(document).ready(function() {
		var bigpic_boxobj = jqpfoc.find("div.bigpic_box");
		var jqnrbt = jqpfoc.find("ul.btPhoto");
		var len = bigpic_boxobj.find("div.fpic").length;
		var kongzhi = '';
		for ( i = 0; i < len; i++)
			kongzhi += '<li class="bt02"></li>';
		$("ul.btPhoto").append(kongzhi);
		var nmyTime;
		var nsig = 0;
		jqnrbt.find("li:first").addClass("current");
		jqnrbt.find("li").each(function(i) {
			jQuery(this).mouseover(function() {
				bigpic_boxobj.find("div.fpic").eq(i).fadeIn("slow").siblings().hide();
				jQuery(this).addClass("current").siblings().removeClass("current");
				nsig = i;

			})
		});
		jqnrbt.find("li:first").mouseover();
		nmyTime = setInterval(function() {
			nsig++;
			if (nsig >= len) {
				bigpic_boxobj.find("div.fpic").eq(0).fadeIn("slow").siblings().hide();
				jqnrbt.find("li").eq(0).addClass("current").siblings().removeClass("current");
				nsig = 0;
			} else {
				bigpic_boxobj.find("div.fpic").eq(nsig).fadeIn("slow").siblings().hide();
				jqnrbt.find("li").eq(nsig).addClass("current").siblings().removeClass("current")
			}
		}, 5000);
		jqpfoc.mouseenter(function() {
			clearInterval(nmyTime)
		});
		jqpfoc.mouseleave(function() {
			nmyTime = setInterval(function() {
				nsig++;
				if (nsig >= len) {
					bigpic_boxobj.find("div.fpic").eq(0).fadeIn("slow").siblings().hide();
					jqnrbt.find("li").eq(0).addClass("current").siblings().removeClass("current");
					nsig = 0;
				} else {
					bigpic_boxobj.find("div.fpic").eq(nsig).fadeIn("slow").siblings().hide();
					jqnrbt.find("li").eq(nsig).addClass("current").siblings().removeClass("current")
				}
			}, 5000);
		});
		jQuery("#l_btn01").click(function() {
			nsig--;
			if (nsig < 0) {
				nsig = len - 1;
				bigpic_boxobj.find("div.fpic").eq(nsig).fadeIn("slow").siblings().hide();
				jqnrbt.find("li").eq(nsig).addClass("current").siblings().removeClass("current");

			} else {
				bigpic_boxobj.find("div.fpic").eq(nsig).fadeIn("slow").siblings().hide();
				jqnrbt.find("li").eq(nsig).addClass("current").siblings().removeClass("current");

			}
		});
		jQuery("#r_btn01").click(function() {
			nsig++;
			if (nsig > len - 1) {
				nsig = 0;
				bigpic_boxobj.find("div.fpic").eq(0).fadeIn("slow").siblings().hide();
				jqnrbt.find("li").eq(nsig).addClass("current").siblings().removeClass("current");
			} else {
				bigpic_boxobj.find("div.fpic").eq(nsig).fadeIn("slow").siblings().hide();
				jqnrbt.find("li").eq(nsig).addClass("current").siblings().removeClass("current");

				//$("#focus_pic img.lazyload").each(function () {var tagimg=$(this).attr("data-original");$(this).attr("src",tagimg);});

			}
		});
	})
};