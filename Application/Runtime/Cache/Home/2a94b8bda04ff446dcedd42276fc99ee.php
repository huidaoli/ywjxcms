<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/Public/css/common.css">
    <link rel="stylesheet" href="/Public/css/style.css">
    <script type="text/javascript" src="/Public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/Public/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="/Public/js/index.js"> </script>
    <title>后台首页</title>
</head>
<body>
<div class="top">
    <div id="top_t">
        <a href="/index.php"><div id="logo" class="fl"></div></a>
        <div id="photo_info" class="fr">
            <div id="photo" class="fl">
                <a href="/index.php/Home/Employee/update/id/<?php echo ($_SESSION['user']['id']); ?>" target="right">
                    <img src="/Public/images/a.png" alt="" width="60" height="60"></a>
            </div>
            <div id="base_info" class="fr">
                <div class="help_info">
                    <a href="/index.php/Home/Index/help" id="hp">&nbsp;</a>
                    <a href="/index.php/Home/Index/about" id="gy">&nbsp;</a>
                    <a href="/index.php/Home/User/logout" id="out">&nbsp;</a>
                </div>
                <div class="info_center">
                    <?php echo ($_SESSION['user']['name']); ?>
                    <span id="nt">通知</span><span><a href="#" id="notice">0</a></span>
                </div>
            </div>
        </div>
    </div>
    <div id="side_here">
        <div id="side_here_l" class="fl"></div>
        <div id="here_area" class="fl">当前位置：</div>
    </div>
</div>
<div class="side">
    <div class="sideMenu" style="margin:0 auto">
        <h3>基础信息维护</h3>
        <ul>
            <a href="/index.php/Home/Employee" target="right"><li>员工管理</li></a>
            <a href="/index.php/Home/StockHouse" target="right"><li>仓库管理</li></a>
            <a href="/index.php/Home/Product/category" target="right"><li>产品类别管理</li></a>
            <a href="/index.php/Home/Product" target="right"><li>产品管理</li></a>
            <a href="/index.php/Home/StockPile" target="right"><li>库存管理</li></a>
        </ul>
        <h3>采购入库</h3>
        <ul>
            <a href="/index.php/Home/Purchase" target="right"><li>采购单管理</li></a>
            <a href="/index.php/Home/Purchase/add" target="right"><li>新增入库单</li></a>
        </ul>

        <h3>销售出库</h3>
        <ul>
            <a href="/index.php/Home/Sale" target="right"><li>销售单管理</li></a>
            <a href="/index.php/Home/Sale/add" target="right"><li>新增销售单</li></a>
        </ul>
<!--        <h3> 统计功能</h3>
        <ul>
            <a href="/index.php/Home/Report/saleMoney" target="right"><li>销售额统计</li></a>
            <a href="/index.php/Home/Report/saleProduct" target="right"><li>销售货物统计</li></a>
        </ul>-->




    </div>
</div>
<div class="main">
    <iframe name="right" id="rightMain" src="/index.php/Home/StockPile" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
</div>
<div class="bottom">
    <div id="bottom_bg">版权</div>
</div>
<div class="scroll">
    <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onClick="menuScroll(1);"></a>
    <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onClick="menuScroll(2);"></a>
</div>
</body>

</html>