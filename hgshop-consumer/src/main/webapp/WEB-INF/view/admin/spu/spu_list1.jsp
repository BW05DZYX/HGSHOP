<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>hgshop后台管理系统</title>

	<!-- Bootstrap core CSS -->
    <link href="resource/css/bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="resource/css/bootstrap-treeview.css" />
    <script type="text/javascript" src="resource/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resource/bootstrap/js/bootstrap-treeview.js" ></script>
    
    <script>
    	$(function(){
    		var defaultData = [
          {
            text: 'Parent 1',
            href: '#parent1',
            tags: ['4'],
            selectable: false,
            nodes: [
              {
                text: 'Child 1',
                href: '#child1',
                tags: ['2'],
                selectable: false,
                nodes: [
                  {
                    text: 'Grandchild 1',
                    href: '#Grandchild 1',
                    tags: ['0']
                  },
                  {
                    text: 'Grandchild 2',
                    href: '#grandchild2',
                    tags: ['0']
                  }
                ]
              },
              {
                text: 'Child 2',
                href: '#child2',
                tags: ['0']
              }
            ]
          },
          {
            text: 'Parent 2',
            href: '#parent2',
            tags: ['0']
          },
          {
            text: 'Parent 3',
            href: '#parent3',
             tags: ['0']
          },
          {
            text: 'Parent 4',
            href: '#parent4',
            tags: ['0']	
          },
          {
            text: 'Parent 5',
            href: '#parent5'  ,
            tags: ['0']
          }
        ];
    		$("#addCategoryName").click(function() {
					var options = {
						levels : 1,
						data : defaultData,
						onNodeSelected : function(event, data) {
							$("#addCategoryName").val(data.text);
							$("#tree").hide();//选中树节点后隐藏树
						}
					};
					$('#tree').treeview(options);
					$('#tree').show()
				});
    	})
    	
    </script>
  </head>

<body>

	<div class="container-fluid">
					<div class="row">
						<!-- 加入了列 填充整行 -->
						<form class="col-sm-12" action="spuList" method="post">
							<div class="form-group">
								<label>商品名称</label> 
								<input type="text" name="goodsName" class="form-control" placeholder="请输入品牌名称" value="">
							</div>

							<div class="form-group">
								<label>商品副标题</label> 
								<input type="text" name="caption" class="form-control" placeholder="请输入品牌的首字母" value="">
							</div>
							<!-- 隐藏分类的id值 -->
							<input type="hidden" id="cid" name="categoryId" value=""/>
							<button class="btn btn-success">搜索</button>
						</form>
					</div>

					<!-- 外边距(下方) 10像素的大小 -->
					<div class="row" style="margin-bottom: 10px;">
						<!-- 右端对齐 -->
						<div class="col-sm-12" align="right">
							<input type="button" class="btn btn-danger"
								onclick="deleteObjects()" value="批量删除" />
							<button class="btn btn-primary btn-sm" onclick="preAddSpu()"
								data-toggle="modal" data-target="#spuAddModal">添加商品</button>
						</div>
					</div>


					<div class="row">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="cbk" />全选</th>
									<th scope="col">序号</th>
									<th scope="col">图标</th>
									<th scope="col">商品名称</th>
									<th scope="col">商品状态</th>
									<th scope="col">商品品牌</th>
									<th scope="col">商品分类</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td scope="row">
											<input type="checkbox" class="ck"	value=""/>
										</td>
										<td></td>
										<td>
											<img width="40px" height="40px" src=""/>
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<a href="javascript:void(0)" onclick="deleteObjectByIds()" class="btn btn-info">删除</a>
											<button class="btn btn-info btn-sm" data-toggle="modal"
												data-target="#spuEditModal"
												onclick="updateSpu()">修改</button>
											<button class="btn btn-primary btn-sm" data-toggle="modal"
												data-target="#spuDetailModal"
												onclick="detailSpu()">详情</button></td>
									</tr>
							</tbody>
						</table>

						<nav>
						  <ul class="pagination">
						    <li>
						      <a href="#">
						        <span aria-hidden="true">上一页</span>
						      </a>
						    </li>
						    <li><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li>
						      <a href="#" aria-label="Next">
						        <span aria-hidden="true">下一页</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>

	</div>


	<!-- ////////////////写入添加模态框 //////////////////////////////-->
	<div class="modal fade" id="spuAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 关闭的x效果 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<!-- 模态框的标题 -->
					<h4 class="modal-title" id="spuAddModalLabel">添加商品操作</h4>
				</div>
				<div class="modal-body">
					<form id="addFrm" enctype="multipart/form-data">
						<div class="form-group row">

							<label for="addGoodsName"
								class="col-sm-3 col-form-label col-form-label-sm">商品名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm"
									id="addGoodsName" name="goodsName" placeholder="请输入商品名称">
							</div>
						</div>

						<div class="form-group row">
							<label for="addCaption" class="col-sm-3 col-form-label">商品副标题</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="addCaption"
									name="caption" placeholder="请输入商品的副标题">
							</div>
						</div>

						<div class="form-group row">
							<label for="addismarketTable" class="col-sm-3 col-form-label">商品状态</label>
							<div class="col-sm-9">
								<select class="form-control" name="ismarketTable">
									<option value="0">上架</option>
									<option value="1">下架</option>
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="addBrand" class="col-sm-3 col-form-label">商品品牌</label>
							<div class="col-sm-9">
								<select class="form-control" id="addBrand" name="brand.id">
									<option value="0">请选择品牌</option>
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="addCategory" class="col-sm-3 col-form-label">商品分类</label>
							<!-- 左边部分 -->
							<div class="col-sm-9">
								<input type="hidden" class="form-control" id="addCategory"
									name="category.id"> <input
									type="text" class="form-control" id="addCategoryName"
									placeholder="选择商品分类">
								<div id="tree" style="display: none; position:absolute; z-index:1010; background-color:white; "></div>
							</div>
						</div>


						<div class="form-group row">
							<label for="addsmallPic" class="col-sm-3 col-form-label">商品图标</label>
							<div class="col-sm-9">
								<input type="file" class="form-control" id="addsmallPic"
									name="file" />
							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="addObject()">添加</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- ///////////////////添加模态框结束//////////////////////////// -->


</body>
</html>