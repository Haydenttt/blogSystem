package com.unicom.exception;

/**
 * @program: BlogSystem
 * @description: 异常类
 * @author: Hayden TONG
 * @create: 2019-05-27 09:05
 **/

public class BlogException extends RuntimeException implements CommonError{
    private CommonError commonError;

    public BlogException(CommonError commonError) {
        super();
        this.commonError = commonError;
    }

    public BlogException(CommonError commonError, String errMsg) {
        super();
        this.commonError = commonError;
        this.commonError.setErrMsg(errMsg);
    }

    @Override
    public int getErrCode() {
        return this.commonError.getErrCode();
    }

    @Override
    public String getErrMsg() {
        return this.commonError.getErrMsg();
    }

    @Override
    public CommonError setErrMsg(String errMsg) {
        this.commonError.setErrMsg(errMsg);
        return this;
    }
}
