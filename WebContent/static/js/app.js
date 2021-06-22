layui.use(['jquery','form','element','table','upload','layer','carousel'],function(){
    var $ = layui.jquery,layer = layui.layer,carousel = layui.carousel,form = layui.form,element = layui.element,table = layui.table,upload = layui.upload;
    // 搜索方法
    $(".search").keypress(function(event){
        // 如果是按了回车（这里对移动端不友好）
        if (event.which === 13) {
            let val = $(this).val();
            layer.msg('正在查询: “'+val+'” 相关内容');// 这里可以换成你自己的方法
        }
    })
    // 展开用户信息方法
    $('.user-item').on('click',function(){
        if ($(this).hasClass('an')) {
            $(this).removeClass('an').children('i').css("transform","rotate(0deg)");
            $(this).parent().children('.child-nav').stop().hide();
        } else {
            $(this).parent().children('.child-nav').stop().show();
            $(this).addClass('an').children('i').css("transform","rotate(180deg)");
        }
        window.event ? window.event.cancelBubble = true : e.stopPropagation();
    })
    // 导航条的折叠与展开
    $('.tpl-dent').on('click',function(){
        // 展开或是折叠
        let type = null;
        if ($('.tpl-app').hasClass('tpl-small-app')) {
            $('.tpl-app').removeClass('tpl-small-app');
            $(this).children('i').css("transform","rotate(0)");
            type = 0;
        } else {
            $('.tpl-app').addClass('tpl-small-app');
            $(this).children('i').css("transform","rotate(180deg)");
            type = 1;
        }
        // 请求记录折叠或展开状态
        $.ajax({
            url: 'xxx/app_dent',// 这里改为你自己的api接口
            type: 'post',
            data: {
                type: type
            },
            success: function (d) {
                console.log(d);
            }
        })
        // 以下是我个人的后台接口方法，thinkPHP5.1 只提供思路 实际情况据个人而定
        /*public function app_dent()
        {
            if ($this->request->isPost()) {
                $type = input('type');
                $type == 0 ? Session::set('app_style',null) : Session::set('app_style','tpl-small-app');
                return null;
            }
        }*/
    })
    // 页面的点击冒泡
    $(document).on("click",function(){
        if ($('.tpl-header .child-nav').is(':visible')) {
            $('.user-item').removeClass('an');
            $('.caret').css("transform","rotate(0deg)");
            $(".tpl-header .child-nav").hide();
        }
    })
    // 退出登陆
    $('.logout').on('click',function () {
        $.ajax({
            url: "../user/logout",
            type: 'post',
            success: function (d) {
                layer.msg(d.msg);
                window.location.href = "../user/login";
            }
        })
    })
    // 内置侧边栏展开
    $('.theme').on('click',function () {
        $('body').append('<div class="tpl-shade"></div>');
        $(".tpl-right-bar").css('right',0);
    })
    // 关闭侧边栏
    $(document).on('click','.tpl-shade',function () {
        $(this).remove();
        $('.tpl-right-bar').css('right','-1500px')
    })
    // 更换系统UI
    $('.theme-item').on('click',function (e) {
        let id = $(this).attr('theme-id');
        let head_bg = $(this).find('.theme-head').attr('bg');
        let head_color = $(this).find('.theme-head').attr('color');
        let side_bg = $(this).find('.theme-side').attr('bg');
        let side_color = $(this).find('.theme-side').attr('color');
        let logo_bg = $(this).find('.theme-logo').attr('bg');
        let logo_color = $(this).find('.theme-logo').attr('color');
        let style = '';
        style += "<style class='theme-style'>";
        style += ".tpl-app .tpl-header .tpl-header-item{background-color: "+head_bg+"!important}";
        style += ".tpl-app .tpl-header .tpl-header-item *{color: "+head_color+" !important}";
        style += ".tpl-side{background-color: "+side_bg+" !important}";
        style += ".tpl-side *{color: "+side_color+" !important}";
        style += ".tpl-side *{color: "+side_color+" !important}";
        style += ".tpl-side-menu .tpl-nav .nav-item .child-nav li a span,.tpl-side-menu .tpl-nav .nav-item .child-nav li a i{color: #777 !important}";
        style += ".tpl-user-image {background-color: "+logo_bg+"}";
        style += ".tpl-user-image .user-name {color: "+logo_color+"}";
        style += "</style>";
        $('body').find('.theme-style').remove();
        $('body').append(style);
        // 请求记录UI样式
        $.ajax({
            url: 'xxx/site_index',// 把这里换成你自己的接口
            type: 'post',
            data: {
                theme_id: id
            },
            success: function (d) {
                console.log(d);
            }
        })
        /*
        * 以下是我的接口写法 仅供提供思路
        public function site_index()
        {
            if ($this->request->isAjax()) {
                $theme = input('param.theme_id');
                Session::set('site-ui-id',$theme);
            }
            $this->assign("info",AdminUi::all());
            return $this->fetch();
        }
         */
    })
    // 卡片内置滑块
    carousel.render({
        elem: '.tpl-carousel',
        width: '100%',
        height: 'auto',
        arrow: 'none'
    });
    // 卡片上的解惑
    $('.question-o').hover(function (e) {
        let val = $(this).attr("tip");
        layer.tips(val, $(this), {
            tips: [2,'rgba(0,0,0,0.85)']
        });
    })
    // 自定义UI下拉框操作
    $(".tpl-select").on('click',function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
            $(this).addClass('selected');
        }
    })
    $('.type_list').on('click','.el',function () {
        $(".tpl-select").attr('value',$(this).attr('value'))
        $('.type_list').find('.active').removeClass('active');
        $(this).addClass('active');
        // $(this).addClass('active').siblings('a').removeClass('active');
        $('.tpl-select').children('.selected_text').text($(this).text());
    })
    // 全屏
    $('.screen').on('click',function(){
        if ($(this).hasClass('full')) {
            $(this).find('i').removeClass('layui-icon-screen-restore').addClass('layui-icon-screen-full');
            $(this).removeClass('full');
            exitFullscreen();
        } else {
            $(this).addClass('full');
            $(this).children('i').removeClass('layui-icon-screen-full').addClass('layui-icon-screen-restore');
            requestFullScreen();
        }
    })
    function stopPropagation(e) {
        var ev = e || window.event;
        if (ev.stopPropagation) {
            ev.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;//兼容IE
        }
    };
    // 全屏
    function requestFullScreen() {
        var de = document.documentElement;
        if (de.requestFullscreen) {
            de.requestFullscreen();
        } else if (de.mozRequestFullScreen) {
            de.mozRequestFullScreen();
        } else if (de.webkitRequestFullScreen) {
            de.webkitRequestFullScreen();
        }
    }
    // 退出全屏
    function exitFullscreen() {
        var de = document;
        if (de.exitFullscreen) {
            de.exitFullscreen();
        } else if (de.mozCancelFullScreen) {
            de.mozCancelFullScreen();
        } else if (de.webkitCancelFullScreen) {
            de.webkitCancelFullScreen();
        }
    }
})
