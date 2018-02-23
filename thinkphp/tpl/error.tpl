{__NOLAYOUT__}
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
</head>
<body>
    <script src="__JS__/zepto.min.js"></script>
    <script src="__JS__/layer/mobile/layer.js"></script>
    <script type="text/javascript">
            layer.open({
                content: "<?php echo(strip_tags($msg));?>",
                skin: 'msg',
                time: 2
            });
            setTimeout(function() {
                location.href = "<?php echo(strip_tags($url));?>";
            }, 2000); 
    </script>
</body>
</html>
