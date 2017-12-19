<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/Public/css/common.css">
    <link rel="stylesheet" href="/Public/css/main.css">
    <script type="text/javascript" src="/Public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/Public/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="/Public/js/common.js"></script>

    <title>Document</title>
</head>
<body>
<div class="container">

    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_top"><b class="pl15">
                    库存修改
                </b></div>
                <div class="box_center">
                    <form action="" class="jqtransform" method="post">
                        <input type="hidden" name="id" value="<?php echo ((isset($vo["id"]) && ($vo["id"] !== ""))?($vo["id"]):0); ?>">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_right">仓库名称：</td>
                                <td class="">
                                    <span class="fl">
                                      <div class="select_border">
                                          <div class="select_containers ">
                                              <select name="stock_house_id" class="select">
                                                  <?php if(is_array($stockHouses)): foreach($stockHouses as $key=>$stockHouse): if(($stockHouse["id"]) == $query["stock_house_id"]): ?><option value="<?php echo ($stockHouse["id"]); ?>" selected><?php echo ($stockHouse["name"]); ?> </option>
                                                          <?php else: ?>
                                                          <option value="<?php echo ($stockHouse["id"]); ?>"><?php echo ($stockHouse["name"]); ?></option><?php endif; endforeach; endif; ?>
                                              </select>
                                          </div>
                                      </div>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">产品名称：</td>
                                <td class="">
                                    <select  id="product_id" name="product_id" class="select">
                                        <?php if(is_array($products)): foreach($products as $key=>$product): ?><option value="<?php echo ($product["id"]); ?>" data-spec="<?php echo ($product["spec"]); ?>" ><?php echo ($product["name"]); ?> </option><?php endforeach; endif; ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">数量：</td>
                                <td class="">
                                    <input type="text" name="quantity" value="<?php echo ($vo["quantity"]); ?>" class="input-text lh30" size="40">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="保存">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>