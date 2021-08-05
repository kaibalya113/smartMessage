package com.blog.main.utils;

import java.util.List;

import com.blog.main.model.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response {
	String msg;
    List<User> result;
}
