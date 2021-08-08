package com.blog.main.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
public class MyConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public UserDetailsService getDetailsService(){
		return new UserDetailServiceImpl();
	}
	
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	// We use data base authentication so useing daoAuthentication provider
	@Bean 
	public DaoAuthenticationProvider geAuthenticationProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(getDetailsService());
		
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		log.info("password encode :: "+ authenticationProvider);
		return authenticationProvider;
	}
	
	/// configure method
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(geAuthenticationProvider());
		//auth.inMemoryAuthentication().passwordEncoder(passwordEncoder()).withUser("user").password(passwordEncoder().encode("123456")).roles("USER");
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN")
								.antMatchers("/user/**").hasRole("USER")
								.antMatchers("/**").permitAll()
								.and()
								.formLogin().loginPage("/login")
								.loginProcessingUrl("/dologin")
								.defaultSuccessUrl("/user/dashboard")
								.and()
								.csrf().disable();
	}
	
	
}
