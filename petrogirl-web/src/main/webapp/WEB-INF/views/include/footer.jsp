<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<div class="pg-footer">
        <div class="mail"><i class="mail-icon"></i>E-mail: <span class="text-theme">info@petrogirl.com</span></div>
        <div class="tel"><i class="tel-icon"></i>Phone: <span class="text-theme">+971 10501859999</span>
        	<span style="float:right">
        		<select name="countries" id="countries" style="width:160px;" onchange="selectLang()">
			      <option value='en' <c:if test="${language=='en' }">selected="selected"</c:if> data-image="${ctxStatic}/assets/images/en_60.png" data-imagecss="flag en" data-title="English">English</option>
			      <option value='zh' <c:if test="${language=='zh' }">selected="selected"</c:if> data-image="${ctxStatic}/assets/images/cn_60.png" data-imagecss="flag cn" data-title="简体中文">简体中文</option>
			    </select>
        	</span>
        </div>
	    
	    
	    
	    <script>
		$(document).ready(function(e) {
		    $("#countries").msDropdown(); //image can have css class; Please check source code.
		});
		</script>     
	</div>
	<div class="copyright">
        Copyright &copy; 2016 Petrleum Girl
    </div>