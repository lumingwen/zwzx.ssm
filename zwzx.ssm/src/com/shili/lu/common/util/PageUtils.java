/**
 * 
 */
package com.shili.lu.common.util;

import com.github.miemiedev.mybatis.paginator.domain.Paginator;

/**
 * 分页工具类
 * @author zhangxujun
 * 
 *
 */
public class PageUtils {
    
    
    /**
     * 构造分页字符串
     * 
     * @param page 分页参数
     * 
     */
    public static String buildPageStr(Paginator page){
	StringBuffer sb = new StringBuffer();
	if (page != null){
	    sb.append("<script type=\"text/javascript\" src=\"../js/jquery-1.8.3.js\"></script>");
	    sb.append("<script type=\"text/javascript\" src=\"../js/page.js\"></script>");
    	    sb.append("<input type=\"hidden\" name=\"page\" value=\"").append(page.getPage()).append("\"/>");
    	    sb.append("<input type=\"hidden\" name=\"limit\" value=\"").append(page.getLimit()).append("\"/>");
	    sb.append("<div id=\"bottomPager\" class=\"pagers\"  style=\"display: block;\">");
	    sb.append("<div id=\"go\">");
	    
	    sb.append("<input type=\"text\" maxlength=\"5\" class=\"small pagesm\" id=\"goPage\" value=\"\"  onkeyup=\"this.value=this.value.replace(/\\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\\D/g,'')\" />");
	    sb.append("<input type=\"button\" class=\"pg_bt\"  value=\"go\" onclick=\"search($('#goPage').val())\" />");
	    sb.append("</div><div class=\"pager\"></div>");
	    
	    sb.append("</div>");
	    sb.append("<script type=\"text/javascript\" charset=\"utf-8\">");
	    sb.append("$(\".pager\").pagination("+page.getTotalCount()+",{current_page:"+(page.getPage()-1)+",items_per_page:"+page.getLimit()+",callback:function(page_index,jq){search(page_index+1);}});");
	    sb.append("</script>");
	    
//        	sb.append(" 共<span>").append(page.getTotalCount()).append("</span>条记录");
//        	sb.append(" 当前第<span>").append(page.getPage()).append("</span>页");
//        	sb.append(" 共<span>").append(page.getTotalPages()).append("</span>页");
//        	sb.append("<div class=\"content-right-pageturn\">");
//        	sb.append("<button class=\"iconfont\" onclick=\"search(").append(1).append(")\">&lt;&lt;</button>");
//        	sb.append("<button class=\"iconfont\" onclick=\"search(").append(page.isHasPrePage()?page.getPrePage():page.getPage()).append(")\">&lt;</button>");
//        	sb.append("<div class=\"content-right-pageturn\">");
//        	sb.append("<ul>");
//        	int start = page.getPage();
//        	int end = start+5;
//        	int max = page.getTotalPages();
//        	for (int i=start;i<end;i++){
//        	    if (i<=max){
//        		sb.append("<li onclick=\"search(").append(i).append(")\">");
//        		sb.append(i);
//        		sb.append("</li>");
//        	    }
//        	}
//        	sb.append("</ul>");
//        	sb.append("<button class=\"iconfont\" onclick=\"search(").append(page.isHasNextPage()?page.getNextPage():page.getPage()).append(")\">&gt;</button>");
//        	sb.append("<button class=\"iconfont\" onclick=\"search(").append(page.getTotalPages()).append(")\">&gt;&gt;</button>");
//        	sb.append(" </div>");
//        	sb.append("<input type=\"hidden\" name=\"page\" value=\"").append(page.getPage()).append("\"/>");
//        	sb.append("<input type=\"hidden\" name=\"limit\" value=\"").append(page.getLimit()).append("\"/>");
	}
	return sb.toString();
    }

}
