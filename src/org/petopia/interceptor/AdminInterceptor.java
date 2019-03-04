package org.petopia.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> session = invocation.getInvocationContext().getSession();
		String id = (String) session.get("loginID");
		System.out.println("지금 로그인:"+id);
		if(!id.equals("admin"))
		{
			return "admin";
		}
		return invocation.invoke();
	}

}
