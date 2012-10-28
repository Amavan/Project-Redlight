<?php 

require('global.php');

$page_title = getTranslation('testimonials-title');
$page_id = "testimonials";
$sidebar_file = "testimonials-sidebar.php";

require('header.php');

?>


<h1>View stories <span><a href="#">Most popular</a> <a href="#">Most recent</a></span></h1>

<?php for ($i=1; $i<=5; $i++) { ?>

<div class="testimonial">
	<div class="details">
		<p class="name">Bradley W.</p>
		<p>Atlanta, GA</p>
		<p>October 28, 2012</p>
	</div>
	<div class="story">
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis facilisis neque. Proin molestie tellus ac magna elementum sit amet adipiscing leo venenatis. Nulla eget metus enim, in vulputate nisi. Nulla arcu felis, consectetur eget pretium sit amet, iaculis sed ipsum. Sed egestas nisi a leo tincidunt eu hendrerit augue placerat. Nunc cursus tellus nec diam mollis fringilla. Pellentesque tempor elit id erat pharetra tempor. Cras ullamcorper ipsum eget metus rutrum vehicula. Suspendisse vitae tempus arcu. Donec quis libero in quam rutrum scelerisque.</p>
	</div>
	<div class="clear rating">
		<p>3 <a href="#">Yay!</a> &nbsp; 4 <a href="#">Booh!</a></p>
	</div>
</div>


<?php } ?>
		

<?php require('footer.php'); ?>