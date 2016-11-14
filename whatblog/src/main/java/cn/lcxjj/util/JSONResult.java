package cn.lcxjj.util;

/**
 * 封装返回数据的类型
 * @author TrueLE
 *
 * @param <T>
 */
public class JSONResult<T> {
	private String errCode;
	private T data ;
	private String msg;
	
	public JSONResult(String errCode,String msg){
		this.errCode = errCode;
		this.msg = msg;
	}
	
	public JSONResult(String errCode,T data,String msg){
		this.errCode = errCode;
		this.data = data;
		this.msg = msg;
	}
	
	
	
	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

	
}
