<!-- CSS -->
<link rel="stylesheet" href="/modules/servers/shadowsocks/templates/static/css/style.css">



<div class="plugin">
    <div class="row">



        <div class="col-md-12">

            <!--widget start-->

            <aside class="profile-nav alt hidden-xs">

                <section class="panel">

                    <div class="user-heading alt gray-bg">

                        <a href="#">

                            <img src="https://secure.gravatar.com/avatar/{$params.clientsdetails.email|md5}?s=128" alt="">

                        </a>

                        <h1>{$params.clientsdetails.firstname} {$params.clientsdetails.lastname}</h1>

                        <p>{$params.clientsdetails.fullstate} - {$params.clientsdetails.country}</p>

                    </div>



                    <ul class="nav nav-pills nav-stacked">

                        <li><a href="javascript:;"> <i class="fa fa-calendar-check-o"></i> {$LANG.clientareahostingregdate} : {$regdate} </a></li>

                        <li><a href="javascript:;"> <i class="fa fa-list-alt"></i> {$LANG.orderproduct} : {$groupname} - {$product} </a></li>

                        <li><a href="javascript:;"> <i class="fa fa-money"></i> {$LANG.orderpaymentmethod} : {$paymentmethod} {$LANG.firstpaymentamount}({$firstpaymentamount}) - {$LANG.recurringamount}({$recurringamount})</a></li>

                        <li><a href="javascript:;"> <i class="fa fa-spinner"></i> {$LANG.clientareahostingnextduedate} : {$nextduedate} {$LANG.orderbillingcycle}({$billingcycle}) </a></li>

                        <li><a href="javascript:;"> <i class="fa fa-check-square-o"></i> {$LANG.clientareastatus} : {$status} </a></li>

                        {foreach from=$productcustomfields item=customfield}

                            <li><a href="javascript:;"> <i class="fa fa-file-text"></i> {$customfield.name} : {$customfield.rawvalue} </a></li>

                        {/foreach}

                        

                    </ul>



                </section>

            </aside>

            <!--widget end-->
            
            <section class="panel">
                
                <header class="panel-heading">
                    用户信息
                </header>

                <div class="panel-body">
                        
                    <table class="table general-table">
                        <thead>
                            <tr>
                                <th>账号</th>
                                <th>密码</th>
                                <th class="hidden-xs">最后使用</th>
                                <th class="hidden-sm hidden-xs">登陆次数</th>
                                <th class="hidden-sm hidden-xs">累计在线</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{$params["username"]}</td>
                                <td>{$params["password"]}</td>
                                <td class="hidden-xs">{$status}</td>
                                <td class="hidden-sm hidden-xs">{$logins}</td>
                                
                                {if $logintime eq '0'}
                                <td class="hidden-sm hidden-xs">暂无数据</td>
                                {else}
                                <td class="hidden-sm hidden-xs">{$logintime}</td>
                                {/if}
                            </tr>
                        </tbody>
                    </table>

                </div>

            </section>


            <!--progress bar start-->

            <section class="panel">

                <header class="panel-heading">
                    使用报表 ( 总流量：{$limit} )
                </header>
                <div class="panel-body" id="plugin-usage">

                    <p>已用流量 ： {$total} (   {number_format(($total_bytes/$limit_bytes)*100,2) }% )</p>

                    <div class="progress progress-striped progress-sm">

                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="{($total_bytes/$limit_bytes)*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($total_bytes/$limit_bytes)*100}%">

                            <span class="sr-only">{($total_bytes/$limit_bytes)*100}% Complete</span>

                        </div>

                    </div>

                    <p>上传流量 ： {$uploads} (   {number_format(($uploads_bytes/$limit_bytes)*100,2) }% )</p>

                    <div class="progress progress-striped progress-sm">

                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="{($uploads_bytes/$limit_bytes)*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($uploads_bytes/$limit_bytes)*100}%">

                            <span class="sr-only">{($uploads_bytes/$limit_bytes)*100}% Complete (warning)</span>

                        </div>

                    </div>

                    <p>下载流量 ： {$downloads} (   {number_format(($downloads_bytes/$limit_bytes)*100,2) }% )</p>
                    <div class="progress progress-striped progress-sm">

                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="{($downloads_bytes/$limit_bytes)*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($downloads_bytes/$limit_bytes)*100}%">

                            <span class="sr-only">{($downloads_bytes/$limit_bytes)*100}% Complete (danger)</span>

                        </div>

                    </div>

                </div>

            </section>

            <!--progress bar end-->



            <section class="panel">

                <header class="panel-heading">

                    节点列表

                </header>

                <div class="panel-body">

                    <table class="table table-hover general-table">

                        <thead>

                            <tr>

                                <th class="hidden-xs" width="20%">描述</th>

                                <th width="30%">地址</th>

                                <th width="10%">加密</th>

                                <th width="10%">状态</th>

                                <th class="hidden-xs hidden-sm" width="20%">操作</th>

                            </tr>

                        </thead>

                        <tbody>
  
                            {foreach from=$nodes key=k item=node }

                            <tr>

                                <td class="hidden-xs">{$node[0]}</td>
                                <td>{$node[1]}</td>
                                <td>{$node[2]}</td>
                                <td data-hook="status">

                                    <button name="ping" class="btn btn-primary btn-xs" data-host="{$node[1]|trim}">
                                        <i class="fa fa-eye"></i>
                                        获取状态
                                    </button>

                                </td>
                                
                                <td>#
                                </td>
                                <!--
                                <td class="hidden-xs hidden-sm" data-hook="action">

                                    <button name="qrcode" class="btn btn-primary btn-xs" data-params="#">
                                        <i class="fa fa-qrcode"></i>
                                        二维码
                                    </button>

                                    <button name="download" class="btn btn-primary btn-xs hidden-md" data-params="#">
                                        <i class="fa fa-file-o"></i>
                                        配置文件
                                    </button>
                                    
                                </td> 
                                -->

                            </tr>

                            {/foreach}

                        </tbody>

                    </table>

                </div>

            </section>

        </div>

    </div>
    <div id="qrcode">
        
        <section class="panel">

            <header class="panel-heading">
                二维码
                
                <div class="pull-right">
                    <a href="javascript:void(0)" id="close-qrcode"><i class="fa fa-times"></i></a>
                </div>
            </header>

            <div class="panel-body">
                
                <div class="row">
                    <img id="qrcode-src" src="" alt="">
                </div>

            </div>
            
        </section>

    </div>
</div>


<!-- JavsScript -->
<script src="/modules/servers/shadowsocks/templates/static/js/script.js"></script>