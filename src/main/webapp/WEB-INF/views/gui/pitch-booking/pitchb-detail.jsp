<%@page import="entities.PitchDetail"%>
<%@page import="entities.Cost"%>
<%@page import="dto.PitchInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="taglib_custom" prefix="tagfunc" %> 


<style>
    .ui-autocomplete {
        z-index: 9999;
    }

    #ticket-select-date table tr th {
        text-transform: capitalize;
    }
</style>
<script type="text/javascript">
    // Used for angularjs
    moment.locale('zh-cn');
    var stadiumModel = {"StadiumId":1263,"Name":"Hệ Thống Sân Bóng Cỏ Nhân Tạo Nhân Việt HighSchool","LogicalName":"/he-thong-san-bong-co-nhan-tao-nhan-viet-highschool-266126311.html","NagivateUrl":"/he-thong-san-bong-co-nhan-tao-nhan-viet-highschool-266126311.html","MainPhoto":"https://res.givator.com/pictures/11017/500/2017_12/original/mocsanbongnhanviet.png","Photos":null,"Address":"Quận Tân Phú, Hồ Chí Minh","Street":"318 Trịnh Đình Trọng, Hòa Thạnh, Tân Phú","Latitute":10.7779868,"Longitude":106.6373224,"Summary":"- Hệ Thống Sân Bóng Đá Cỏ Nhân Tạo Trường THPT Nhân Việt<br>- Giám Đốc Điều Hành: Vũ Lương Thành Dương - Phone: 0978 311 935<br>- Diện Tích: 2800m2 - 3 sân 5 + kết hợp 1 sân 7 - Bề mặt cỏ nhân tạo NGF16 và đèn pha cao áp theo tiêu chuẩn thể thao chuyên nghiệp,<br>- Địa Chỉ: 318 Trịnh Đình Trọng, Hòa Thạnh, Tân Phú","About":"<p>Hãy đến với chúng tôi - sân bóng cỏ nhân tạo Nhân Việt Highschool: Với 3 sân 5 + Kết Hợp 1 Sân 7 - Cỏ Nhân Tạo Tiêu Chuẩn</p><p>+ Điểm Hẹn Của Tình Bằng Hữu.</p><p>+ Nơi Trải Nghiệm Không Khí Thể Thao Chuyên Nghiệp.</p><p>+ Dịch Vụ Vượt Trội - Phục Vụ Tận Tâm.</p><p>+ Ưu Đãi Sốc Linh Hoạt Cho Mọi Khách Hàng.</p><p>Đ/c: 318 Trịnh Đình Trọng, Hòa Thạnh, Tân Phú&nbsp;</p><p>Hotline: 01234 79 50 50 - 0961 811 577</p><p>-&gt; Xin Chân Thành Cảm Ơn!</p>","Facebook":"https://www.facebook.com/sanbongnhanviet/","EmailAddress":"sanbongnhanviet@gmail.com","Website":"http://sanbongda.vn/","PriceSummaries":[{"Prices":[{"FormatedPrice":"160.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 5 người","DisplayedTimeFrames":"06:00 - 09:00 Từ thứ 2-6","NumberOfPlayers":5,"Price":160000.0,"TimeFrames":[{"Code":"T2-T6","StartHour":"06:00:00","EndHour":"09:00:00","DisplayedText":"06:00 - 09:00 Từ thứ 2-6"}]},{"FormatedPrice":"220.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 5 người","DisplayedTimeFrames":"06:00 - 09:00 Thứ 7, Chủ nhật","NumberOfPlayers":5,"Price":220000.0,"TimeFrames":[{"Code":"T7CN","StartHour":"06:00:00","EndHour":"09:00:00","DisplayedText":"06:00 - 09:00 Thứ 7, Chủ nhật"}]},{"FormatedPrice":"120.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 5 người","DisplayedTimeFrames":"09:00 - 15:00 Từ thứ 2-6","NumberOfPlayers":5,"Price":120000.0,"TimeFrames":[{"Code":"T2-T6","StartHour":"09:00:00","EndHour":"15:00:00","DisplayedText":"09:00 - 15:00 Từ thứ 2-6"}]},{"FormatedPrice":"160.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 5 người","DisplayedTimeFrames":"09:00 - 15:00 Thứ 7, Chủ nhật","NumberOfPlayers":5,"Price":160000.0,"TimeFrames":[{"Code":"T7CN","StartHour":"09:00:00","EndHour":"15:00:00","DisplayedText":"09:00 - 15:00 Thứ 7, Chủ nhật"}]}],"PriceHeadline":"Giá thuê sân 5 người","NumberOfPlayers":5,"Availability":null},{"Prices":[{"FormatedPrice":"420.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"06:00 - 09:00 Từ thứ 2-6","NumberOfPlayers":7,"Price":420000.0,"TimeFrames":[{"Code":"T2-T6","StartHour":"06:00:00","EndHour":"09:00:00","DisplayedText":"06:00 - 09:00 Từ thứ 2-6"}]},{"FormatedPrice":"500.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"06:00 - 09:00 Thứ 7, Chủ nhật","NumberOfPlayers":7,"Price":500000.0,"TimeFrames":[{"Code":"T7CN","StartHour":"06:00:00","EndHour":"09:00:00","DisplayedText":"06:00 - 09:00 Thứ 7, Chủ nhật"}]},{"FormatedPrice":"360.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"09:00 - 15:00 Từ thứ 2-6","NumberOfPlayers":7,"Price":360000.0,"TimeFrames":[{"Code":"T2-T6","StartHour":"09:00:00","EndHour":"15:00:00","DisplayedText":"09:00 - 15:00 Từ thứ 2-6"}]},{"FormatedPrice":"500.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"09:00 - 15:00 Thứ 7, Chủ nhật","NumberOfPlayers":7,"Price":500000.0,"TimeFrames":[{"Code":"T7CN","StartHour":"09:00:00","EndHour":"15:00:00","DisplayedText":"09:00 - 15:00 Thứ 7, Chủ nhật"}]},{"FormatedPrice":"500.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"15:00 - 17:00 Từ thứ 2-6","NumberOfPlayers":7,"Price":500000.0,"TimeFrames":[{"Code":"T2-T6","StartHour":"15:00:00","EndHour":"17:00:00","DisplayedText":"15:00 - 17:00 Từ thứ 2-6"}]},{"FormatedPrice":"660.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"15:00 - 17:00 Thứ 7, Chủ nhật","NumberOfPlayers":7,"Price":660000.0,"TimeFrames":[{"Code":"T7CN","StartHour":"15:00:00","EndHour":"17:00:00","DisplayedText":"15:00 - 17:00 Thứ 7, Chủ nhật"}]},{"FormatedPrice":"660.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"17:00 - 21:00 Nghỉ lễ","NumberOfPlayers":7,"Price":660000.0,"TimeFrames":[{"Code":"HOLIDAY","StartHour":"17:00:00","EndHour":"21:00:00","DisplayedText":"17:00 - 21:00 Nghỉ lễ"}]},{"FormatedPrice":"550.000<sup>vnđ</sup>","DisplayedStadiumNumber":"Sân 7 người","DisplayedTimeFrames":"21:00 - 23:30 Nghỉ lễ","NumberOfPlayers":7,"Price":550000.0,"TimeFrames":[{"Code":"HOLIDAY","StartHour":"21:00:00","EndHour":"23:30:00","DisplayedText":"21:00 - 23:30 Nghỉ lễ"}]}],"PriceHeadline":"Giá thuê sân 7 người","NumberOfPlayers":7,"Availability":null}],"Managers":[{"UserId":1236,"Name":"Vũ Lương Thành Dương","Mobiles":["01234795050"],"DisplayedText":"Vũ Lương Thành Dương - 01234795050","IsSystemUser":false}],"IsManagerUserActive":true,"SameLocationStadiums":[{"StadiumId":1250,"Name":"Sân Bóng Đá Tân Thới Hòa","LogicalName":"/san-bong-da-tan-thoi-hoa.html","NagivateUrl":"/san-bong-da-tan-thoi-hoa.html","MainPhoto":"https://res.givator.com/pictures/11017/600/2017_11/medium/2321325515134632920560542406925300748229066o.jpg","Photos":null,"Address":"Quận Tân Phú, Hồ Chí Minh","Street":"17/5 Lương Minh Nguyệt, Phường Tân Thới Hoà","Latitute":10.76087,"Longitude":106.6318,"Summary":"","About":"<p><br></p>","Facebook":"","EmailAddress":"","Website":"","PriceSummaries":null,"Managers":[{"UserId":3,"Name":"Phan Trường","Mobiles":["0988565768"],"DisplayedText":"0988565768","IsSystemUser":true}],"IsManagerUserActive":false,"SameLocationStadiums":null,"MainSlider":{"Name":null,"MediaItems":[{"FilePath":"https://res.givator.com/pictures/11017/600/2017_11/original/2321325515134632920560542406925300748229066o.jpg","FileName":"","Name":null}]},"Breadcrumb":null,"MatchFindingRequests":null,"View":"~/Views/Blocks/Sport/FrontEnd/Stadium/_StadiumDetails.cshtml","BlockId":0,"CurrencySymbolFormat":"{0:N0}₫","ViewData":{},"Pager":{"PageIndex":0,"PageSize":0,"TotalPages":0,"TotalRecords":0,"CssClass":"pagination","GuideText":null,"PageLinksHTML":null},"IsAuthenticated":true},{"StadiumId":1247,"Name":"Sân bóng đá phường Tân Sơn Nhì","LogicalName":"/san-bong-da-phuong-tan-son-nhi.html","NagivateUrl":"/san-bong-da-phuong-tan-son-nhi.html","MainPhoto":"https://res.givator.com/pictures/11017/600/2017_11/medium/images-1_3.jpg","Photos":null,"Address":"Quận Tân Phú, Hồ Chí Minh","Street":"905/4 Âu Cơ, Phường Tân Sơn Nhì","Latitute":10.7979623,"Longitude":106.6366246,"Summary":"","About":"<p><br></p>","Facebook":"","EmailAddress":"","Website":"","PriceSummaries":null,"Managers":[{"UserId":3,"Name":"Phan Trường","Mobiles":["0908458236"],"DisplayedText":"0908458236","IsSystemUser":true}],"IsManagerUserActive":false,"SameLocationStadiums":null,"MainSlider":{"Name":null,"MediaItems":[{"FilePath":"https://res.givator.com/pictures/11017/600/2017_11/original/images-1_3.jpg","FileName":"","Name":null}]},"Breadcrumb":null,"MatchFindingRequests":null,"View":"~/Views/Blocks/Sport/FrontEnd/Stadium/_StadiumDetails.cshtml","BlockId":0,"CurrencySymbolFormat":"{0:N0}₫","ViewData":{},"Pager":{"PageIndex":0,"PageSize":0,"TotalPages":0,"TotalRecords":0,"CssClass":"pagination","GuideText":null,"PageLinksHTML":null},"IsAuthenticated":true},{"StadiumId":1245,"Name":"Sân Bóng Đá Mini Lâm Thịnh C1","LogicalName":"/san-bong-da-mini-lam-thinh-c1.html","NagivateUrl":"/san-bong-da-mini-lam-thinh-c1.html","MainPhoto":"https://res.givator.com/pictures/11017/600/2017_11/medium/1102479514027537633696117670426668655370269n.jpg","Photos":null,"Address":"Quận Tân Phú, Hồ Chí Minh","Street":"72 Nguyễn Văn Yến","Latitute":10.7618997,"Longitude":106.6257656,"Summary":"","About":"<p><br></p>","Facebook":"","EmailAddress":"","Website":"","PriceSummaries":null,"Managers":[{"UserId":3,"Name":"Phan Trường","Mobiles":["0908388277"],"DisplayedText":"0908388277","IsSystemUser":true}],"IsManagerUserActive":false,"SameLocationStadiums":null,"MainSlider":{"Name":null,"MediaItems":[{"FilePath":"https://res.givator.com/pictures/11017/600/2017_11/original/1102479514027537633696117670426668655370269n.jpg","FileName":"","Name":null}]},"Breadcrumb":null,"MatchFindingRequests":null,"View":"~/Views/Blocks/Sport/FrontEnd/Stadium/_StadiumDetails.cshtml","BlockId":0,"CurrencySymbolFormat":"{0:N0}₫","ViewData":{},"Pager":{"PageIndex":0,"PageSize":0,"TotalPages":0,"TotalRecords":0,"CssClass":"pagination","GuideText":null,"PageLinksHTML":null},"IsAuthenticated":true},{"StadiumId":1239,"Name":"Hệ Thống Sân Bóng Cỏ Nhân Tạo Nhân Việt HighSchool","LogicalName":"/he-thong-san-bong-co-nhan-tao-nhan-viet-highschool.html","NagivateUrl":"/he-thong-san-bong-co-nhan-tao-nhan-viet-highschool.html","MainPhoto":"https://res.givator.com/pictures/11017/600/2017_11/medium/1786262812813984185755227723748397251913419n.png","Photos":null,"Address":"Quận Tân Phú, Hồ Chí Minh","Street":"318 Trịnh Đình Trọng, Hòa Thạnh","Latitute":10.776799,"Longitude":106.636602,"Summary":"","About":"<p><br></p>","Facebook":"","EmailAddress":"","Website":"","PriceSummaries":null,"Managers":[{"UserId":3,"Name":"Phan Trường","Mobiles":["01234795050"],"DisplayedText":"01234795050","IsSystemUser":true}],"IsManagerUserActive":false,"SameLocationStadiums":null,"MainSlider":{"Name":null,"MediaItems":[{"FilePath":"https://res.givator.com/pictures/11017/600/2017_11/original/1786262812813984185755227723748397251913419n.png","FileName":"","Name":null}]},"Breadcrumb":null,"MatchFindingRequests":null,"View":"~/Views/Blocks/Sport/FrontEnd/Stadium/_StadiumDetails.cshtml","BlockId":0,"CurrencySymbolFormat":"{0:N0}₫","ViewData":{},"Pager":{"PageIndex":0,"PageSize":0,"TotalPages":0,"TotalRecords":0,"CssClass":"pagination","GuideText":null,"PageLinksHTML":null},"IsAuthenticated":true},{"StadiumId":1237,"Name":"Sân bóng đá mi ni Lê Lợi","LogicalName":"/san-bong-da-mi-ni-le-loi.html","NagivateUrl":"/san-bong-da-mi-ni-le-loi.html","MainPhoto":"https://res.givator.com/pictures/11017/600/2017_11/medium/104112303950561439803535143032489380898499n.jpg","Photos":null,"Address":"Quận Tân Phú, Hồ Chí Minh","Street":"trường trung học cơ sở Lê Lợi, phường Tây Thạnh","Latitute":10.8136125,"Longitude":106.6216342,"Summary":"","About":"<p><br></p>","Facebook":"","EmailAddress":"","Website":"","PriceSummaries":null,"Managers":[{"UserId":3,"Name":"Phan Trường","Mobiles":["0983151312"],"DisplayedText":"0983151312","IsSystemUser":true}],"IsManagerUserActive":false,"SameLocationStadiums":null,"MainSlider":{"Name":null,"MediaItems":[{"FilePath":"https://res.givator.com/pictures/11017/600/2017_11/original/104112303950561439803535143032489380898499n.jpg","FileName":"","Name":null}]},"Breadcrumb":null,"MatchFindingRequests":null,"View":"~/Views/Blocks/Sport/FrontEnd/Stadium/_StadiumDetails.cshtml","BlockId":0,"CurrencySymbolFormat":"{0:N0}₫","ViewData":{},"Pager":{"PageIndex":0,"PageSize":0,"TotalPages":0,"TotalRecords":0,"CssClass":"pagination","GuideText":null,"PageLinksHTML":null},"IsAuthenticated":true}],"MainSlider":{"Name":"Stadium gallery","MediaItems":[{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/mocsanbongnhanviet.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/1.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/2.png","FileName":"","Name":""},{"FilePath":"https://res.givator.com/pictures/11017/500/2017_12/original/mocsanbongnhanviet.png","FileName":"","Name":null}]},"Breadcrumb":{"Items":[{"Link":"/san-bong","Text":"Sân bóng","CssClass":"","Title":"Sân bóng","IsLast":false},{"Link":"/san-bong-tai-ho-chi-minh","Text":"Sân bóng tại Hồ Chí Minh","CssClass":"","Title":"Sân bóng tại Hồ Chí Minh","IsLast":false},{"Link":"","Text":"Hệ Thống Sân Bóng Cỏ Nhân Tạo Nhân Việt HighSchool","CssClass":"","Title":"Hệ Thống Sân Bóng Cỏ Nhân Tạo Nhân Việt HighSchool","IsLast":true}]},"MatchFindingRequests":[],"View":"~/Views/Blocks/Sport/FrontEnd/Stadium/_StadiumDetails.cshtml","BlockId":0,"CurrencySymbolFormat":"{0:N0}₫","ViewData":{},"Pager":{"PageIndex":0,"PageSize":0,"TotalPages":0,"TotalRecords":0,"CssClass":"pagination","GuideText":null,"PageLinksHTML":null},"IsAuthenticated":true};
</script>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<c:set var="pitch" value="${pitch}" />

<c:set var="pitchDetails" value="${pitchDetails}"></c:set>
<c:set var="pitchInfodtos" value="${pitchInfodtos}"></c:set>

<%
	List<PitchDetail> pitchDetails = (List<PitchDetail>)pageContext.getAttribute("pitchDetails");
	List<PitchInfoDto> pitchInfodtos = (List<PitchInfoDto>)pageContext.getAttribute("pitchInfodtos");
%>

<%!
	public List<PitchDetail> getPitchDetailsByPitchId(int pitchId, List<PitchDetail> pitchDetails) {
		List<PitchDetail> pitchDetailByPitchIds = new ArrayList<>();
		for(PitchDetail item: pitchDetails) {
			if(item.getPitch().getId() == pitchId) {
				pitchDetailByPitchIds.add(item);
			}
		}
		return pitchDetailByPitchIds;
	}
%>

<div class="breadcrum">
    <div class="container">
        <div class="breadcrum-line">
            <a href="/">Trang chủ</a>
            <a href="/san-bong" class="" title="Sân bóng">Sân bóng</a>
            <a href="/san-bong-tai-ho-chi-minh" class="" title="Sân bóng tại ${pitch.desName}">Sân bóng tại ${pitch.desName}</a>
            <a>${pitch.name}</a>
        </div>
    </div>
</div>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="content-cts">
                    <div class="item-card">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h1 class="title-sans">${pitch.name}</h1>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="des-san">
                                            <div class="san-address-line">
                                                <i class="fa fa-map-o" aria-hidden="true"></i> ${pitch.detail} (${pitch.desName}, Đà Nẵng)
                                                <a href="javascript:showGmapPopup('map_canvas', 10.7779868, 106.6373224, 'Hệ Thống Sân Bóng Cỏ Nhân Tạo Nhân Việt HighSchool')"><span class="fa fa-map-marker"></span></a>
                                            </div>
                                            
                                           	<%
												PitchInfoDto pitch = (PitchInfoDto)pageContext.getAttribute("pitch");
												List<PitchDetail> pitchDetailByPitchIds = getPitchDetailsByPitchId(pitch.getId(), pitchDetails);
												for(PitchDetail pDetailById: pitchDetailByPitchIds) {
											%> 
                                            <div>
                                                <strong>Giá thuê sân <%=pDetailById.getPitchType().getId()%> người</strong>
                                            </div>
                                            
                                            <% 
												for (PitchInfoDto dto : pitchInfodtos) {
													if (dto.getPitchDetailId() != null) {
														if (dto.getPitchDetailId() == pDetailById.getId()) {
														pageContext.setAttribute("wdays", dto.getWdayStart());
														pageContext.setAttribute("wdaye", dto.getWdayEnd());
                                            %>
                                            
                                            <div class="san-price-line calendar-row" data-numberofplays="5" data-price="160000" data-stadiumId="1263" data-stadiumnumberid="06:00 - 09:00 Từ thứ 2-6">
                                                <%=dto.getHourStart()%>:00 - <%=dto.getHourEnd()%>:00  ${tagfunc:getWday(wdays,wdaye)}
                                                <div>
                                                    <span class="price-san"><%=dto.getPrice()%>.000<sup>vnđ</sup></span>
                                                    <button class="check-san" onclick="sport.stadiumDetail.showCalendar(this)">
                                                        <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Đặt sân
                                                    </button>
                                                </div>

                                                <div class="stadium-calendar">
                                                    <div class="stadium-container">
                                                    	<!-- HANDING BOOK STADIUM -->
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div style='display:none' class="san-price-line calendar-row">
                                            	<b style='color:purple'>HELLO STADIUM - CALLENDAR</b>
                                            </div>
                                            
                                            <% }}}} %>
                                            
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="title-img">Liên hệ đặt sân</div>
                                        <div class="des-san contact-info">
                                            <div class="phone-numb">
                                                <i class="fa fa-phone-square" aria-hidden="true"></i> <a href="/user/profile/1236" class="text-highlight" target="_blank">${pitch.fullName} - ${pitch.phoneNumber}</a>
                                                <div class="manager-chat user-online-status-container" owner-id="1236">
                                                    <span class="user-online-status offline"></span>
                                                    <span class="chat-nhanh" ng-click="onQuickChat(1236);"><i class="fa fa-comments" aria-hidden="true"></i> Liên hệ nhanh</span>
                                                </div>
                                            </div>
                                            <div class="des-email">
                                                <a href="${pitch.email}"><i class="fa fa-envelope" aria-hidden="true"></i> ${pitch.email} </a>
                                            </div>
                                            <div class="des-facebook">
                                                <a href="${pitch.facebook}" target="_blank"><i class="fa fa-facebook-square" aria-hidden="true"></i> ${pitch.facebook}</a>
                                            </div>
                                            <div class="des-website">
                                                <a href="${pitch.website}" target="_blank"><i class="fa fa-globe" aria-hidden="true"></i> ${pitch.website}</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="title-img">Giới thiệu về sân</div>
                                        <div class="content-sans">
                                            <p>${pitch.description}</p>
                                        </div>
                                        <div class="slider-home-banner slider-chi-san owl-carousel">
                                            <div>
                                                <img class="img-responsivex" src="https://vhtt.danang.gov.vn/documents/10180/3062926/SHB%20Da%20Nang.jpg?t=1520387088573" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/192380991347772725271424970143526094323011o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/180330651290085447706819552475998813855201n.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1826838813050993328720974120316571446757931n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146311514245096209310673875595653393495849n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1922306713477727286047578564319996700526987o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2146275414177162182770743775353835535384362n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1923809913477727252714249701435260.94323011o.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2272867714543224846164472222443404824997816n.jpg" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/1.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/2.png" align="thumbnail" alt="">
                                            </div>
                                            <div>
                                                <img class="img-responsivex" src="https://res.givator.com/pictures/11017/500/2017_12/original/mocsanbongnhanviet.png" align="thumbnail">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="fb-comments" data-href="https://www.timdoinhanh.com/he-thong-san-bong-co-nhan-tao-nhan-viet-highschool-266126311.html" data-numposts="5"></div>
                </div>

            </div>
            
            
            <!--STadium list right-->
            <div class="col-md-4">
                <div class="sidebar sidebar-tien-san">
                    <p class="title-box"><i class="fa fa-map-marker" aria-hidden="true"></i> Sân bóng cùng địa bàn</p>
                    <div class="list-item-san list-item-san-sidebar">
                        <div class="slider-near-san owl-carousel">
                        	<c:forEach var="connectionPitch" items="${connectionPitches}">
	                            <div>
	                                <div class="item-card">
	                                    <div class="row">
	                                        <div class="col-md-12 item-preview-image">
	                                            <a href="/san-bong-da-tan-thoi-hoa.html" title="${connectionPitch.name}">
	                                                <img class="img-responsive" src="https://res.givator.com/pictures/11017/600/2017_11/medium/2321325515134632920560542406925300748229066o.jpg" alt="${connectionPitch.name}" align="thumbnail">
	                                            </a>
	                                        </div>
	                                        <div class="col-md-12 right-item-san">
	                                            <h2><a href="/san-bong-da-tan-thoi-hoa.html" class="item-name-link">${connectionPitch.name}</a></h2>
	                                            <p>
	                                                <i class="fa fa-map-o" aria-hidden="true"></i> ${connectionPitch.detail} (${connectionPitch.desName}, Đà Nẵng)
	                                                <a href="javascript:showGmapPopup('map_canvas', 10.76087, 106.6318, 'Sân Bóng Đá Tân Thới Hòa')"><span class="fa fa-map-marker"></span></a>
	                                            </p>
	                                            <p>Thông tin giá chưa được cập nhật. Bạn vui lòng gọi điện trực tiếp tới quản lý sân để biết thông tin giá </p>
	
	                                            <p class="phone-numb"><i class="fa fa-phone-square" aria-hidden="true"></i> ${connectionPitch.phoneNumber}</p>
	
	                                            <a href="${contextPath}/san-bong/${connectionPitch.id}" title="Sân Bóng Đá Tân Thới Hòa" class="btn-chi-tiet"><i class="fa fa-long-arrow-right" aria-hidden="true"></i> Chi tiết</a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
            <!--Stadium list right END-->
        </div>
    </div>
</div>
<input type="hidden" id="hasSignin" value="True" />

<div class="hidden calendar-tpl">
    <div class="item-other-detail">
        <div id="ticket-select-date-time" class="ticket-select-date-time item-other-detail-section">
            <div class="item-other-detail-section-header">
                <strong>ĐẶT SÂN</strong>
            </div>
            <div class="row item-other-detail-section-content">
                <div class="form-group">
                    <div class="col-md-7">
                        <div id="ticket-select-date" class="ticket-select-date"></div>
                    </div>
                    <div class="col-md-5">
                        <div class="ticket-select-time-wrapper">
                            <div class="row">
                                <div class="col-xs-6 col-sm-12">
                                    <div class="ticket-select-time-title">NGÀY ĐẶT</div>
                                    <div class="ticket-select-day-summary"> <span class="currentDay"></span><small class="currentMonth"></small></div>
                                    <hr>
                                </div>
                                <div class="col-xs-6 col-sm-12">
                                    <input type="hidden" id="stadium-booking-data" />
                                    <div id="calendarBookingTime">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="booking-popup" class="modal fade" role="dialog" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 class="modal-title">Đặt sân</h3>
            </div> <!-- /.modal-header -->
            <div class="modal-body ">

            </div> <!-- /.modal-body -->
            <div class="modal-footer">
                <button onclick="sport.stadiumDetail.createBooking(event);" id="reserveCalendar"
                        data-loading-text="<i class='fa fa-spinner fa-spin '></i> Đang xử lý..."
                        class="btn btn-primary btn-primary-extra">
                    <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Đặt lịch
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
            </div> <!-- /.modal-footer -->
        </div> <!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div class="hidden booking-info">
    <form class="form-horizontal">
        <div class="col-sm-12">
            <div class="form-group row">
                <label class="control-label col-md-2 col-xs-12">Thời gian:</label>
                <div class="col-xs-12 col-md-6">
                    <input type="text" class="form-control" disabled value="17:30 - 19:00 ngày 15/02/2017" id="selectedTimeText" />
                </div>
            </div>
            <div class="form-group row">
                <label class="control-label col-md-2 col-xs-12">Chọn Đội</label>
                <div class="col-xs-12 col-md-6">
                    <select class="form-control" id="ddlTeam" name="ddlTeam"><option value="9293">fc2013_t4</option>
                        <option value="8918">FC13T4</option>
                    </select>
                </div>
            </div>

            <div class="row form-group">
                <label class="control-label col-md-2 col-xs-12">Ghi chú:</label>
                <div class="col-xs-12 col-md-10">
                    <textarea placeholder="Nhập tin liên hệ, thông báo để chủ sân xử lý yêu cầu của bạn nhanh hơn" id="note" type='text' class="form-control"></textarea>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-xs-12">
                    <label class="control-label" for="is-repeat"><input id="is-repeat" type="checkbox" /> Đặt lịch cố định hàng tuần</label>
                    <input id="hddRepeat" type="hidden" value="0" />
                </div>
            </div>
            <div class="hidden date-schedule">
                <div class="row form-group">
                    <label class="control-label col-md-2 col-xs-12">Thứ:</label>
                    <div class="col-xs-12 col-md-4">
                        <select class="form-control" id="dayofweek">
                            <option value="1">Thứ 2</option>
                            <option value="2">Thứ 3</option>
                            <option value="3">Thứ 4</option>
                            <option value="4">Thứ 5</option>
                            <option value="5">Thứ 6</option>
                            <option value="6">Thứ 7</option>
                            <option value="0">Chủ nhật</option>
                        </select>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-md-2 col-xs-12">Từ ngày</label>
                    <div class="col-xs-12 col-md-4">
                        <div class='input-group date' id='fromDateDatePicker'>
                            <input id="fromDate" type='text' class="form-control" />
                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                        </div>
                    </div>
                    <label class="control-label col-md-2 col-xs-12" style="padding-left:0px;">Đến ngày</label>
                    <div class="col-xs-12 col-md-4">
                        <div class='input-group date' id='toDateDatePicker'>
                            <input id="toDate" type='text' class="form-control" />
                            <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- /.portlet-body -->
    </form>
</div>

