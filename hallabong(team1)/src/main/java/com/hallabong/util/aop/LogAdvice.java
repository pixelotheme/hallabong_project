package com.hallabong.util.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	@Before("execution(* com.hallabong..service.*.*(..))")
	public void logBefore() {
		log.info("===============================================");
	}
	
	@Around("execution(* com.hallabong..service.*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		// 리턴 변수
		Object result = null;
		
		// 실행 시작 시간
		long start = System.nanoTime();
		
		// 넘어가는 데이터나 클레스 정보 출력
		log.info("Target : " + pjp.getTarget());
		log.info("Param : " + Arrays.toString(pjp.getArgs()));
		
		// 처리 실행
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		// 실행 결과
		log.info("result : " + result);
		
		// 실행 끝나는 시간
		long end = System.nanoTime();
		
		// 처리 시간 정보
		log.info("TIME : " + (end - start));
		
		return result;
	}
}
