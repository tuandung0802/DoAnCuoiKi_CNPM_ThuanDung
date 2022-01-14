<ul class="nav navbar-nav">
<li class="dropdown">
	<button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">Hóa đơn
	<span class="caret"></span></button>
	<ul class="dropdown-menu">
		<li><a href="invoice_list.php">Danh sách hóa đơn ( Xuất )</a></li>
		<li><a href="create_invoice.php">Tạo hóa đơn ( Xuất )</a></li>
		<li><a href="invoice_list_in.php">Danh sách hóa đơn ( Nhập )</a></li>
		<li><a href="create_invoice_in.php">Tạo hóa đơn ( Nhập )</a></li>


						  
	</ul>
</li>
<?php 
if($_SESSION['userid']) { ?>
	<li class="dropdown">
		<button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">Xin chào <?php echo $_SESSION['user']; ?>
		<span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="action.php?action=logout">Đăng xuất</a></li>		  
		</ul>
	</li>
<?php } ?>
</ul>
<br /><br /><br /><br />