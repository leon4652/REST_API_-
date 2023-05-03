package com.enjoy.trip.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = { "com.enjoy.trip.**.mapper" })
public class WebMvcConfiguration {

}
