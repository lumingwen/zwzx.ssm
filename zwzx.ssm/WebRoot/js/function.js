//===========================上传文件JS函数结束================================
(function($){
$.fn.pagination = function(maxentries, opts) {
    opts = jQuery.extend({
        items_per_page: 10,
        num_display_entries: 7,
        current_page: 0,
        num_edge_entries: 1,
        link_to: "#",
        prev_text: "上一页",
        next_text: "下一页",
        ellipse_text: "...",
        prev_show_always: true,
        next_show_always: true,
        callback: function() { return false; }
    }, opts || {});
    return this.each(function() {
        function numPages() {
            return Math.ceil(maxentries / opts.items_per_page);
        }
        function getInterval() {
            var ne_half = Math.floor(opts.num_display_entries / 2);
            var np = numPages();
            var upper_limit = np - opts.num_display_entries;
           
            var start = current_page > ne_half ? Math.max(Math.min(current_page - ne_half, upper_limit), 0) : 0;
            var end = current_page > ne_half ? Math.min(current_page + ne_half, np) : Math.min(opts.num_display_entries, np);
            if(np==end){
            	if ((current_page + ne_half)>=np) {
            		if(maxentries<=30)
            		{
            			return [start, end];
            		}else{
            		return [start-1, end]; 
            		}
            	}else{
         		return [start, end];
            	}
            }else{
            return [start, end+1];
            }
        }
        function pageSelected(page_id, evt) {
            current_page = page_id;
            drawLinks();
            var continuePropagation = opts.callback(page_id, panel);
            if (!continuePropagation) {
                if (evt.stopPropagation) {
                    evt.stopPropagation();
                }
                else {
                    evt.cancelBubble = true;
                }
            }
            return continuePropagation;
        }
        function drawLinks() {
            panel.empty();
            var interval = getInterval();
            var np = numPages();
            var getClickHandler = function(page_id) {
                return function(evt) { return pageSelected(page_id, evt); }
            }
            var appendItem = function(page_id, appendopts) {
                page_id = page_id < 0 ? 0 : (page_id < np ? page_id : np - 1);
                appendopts = jQuery.extend({ text: page_id + 1, classes: "current" }, appendopts || {});
                if (page_id == current_page) {
                    var lnk = $("<span class='current'>" + (appendopts.text) + "</span>");
                }
                else {
                    var lnk = $("<a>" + (appendopts.text) + "</a>")
						.bind("click", getClickHandler(page_id))
						.attr('href', opts.link_to.replace(/__id__/, page_id));
                }
                if (appendopts.classes) { lnk.removeAttr('class'); lnk.addClass(appendopts.classes); }
                panel.append(lnk);
            }
            if (opts.prev_text && (current_page > 0 || opts.prev_show_always)) {
                appendItem(current_page - 1, { text: opts.prev_text, classes: "disabled prev" });
            }
            if (interval[0] > 0 && opts.num_edge_entries > 0) {
                var end = Math.min(opts.num_edge_entries, interval[0]);
                for (var i = 0; i < end; i++) {
                    appendItem(i);
                }
                if (opts.num_edge_entries < interval[0] && opts.ellipse_text) {
                    jQuery("<span>" + opts.ellipse_text + "</span>").appendTo(panel);
                }
            }
            for (var i = interval[0]; i < interval[1]; i++) {
                appendItem(i);
            }
            if (interval[1] < np && opts.num_edge_entries > 0) {
                if (np - opts.num_edge_entries > interval[1] && opts.ellipse_text) {
                    jQuery("<span>" + opts.ellipse_text + "</span>").appendTo(panel);
                }
                var begin = Math.max(np - opts.num_edge_entries, interval[1]);
                for (var i = begin; i < np; i++) {
                    appendItem(i);
                }

            }
            if (opts.next_text && (current_page < np - 1 || opts.next_show_always)) {
                appendItem(current_page + 1, { text: opts.next_text, classes: "disabled next" });
            }
        }

        var current_page = opts.current_page;//当前页数
        maxentries = (!maxentries || maxentries < 0) ? 1 : maxentries;
        opts.items_per_page = (!opts.items_per_page || opts.items_per_page < 0) ? 1 : opts.items_per_page;
        var panel = jQuery(this);
        this.selectPage = function(page_id) { pageSelected(page_id); }
        this.prevPage = function() {
            if (current_page > 0) {
                pageSelected(current_page - 1);
                return true;
            }
            else {
                return false;
            }
        }
        this.nextPage = function() {
            if (current_page < numPages() - 1) {
                pageSelected(current_page + 1);
                return true;
            }
            else {
                return false;
            }
        }
        drawLinks();
    });
}
})(jQuery);
(function($) {
	$.ligerDefaults = $.ligerDefaults || {};
	$.ligerDefaults.Tip = {
		content : null,
		callback : null,
		width : 150,
		height : null,
		distanceX : 7,
		distanceY : 0,
		appendIdTo : null, //保存ID到那一个对象(jQuery)
		msgtitle : null
	};
	$.fn.ligerTip = function(p) {
		p = $.extend({}, $.ligerDefaults.Tip, p || {});
		this.each(function() {
			var tip = null;
			var tipid = $(this).attr("ligerTipId");
			if (tipid) {
				tip = $("#" + tipid);
				if (p.content == "")
					tip.remove();
				else
					$(".l-verify-tip-content", tip).html(p.content);
			} else if (p.content) {
				tip = $('<div class="l-verify-tip"><div class="l-verify-tip-corner"></div><div class="l-verify-tip-content">' + p.content + '</div></div>');
				tip.attr("id", "ligerUI" + new Date().getTime());
				//tip.fadeTo(0, 0.85); //对象的透明度
				//tip.appendTo('body');
				$(this).after(tip);
			}
			if (!tip)
				return;
			//方法一：tip.css({ left: $(this).offset().left + $(this).width() + p.distanceX, top: $(this).offset().top + p.distanceY }).show();
			tip.css({
				left : $(this).position().left + $(this).width() + p.distanceX,
				top : $(this).position().top + p.distanceY
			}).show();
			//方法三：$(this).parent().css('position','relative');
			//方法三：tip.css({ left: $(this).outerWidth(true) + p.distanceX, top: p.distanceY }).show();

			$(this).attr("ligerTipId", tip.attr("id"));
			p.width && $("> .l-verify-tip-content", tip).width(p.width - 8);
			p.height && $("> .l-verify-tip-content", tip).width(p.height);
			p.appendIdTo && p.appendIdTo.attr("ligerTipId", tip.attr("id"));
			p.callback && p.callback(tip);
		});
		if (this.length == 0)
			return null;
		if (this.length == 1)
			return this[0].ligerTip;
		var tips = [];
		this.each(function() {
			tips.push(this.ligerTip);
		});
		return tips;
	};
	$.fn.ligerHideTip = function(p) {
		return this.each(function() {
			var tipid = $(this).attr("ligerTipId");
			if (tipid) {
				$("#" + tipid).remove();
				$("[ligerTipId=" + tipid + "]").removeAttr("ligerTipId");
			}
		});
	};
	$.fn.jsprint = function(p) {
		p = $.extend({}, $.ligerDefaults.Tip, p || {});
		var str = "<div id=\"msgprint\" class=\"pcent warning\">" + p.msgtitle + "</div>";
		$("body").append(str);
		$("#msgprint").show();
		setTimeout(function() {
			$("#msgprint").fadeOut(500);
			if (!$("#msgprint").is(":animated")) {
				$("#msgprint").remove();
			}
		}, 3000);
	}
})(jQuery);
(function($) {
	$.ligerDefaults = $.ligerDefaults || {};
	$.ligerDefaults.Dialog = {
		cls : null, //给dialog附加css class
		id : null, //给dialog附加id
		buttons : null, //按钮集合
		isDrag : true, //是否拖动
		width : 280, //宽度
		height : null, //高度，默认自适应
		content : '', //内容
		target : null, //目标对象，指定它将以appendTo()的方式载入
		url : null, //目标页url，默认以iframe的方式载入
		load : false, //是否以load()的方式加载目标页的内容
		type : 'warn', //类型 warn、success、error、question
		left : null, //位置left
		top : null, //位置top
		modal : true, //是否模态对话框
		name : null, //创建iframe时 作为iframe的name和id
		isResize : false, // 是否调整大小
		allowClose : true, //允许关闭
		opener : null,
		timeParmName : null //是否给URL后面加上值为new Date().getTime()的参数，如果需要指定一个参数名即可
	};
	$.ligerDefaults.DialogString = {
		titleMessage : '提示信息', //提示文本标题
		waittingMessage : '正在等待中,请稍候...'
	};
	///	<param name="$" type="jQuery"></param>
	$.ligerDialog = {};
	$.ligerDialog.open = function(p) {
		p = $.extend({}, $.ligerDefaults.Dialog, $.ligerDefaults.DialogString, p || {});
		var g = {
			applyWindowMask : function() {
				$(".l-window-mask").remove();
				$("<div class='l-window-mask' style='display: block;'></div>").height($(window).height() + $(window).scrollTop()).appendTo('body');
			},
			removeWindowMask : function() {
				$(".l-window-mask").remove();
			},
			applyDrag : function() {
				if ($.fn.ligerDrag)
					g.dialog.ligerDrag({
						handler : '.l-dialog-title'
					});
			},
			applyResize : function() {
				if ($.fn.ligerResizable) {
					g.dialog.ligerResizable({
						onStopResize : function(current, e) {
							var top = 0;
							var left = 0;
							if (!isNaN(parseInt(g.dialog.css('top'))))
								top = parseInt(g.dialog.css('top'));
							if (!isNaN(parseInt(g.dialog.css('left'))))
								left = parseInt(g.dialog.css('left'));
							if (current.diffTop != undefined) {
								g.dialog.css({
									top : top + current.diffTop,
									left : left + current.diffLeft
								});
								g.dialog.body.css({
									width : current.newWidth - 26
								});
								$(".l-dialog-content", g.dialog.body).height(current.newHeight - 46 - $(".l-dialog-buttons", g.dialog).height());
							}
							return false;
						}
					});
				}
			},
			setImage : function() {
				if (p.type) {
					if (p.type == 'success' || p.type == 'donne' || p.type == 'ok') {
						$(".l-dialog-image", g.dialog).addClass("l-dialog-image-donne").show();
						$(".l-dialog-content", g.dialog).css({
							paddingLeft : 64,
							paddingBottom : 30
						});
					} else if (p.type == 'error') {
						$(".l-dialog-image", g.dialog).addClass("l-dialog-image-error").show();
						$(".l-dialog-content", g.dialog).css({
							paddingLeft : 64,
							paddingBottom : 30
						});
					} else if (p.type == 'warn') {
						$(".l-dialog-image", g.dialog).addClass("l-dialog-image-warn").show();
						$(".l-dialog-content", g.dialog).css({
							paddingLeft : 64,
							paddingBottom : 30
						});
					} else if (p.type == 'question') {
						$(".l-dialog-image", g.dialog).addClass("l-dialog-image-question").show();
						$(".l-dialog-content", g.dialog).css({
							paddingLeft : 64,
							paddingBottom : 20
						});
					}
				}
			}
		};
		g.dialog = $('<div class="l-dialog"><table class="l-dialog-table" cellpadding="0" cellspacing="0" border="0"><tbody><tr><td class="l-dialog-tl"></td><td class="l-dialog-tc"><div class="l-dialog-tc-inner"><div class="l-dialog-icon"></div><div class="l-dialog-title"></div><div class="l-dialog-winbtns" style="width: 22px;"><div class="l-dialog-winbtn l-dialog-close"></div></div></div></td><td class="l-dialog-tr"></td></tr><tr><td class="l-dialog-cl"></td><td class="l-dialog-cc"><div class="l-dialog-body"><div class="l-dialog-image"></div> <div class="l-dialog-content"></div><div class="l-dialog-buttons"><div class="l-dialog-buttons-inner"></div></td><td class="l-dialog-cr"></td></tr><tr><td class="l-dialog-bl"></td><td class="l-dialog-bc"></td><td class="l-dialog-br"></td></tr></tbody></table></div>');
		$('body').append(g.dialog);
		g.dialog.body = $(".l-dialog-body:first", g.dialog);
		g.dialog.close = function() {
			if (g.dialog.frame) {
				$(g.dialog.frame.document).ready(function() {
					g.removeWindowMask();
					g.dialog.remove();
				});
			} else {
				g.removeWindowMask();
				g.dialog.remove();
			}
		};
		g.dialog.doShow = function() {
			g.dialog.show();
		};
		if (p.allowClose == false)
			$(".l-dialog-close", g.dialog).remove();
		if (p.target || p.url || p.type == "none")
			p.type = null;
		if (p.cls)
			g.dialog.addClass(p.cls);
		if (p.id)
			g.dialog.attr("id", p.id);

		//设置锁定屏幕、拖动支持 和设置图片
		if (p.modal)
			g.applyWindowMask();
		if (p.isDrag)
			g.applyDrag();
		if (p.isResize)
			g.applyResize();
		if (p.type)
			g.setImage();
		else {
			$(".l-dialog-image", g.dialog).remove();
			$(".l-dialog-content", g.dialog.body).addClass("l-dialog-content-noimage");
		}
		//设置主体内容
		if (p.target) {
			$(".l-dialog-content", g.dialog.body).prepend(p.target);
		} else if (p.url) {
			if (p.timeParmName) {
				p.url += p.url.indexOf('?') == -1 ? "?" : "&";
				p.url += p.timeParmName + "=" + new Date().getTime();
			}
			var iframe = $("<iframe frameborder='0'></iframe>");
			var framename = p.name ? p.name : "ligerwindow" + new Date().getTime();
			iframe.attr("name", framename);
			$(".l-dialog-content", g.dialog.body).prepend(iframe);
			$(".l-dialog-content", g.dialog.body).addClass("l-dialog-content-nopadding");
			setTimeout(function() {
				iframe.attr("src", p.url);

				g.dialog.frame = window.frames[iframe.attr("name")];
			}, 0);
		} else if (p.content) {
			$(".l-dialog-content", g.dialog.body).html(p.content);
		}
		if (p.opener)
			g.dialog.opener = p.opener;
		//设置按钮
		if (p.buttons) {
			$(p.buttons).each(function(i, item) {
				var btn = "";
				if (i == 1) {
					btn = $('<div class="l-dialog-btn-no"><div class="l-dialog-btn-l"></div><div class="l-dialog-btn-r"></div><div class="l-dialog-btn-inner"></div></div>');
				} else {
					btn = $('<div class="l-dialog-btn"><div class="l-dialog-btn-l"></div><div class="l-dialog-btn-r"></div><div class="l-dialog-btn-inner"></div></div>');
				}
				$(".l-dialog-btn-inner", btn).html(item.text);
				$(".l-dialog-buttons-inner", g.dialog.body).prepend(btn);
				item.width && btn.width(item.width);
				item.onclick && btn.click(function() {
					item.onclick(item, g.dialog, i)
				});
			});
		} else {
			$(".l-dialog-buttons", g.dialog).remove();
		}
		$(".l-dialog-buttons-inner", g.dialog).append("<div class='l-clear'></div>");

		//设置参数属性
		p.width && g.dialog.body.width(p.width - 26);
		if (p.height) {
			$(".l-dialog-content", g.dialog.body).height(p.height - 46 - $(".l-dialog-buttons", g.dialog).height());
		}
		p.title = p.title || p.titleMessage;
		p.title && $(".l-dialog-title", g.dialog).html(p.title);
		$(".l-dialog-title", g.dialog).bind("selectstart", function() {
			return false;
		});

		//设置事件
		$(".l-dialog-btn", g.dialog.body).hover(function() {
			$(this).addClass("l-dialog-btn-over");
		}, function() {
			$(this).removeClass("l-dialog-btn-over");
		});
		$(".l-dialog-tc .l-dialog-close", g.dialog).hover(function() {
			$(this).addClass("l-dialog-close-over");
		}, function() {
			$(this).removeClass("l-dialog-close-over");
		}).click(function() {
			g.dialog.close();
		});

		//IE6 PNG Fix
		var ie55 = (navigator.appName == "Microsoft Internet Explorer" && parseInt(navigator.appVersion) == 4 && navigator.appVersion.indexOf("MSIE 5.5") != -1);
		var ie6 = (navigator.appName == "Microsoft Internet Explorer" && parseInt(navigator.appVersion) == 4 && navigator.appVersion.indexOf("MSIE 6.0") != -1);
		if ($.browser.msie && (ie55 || ie6)) {
			$(".l-dialog-tl:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "dialog-tl.png',sizingMethod='crop');"
			});
			$(".l-dialog-tc:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "ie6/dialog-tc.png',sizingMethod='crop');"
			});
			$(".l-dialog-tr:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "dialog-tr.png',sizingMethod='crop');"
			});
			$(".l-dialog-cl:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "ie6/dialog-cl.png',sizingMethod='crop');"
			});
			$(".l-dialog-cr:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "ie6/dialog-cr.png',sizingMethod='crop');"
			});
			$(".l-dialog-bl:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "dialog-bl.png',sizingMethod='crop');"
			});
			$(".l-dialog-bc:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "ie6/dialog-bc.png',sizingMethod='crop');"
			});
			$(".l-dialog-br:first", g.dialog).css({
				"background" : "none",
				"filter" : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + ligerDialogImagePath + "dialog-br.png',sizingMethod='crop');"
			});
		}
		//位置初始化
		var left = 0;
		var top = 0;
		var width = p.width || g.dialog.width();
		if (p.left != null)
			left = p.left;
		else
			left = 0.5 * ($(window).width() - width);
		if (p.top != null)
			top = p.top;
		else
			top = 0.5 * ($(window).height() - g.dialog.height()) + $(window).scrollTop() - 10;

		g.dialog.css({
			left : left,
			top : top
		});
		g.dialog.doShow();
		return g.dialog;
	};
	$.ligerDialog.close = function() {
		$(".l-dialog,.l-window-mask").remove();
	};
	$.ligerDialog.alert = function(content, title, type, callback) {
		content = content || "";
		if ( typeof (title) == "function") {
			callback = title;
			type = null;
		} else if ( typeof (type) == "function") {
			callback = type;
		}
		var btnclick = function(item, Dialog, index) {
			Dialog.close();
			if (callback)
				callback(item, Dialog, index);
		};
		p = {
			content : content,
			buttons : [{
				text : '确定',
				onclick : btnclick
			}]
		};
		if ( typeof (title) == "string" && title != "")
			p.title = title;
		if ( typeof (type) == "string" && type != "")
			p.type = type;
		$.ligerDialog.open(p);
	};

	$.ligerDialog.confirm = function(content, title, callback) {
		if ( typeof (title) == "function") {
			callback = title;
			type = null;
		}
		var btnclick = function(item, Dialog) {
			Dialog.close();
			if (callback) {
				callback(item.type == 'ok');
			}
		};
		p = {
			type : 'question',
			content : content,
			buttons : [{
				text : '确定',
				onclick : btnclick,
				type : 'ok'
			}, {
				text : '取消',
				onclick : btnclick,
				type : 'no'
			}]
		};
		if ( typeof (title) == "string" && title != "")
			p.title = title;
		$.ligerDialog.open(p);
	};
	$.ligerDialog.warning = function(content, title, callback) {
		if ( typeof (title) == "function") {
			callback = title;
			type = null;
		}
		var btnclick = function(item, Dialog) {
			Dialog.close();
			if (callback) {
				callback(item.type);
			}
		};
		p = {
			type : 'question',
			content : content,
			buttons : [{
				text : '是',
				onclick : btnclick,
				type : 'yes'
			}, {
				text : '否',
				onclick : btnclick,
				type : 'no'
			}, {
				text : '取消',
				onclick : btnclick,
				type : 'cancel'
			}]
		};
		if ( typeof (title) == "string" && title != "")
			p.title = title;
		$.ligerDialog.open(p);
	};
	$.ligerDialog.waitting = function(title) {
		title = title || $.ligerDefaults.Dialog.waittingMessage;
		$.ligerDialog.open({
			cls : 'l-dialog-waittingdialog',
			type : 'none',
			content : '<div style="padding:4px">' + title + '</div>',
			allowClose : false
		});
	};
	$.ligerDialog.closeWaitting = function() {
		$(".l-dialog-waittingdialog,.l-window-mask").remove();
	};
	$.ligerDialog.success = function(content, title, onBtnClick) {
		$.ligerDialog.alert(content, title, 'success', onBtnClick);
	};
	$.ligerDialog.error = function(content, title, onBtnClick) {
		$.ligerDialog.alert(content, title, 'error', onBtnClick);
	};
	$.ligerDialog.warn = function(content, title, onBtnClick) {
		$.ligerDialog.alert(content, title, 'warn', onBtnClick);
	};
	$.ligerDialog.question = function(content, title) {
		$.ligerDialog.alert(content, title, 'question');
	};

	$.ligerDialog.prompt = function(title, value, multi, callback) {
		var target = $('<input type="text" class="l-dialog-inputtext"/>');
		if ( typeof (multi) == "function") {
			callback = multi;
		}
		if ( typeof (value) == "function") {
			callback = value;
		} else if ( typeof (value) == "boolean") {
			multi = value;
		}
		if ( typeof (multi) == "boolean" && multi) {
			target = $('<textarea class="l-dialog-textarea"></textarea>');
		}
		if ( typeof (value) == "string" || typeof (value) == "int") {
			target.val(value);
		}
		var btnclick = function(item, Dialog, index) {
			Dialog.close();
			if (callback) {
				callback(item.type == 'yes', target.val());
			}
		}
		p = {
			title : title,
			target : target,
			width : 320,
			buttons : [{
				text : '确定',
				onclick : btnclick,
				type : 'yes'
			}, {
				text : '取消',
				onclick : btnclick,
				type : 'cancel'
			}]
		};
		$.ligerDialog.open(p);
	};

})(jQuery);
//弹出窗口
// 身份证号码验证
jQuery.validator.addMethod("idcardno", function(value, element) {
	return this.optional(element) || isIdCardNo(value);
}, "请正确输入身份证号码");
//字母数字
jQuery.validator.addMethod("alnum", function(value, element) {
	return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
}, "只能包括英文字母和数字");
// 手机号码验证
jQuery.validator.addMethod("cellphone", function(value, element) {
	var length = value.length;
	return this.optional(element) || (length == 11 && /^(1\d{10})$/.test(value));
}, "请正确填写手机号码");
// 电话号码验证
jQuery.validator.addMethod("telephone", function(value, element) {
	var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
	return this.optional(element) || (tel.test(value));
}, "请正确填写电话号码");
// 邮政编码验证
jQuery.validator.addMethod("zipcode", function(value, element) {
	var tel = /^[0-9]{6}$/;
	return this.optional(element) || (tel.test(value));
}, "请正确填写邮政编码");
// 汉字
jQuery.validator.addMethod("chcharacter", function(value, element) {
	var tel = /^[\u4e00-\u9fa5]+$/;
	return this.optional(element) || (tel.test(value));
}, "请输入汉字");

/**
 * 身份证号码验证
 *
 */
function isIdCardNo(num) {
	var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
	var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
	var varArray = new Array();
	var intValue;
	var lngProduct = 0;
	var intCheckDigit;
	var intStrLen = num.length;
	var idNumber = num;
	// initialize
	if ((intStrLen != 15) && (intStrLen != 18)) {
		return false;
	}
	// check and set value
	for ( i = 0; i < intStrLen; i++) {
		varArray[i] = idNumber.charAt(i);
		if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
			return false;
		} else if (i < 17) {
			varArray[i] = varArray[i] * factorArr[i];
		}
	}

	if (intStrLen == 18) {
		//check date
		var date8 = idNumber.substring(6, 14);
		if (isDate8(date8) == false) {
			return false;
		}
		// calculate the sum of the products
		for ( i = 0; i < 17; i++) {
			lngProduct = lngProduct + varArray[i];
		}
		// calculate the check digit
		intCheckDigit = parityBit[lngProduct % 11];
		// check last digit
		if (varArray[17] != intCheckDigit) {
			return false;
		}
	} else {//length is 15
		//check date
		var date6 = idNumber.substring(6, 12);
		if (isDate6(date6) == false) {
			return false;
		}
	}
	return true;

}

//全选取消按钮函数，调用样式如：
function checkAll(chkobj) {
	if ($(chkobj).find("span b").text() == "全选") {
		$(chkobj).find("span b").text("取消");
		$("input.checkall").attr("checked", true);
	} else {
		$(chkobj).find("span b").text("全选");
		$("input.checkall").attr("checked", false);
	}
}

function alerts(title, content) {
	switch(title) {
		case "success":
			$.ligerDialog.success(content == null ? "提交成功!" : content);
			break;
		case "warn":
			$.ligerDialog.warn(content == null ? "有错误信息!" : content);
			break;
		case "question":
			$.ligerDialog.question(content == null ? "有问题存在!" : content);
			break;
		case "error":
			$.ligerDialog.error(content == null ? "提交失败!" : content);
			break; defalt:
			break;
	}
}

function confirmbox(content, doPostBack) {
	if ($(".checkall input:checked").size() < 1) {
		alters("warn", "对不起，请选中您要操作的记录！");
		return false;
	}
	$.ligerDialog.confirm(content, function(yes) {
		if (yes) {
			//doPostBack;
		}
		return false;
	})
}

function confirms(content, doPostBack) {
	$.ligerDialog.confirm(content, function(p) {
		if (p) {
			location = doPostBack;
		}
	})
}

//(function($){
//	$.Defaults = $.Defaults || {};
//	$.Defaults.at = {
//		type:null,
//		content : null,
//		callback : null,
//		title : "成功"
//	};
//	alters=function(p){
//		p = $.extend({}, $.Defaults.at, p || {});
//		switch(p.title){
//		case "成功":
//		$.ligerDialog.success(p.content);
//		break;
//		case "warn":
//		$.ligerDialog.warn(p.content);
//		break;
//		case "question":
//		$.ligerDialog.question(p.content);
//		break;
//		case "失败":
//		$.ligerDialog.error(p.content);
//		break;
//		defalt:
//		break;
//		}
//	}
//	confirms=function(p){
//		p = $.extend({}, $.Defaults.at, p || {});
//	if ($(".checkall input:checked").size() < 1) {
//		alters("成功","对不起，请选中您要操作的记录！");
//		return false;
//	}
//	$.ligerDialog.confirm(content, function(yes) {
//		if(yes){
//			window.href="www.baidu.com";
//		}
//		return false;
//
//	}
//	}
//}
//})(jQuery);
