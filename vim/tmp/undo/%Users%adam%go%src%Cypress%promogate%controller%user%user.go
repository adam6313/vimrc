Vim�UnDo� ��q��+��Z8 ߎ��|C �{�U���&��   _                                   [��    _�                             ����                                                                                                                                                                                                                                                                                                                                                v       [��    �               _   package user       import (   	"Cypress/promogate/controller"   #	"Cypress/promogate/module/errcode"    	"Cypress/promogate/module/user"   	"Cypress/promogate/structs"   	"fmt"   	"net/http"       	"github.com/labstack/echo"   )       //Login 客服登入   "func Login(c echo.Context) error {       	v, _ := c.FormParams()       "	data := new(structs.LoginRequest)    	//將request資料bind到struct   %	if err := c.Bind(data); err != nil {   Q		msg := controller.GenErrMsg("2001", fmt.Sprintf("%v %v", "Binding Error", err))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   7		return c.JSON(http.StatusOK, errcode.CQ9.Output("5"))   	}       	//驗證必要參數   )	if err := c.Validate(data); err != nil {   =		msg := controller.GenErrMsg("1003", fmt.Sprintf("%v", err))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   7		return c.JSON(http.StatusOK, errcode.CQ9.Output("5"))   	}       	out, err := user.AdminLogin(v)   0	if err != nil || out == (structs.TokenResp{}) {   =		msg := controller.GenErrMsg("1100", fmt.Sprintf("%v", err))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   9		return c.JSON(http.StatusOK, errcode.CQ9.Output("110"))   	}       	//若沒成功 則回傳狀態   	if out.Status.Code != "0" {   *		fmt.Printf("msg=%v  data=%v \n", out, v)   %		if out.Status.Code == "1006:user" {   9			return c.JSON(http.StatusOK, errcode.CQ9.Output("14"))   		}   F		return c.JSON(http.StatusOK, errcode.CQ9.MapOutput(out.Status.Code))   	}       D	if out.Data.Type != structs.IsOP || out.Data.Role != structs.IsCS {   }		msg := controller.GenErrMsg("1000", fmt.Sprintf("Auth invalid , type is %v and role is %v ", out.Data.Type, out.Data.Role))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   7		return c.JSON(http.StatusOK, errcode.CQ9.Output("4"))   	}       H	msg := controller.GenResMsg(map[string]string{"token": out.Data.Token})   "	return c.JSON(http.StatusOK, msg)   }       //SSList 代理列表   #func SSList(c echo.Context) error {       	v, _ := c.FormParams()       #	data := new(structs.SSListRequest)    	//將request資料bind到struct   %	if err := c.Bind(data); err != nil {   Q		msg := controller.GenErrMsg("2001", fmt.Sprintf("%v %v", "Binding Error", err))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   7		return c.JSON(http.StatusOK, errcode.CQ9.Output("5"))   	}       	//驗證必要參數   )	if err := c.Validate(data); err != nil {   =		msg := controller.GenErrMsg("1003", fmt.Sprintf("%v", err))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   7		return c.JSON(http.StatusOK, errcode.CQ9.Output("5"))   	}       	out, err := user.SSList(data)   )	if err != nil || out.Status.Code == "" {   =		msg := controller.GenErrMsg("1100", fmt.Sprintf("%v", err))   *		fmt.Printf("msg=%v  data=%v \n", msg, v)   9		return c.JSON(http.StatusOK, errcode.CQ9.Output("110"))   	}       	//若沒成功 則回傳狀態   	if out.Status.Code != "0" {   *		fmt.Printf("msg=%v  data=%v \n", out, v)   F		return c.JSON(http.StatusOK, errcode.CQ9.MapOutput(out.Status.Code))   	}       &	msg := controller.GenResMsg(out.Data)   "	return c.JSON(http.StatusOK, msg)   }5��