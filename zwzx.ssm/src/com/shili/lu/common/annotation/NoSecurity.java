/**
 * 
 */
package com.shili.lu.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 
 * 配置此注解表示不需要要进行安全过滤
 * @author zhangxujun
 * 
 *
 */
@Target({ElementType.METHOD})
@Retention(value = RetentionPolicy.RUNTIME)
public @interface NoSecurity {

}
