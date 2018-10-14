<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>api test</title>
    <meta name="generator" content="HTMLTestRunner 0.9.1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    
<style type="text/css" media="screen">
    body        { font-family: verdana, arial, helvetica, sans-serif; font-size: 80%; }
    table       { font-size: 100%; }
    pre         { white-space: pre-wrap;word-wrap: break-word; }

    /* -- heading ---------------------------------------------------------------------- */
    h1 {
        font-size: 16pt;
        color: gray;
    }
    .heading {
        margin-top: 0ex;
        margin-bottom: 1ex;
    }

    .heading .attribute {
        margin-top: 1ex;
        margin-bottom: 0;
    }

    .heading .description {
        margin-top: 2ex;
        margin-bottom: 3ex;
    }

    /* -- css div popup ------------------------------------------------------------------------ */
    a.popup_link {
    }

    a.popup_link:hover {
        color: red;
    }

    .popup_window {
        display: none;
        position: relative;
        left: 0px;
        top: 0px;
        /*border: solid #627173 1px; */
        padding: 10px;
        /*background-color: #E6E6D6; */
        font-family: "Lucida Console", "Courier New", Courier, monospace;
        text-align: left;
        font-size: 8pt;
        /* width: 500px;*/
    }

    }
    /* -- report ------------------------------------------------------------------------ */
    #show_detail_line {
        margin-top: 3ex;
        margin-bottom: 1ex;
    }
    #result_table {
        width: 99%;
    }
    #header_row {
        font-weight: bold;
        color: #303641;
        background-color: #ebebeb;
    }
    #total_row  { font-weight: bold; }
    .passClass  { background-color: #bdedbc; }
    .failClass  { background-color: #ffefa4; }
    .errorClass { background-color: #ffc9c9; }
    .passCase   { color: #6c6; }
    .failCase   { color: #FF6600; font-weight: bold; }
    .errorCase  { color: #c00; font-weight: bold; }
    .hiddenRow  { display: none; }
    .testcase   { margin-left: 2em; }


    /* -- ending ---------------------------------------------------------------------- */
    #ending {
    }

    #div_base {
                position:absolute;
                top:0%;
                left:5%;
                right:5%;
                width: auto;
                height: auto;
                margin: -15px 0 0 0;
    }
</style>

    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.bootcss.com/echarts/3.8.5/echarts.common.js"></script>
</head>
<body>
    <script language="javascript" type="text/javascript"><!--
    output_list = Array();

    /* level - 0:Summary; 1:Failed; 2:All */
    function showCase(level) {
        trs = document.getElementsByTagName("tr");
        for (var i = 0; i < trs.length; i++) {
            tr = trs[i];
            id = tr.id;
            if (id.substr(0,2) == 'ft') {
                if (level < 1) {
                    tr.className = 'hiddenRow';
                }
                else {
                    tr.className = '';
                }
            }
            if (id.substr(0,2) == 'pt') {
                if (level > 1) {
                    tr.className = '';
                }
                else {
                    tr.className = 'hiddenRow';
                }
            }
        }
    }


    function showClassDetail(cid, count) {
        var id_list = Array(count);
        var toHide = 1;
        for (var i = 0; i < count; i++) {
            tid0 = 't' + cid.substr(1) + '.' + (i+1);
            tid = 'f' + tid0;
            tr = document.getElementById(tid);
            if (!tr) {
                tid = 'p' + tid0;
                tr = document.getElementById(tid);
            }
            id_list[i] = tid;
            if (tr.className) {
                toHide = 0;
            }
        }
        for (var i = 0; i < count; i++) {
            tid = id_list[i];
            if (toHide) {
                document.getElementById('div_'+tid).style.display = 'none'
                document.getElementById(tid).className = 'hiddenRow';
            }
            else {
                document.getElementById(tid).className = '';
            }
        }
    }


    function showTestDetail(div_id){
        var details_div = document.getElementById(div_id)
        var displayState = details_div.style.display
        // alert(displayState)
        if (displayState != 'block' ) {
            displayState = 'block'
            details_div.style.display = 'block'
        }
        else {
            details_div.style.display = 'none'
        }
    }


    function html_escape(s) {
        s = s.replace(/&/g,'&amp;');
        s = s.replace(/</g,'&lt;');
        s = s.replace(/>/g,'&gt;');
        return s;
    }

    /* obsoleted by detail in <div>
    function showOutput(id, name) {
        var w = window.open("", //url
                        name,
                        "resizable,scrollbars,status,width=800,height=450");
        d = w.document;
        d.write("<pre>");
        d.write(html_escape(output_list[id]));
        d.write("\n");
        d.write("<a href='javascript:window.close()'>close</a>\n");
        d.write("</pre>\n");
        d.close();
    }
    */
    --></script>

    <div id="div_base">
        
    <div class='page-header'>
        <h1>api test</h1>
    <p class='attribute'><strong>开始时间:</strong> 2018-10-14 12:10:52</p>
<p class='attribute'><strong>运行时长:</strong> 0:00:00.068817</p>
<p class='attribute'><strong>状态:</strong> 通过 1</p>

    </div>
    <div style="float: left;width:50%;"><p class='description'>test</p></div>
    <div id="chart" style="width:50%;height:400px;float:left;"></div>

        
    <div class="btn-group btn-group-sm">
        <button class="btn btn-default" onclick='javascript:showCase(0)'>总结</button>
        <button class="btn btn-default" onclick='javascript:showCase(1)'>失败</button>
        <button class="btn btn-default" onclick='javascript:showCase(2)'>全部</button>
    </div>
    <p></p>
    <table id='result_table' class="table table-bordered">
        <colgroup>
            <col align='left' />
            <col align='right' />
            <col align='right' />
            <col align='right' />
            <col align='right' />
            <col align='right' />
        </colgroup>
        <tr id='header_row'>
            <td>测试套件/测试用例</td>
            <td>总数</td>
            <td>通过</td>
            <td>失败</td>
            <td>错误</td>
            <td>查看</td>
        </tr>
        
    <tr class='passClass'>
        <td>test_user_login.TestUserLogin</td>
        <td>1</td>
        <td>1</td>
        <td>0</td>
        <td>0</td>
        <td><a href="javascript:showClassDetail('c1',1)">详情</a></td>
    </tr>

<tr id='pt1.1' class='hiddenRow'>
    <td class='none'><div class='testcase'>test_user_login_normal</div></td>
    <td colspan='5' align='center'>通过</td>
</tr>

        <tr id='total_row'>
            <td>总计</td>
            <td>1</td>
            <td>1</td>
            <td>0</td>
            <td>0</td>
            <td>&nbsp;</td>
        </tr>
    </table>

        <div id='ending'>&nbsp;</div>
        
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart'));

        // 指定图表的配置项和数据
        var option = {
            title : {
                text: '测试执行情况',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['通过','失败','错误']
            },
            series : [
                {
                    name: '测试执行情况',
                    type: 'pie',
                    radius : '60%',
                    center: ['50%', '60%'],
                    data:[
                        {value:1, name:'通过'},
                        {value:0, name:'失败'},
                        {value:0, name:'错误'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    
    </div>
</body>
</html>
