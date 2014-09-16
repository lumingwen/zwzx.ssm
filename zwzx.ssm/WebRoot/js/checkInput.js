/**
 * Created by zengy_000 on 14-5-8.
 */
// 返回确定按钮

function pub(rule, obj, str) {
	var mark = rule.test(obj.val());
	var res;
	if (mark) {
		obj.css({
			border : "1px solid #d4d4d4"
		}).next().css({
			display : "none"
		});
		res = true;
	} else {
		obj.css({
			border : "1px solid red"
		}).next().text(str).css({
			display : "inline-block"
		});
		res = false;
	}	
	return res;
}
// 判断非空
function notNull(obj, str) {
	//alert(obj);
	return pub(/\S+/, obj, str);
}
// 判断QQ号
function qq(obj, str) {
	return pub(/^[1-9][0-9]{4,9}$/, obj, str);
}
// 判断电子邮箱
function email(obj, str) {
	return pub(/\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/,
			obj, str);
}
// 判断手机号码
function phone(obj, str) {
	return pub(/0?(13|14|15|18)[0-9]{9}/, obj, str);

}
