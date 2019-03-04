package org.petopia.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> session = invocation.getInvocationContext().getSession();
		String loginID = (String)session.get("loginID");
		System.out.println(loginID);
		if(loginID == null)
		{
			session.put("notMember", "notMember");
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
