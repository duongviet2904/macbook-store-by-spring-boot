package com.devpro.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;

@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter{

	@Autowired private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // thực hiện xác thực request ngưười dùng gửi lên.
			
			// không thực hiện xác thực đối với các url này.
            .antMatchers("/css/**", "/js/**", "/images/**", "/summernote/**", "/file/upload/**").permitAll()
            
            // thực hiện xác thực với các url kiểu ..../admin/....
//            .antMatchers("/admin/**").hasAnyAuthority("ADMIN")
//            .antMatchers("/user/**").hasAnyAuthority("GUEST", "ADMIN")
            .antMatchers("/admin/**").authenticated()
            
            .and() // kết hợp với điều kiện.

            .exceptionHandling().accessDeniedHandler(new CustomAccessDeniedHandler())
			.and()
            
            // khi click vào button logout thì không cần login.
            // khi click vào button này thì dữ liệu user trên session sẽ bị xoá.
            .logout()
            .logoutUrl("/logout")
            .logoutSuccessUrl("/login")
            .invalidateHttpSession(true) // xoá hết dữ liệu trên seesion
            .deleteCookies("JSESSIONID") // xoá hết dữ liệu trên cokies.
            .permitAll()
            
            .and() // kết hợp với điều kiện.
            
            .formLogin() // thực hiện xác thực qua form(username và password)
            .loginPage("/login") // trang login do mình thiết kế, trỏ vào request-mapping trong controller.
            .loginProcessingUrl("/action-form-login") // link action for form post.
//            .defaultSuccessUrl("/admin", true) // when user success authenticated then go to this url.
//            .defaultSuccessUrl("/", true) // when user success authenticated then go to this url.
            .successHandler(new CustomSuccessHandler())
            
            .failureUrl("/login?page_error=true") // nhập username, password sai thì redirect về trang nào.
            .permitAll();
	}
	
	@Bean public PasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		return encoder;
    }
	
	@Autowired public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
}
