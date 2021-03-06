package com.unicom.exception;

/**
 * @program: BlogSystem
 * @description: 异常类
 * @author: Hayden TONG
 * @create: 2019-05-27 09:05
 **/

public enum EmBlogError implements CommonError {
    //通用错误类型
    PARAMETER_VALIDATION_ERROR(400001,"参数不合法"),
    UNKNOW_ERROR(410002,"未知错误"),
    RECORDER_NOT_EXIST(500000,"记录不存在"),
    AUTH_ERROR(100000,"鉴权错误")
    ;

    private int errCode;
    private String errMsg;

    private EmBlogError(int errCode, String errMsg){
        this.errCode=errCode;
        this.errMsg=errMsg;
    }

    @Override
    public int getErrCode() {
        return this.errCode;
    }

    @Override
    public String getErrMsg() {
        return this.errMsg;
    }

    @Override
    public CommonError setErrMsg(String errMsg) {
        this.errMsg=errMsg;
        return this;
    }
}
