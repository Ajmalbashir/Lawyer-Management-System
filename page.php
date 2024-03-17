<?php
require_once('header.php');

// Preventing the direct access of this page.
if(!isset($_REQUEST['slug']))
{
	header('location: index.php');
	exit;
}
else
{
	// Check the page slug is valid or not.
	$statement = $pdo->prepare("SELECT * FROM tbl_page WHERE page_slug=? AND status=?");
	$statement->execute(array($_REQUEST['slug'],'Active'));
	$total = $statement->rowCount();
	if( $total == 0 )
	{
		header('location: index.php');
		exit;
	}
}

// Getting the detailed data of a page from page slug
$statement = $pdo->prepare("SELECT * FROM tbl_page WHERE page_slug=?");
$statement->execute(array($_REQUEST['slug']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$page_name    = $row['page_name'];
	$page_slug    = $row['page_slug'];
	$page_content = $row['page_content'];
	$page_layout  = $row['page_layout'];
	$banner       = $row['banner'];
	$status       = $row['status'];
}

// If a page is not active, redirect the user while direct URL press
if($status == 'Inactive')
{
	header('location: index.php');
	exit;
}
?>
		
		
<!-- Banner Start -->
<div class="page-banner" style="background-image: url(<?php echo BASE_URL; ?>assets/uploads/<?php echo $banner; ?>)">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="banner-text">
					<h1><?php echo $page_name; ?></h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->


<?php if($page_layout == 'Full Width Page Layout'): ?>
<section class="about-v2">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<?php echo $page_content; ?>
			</div>
		</div>
	</div>
</section>
<?php endif; ?>


<?php if($page_layout == 'Contact Us Page Layout'): ?>
<?php
	$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
	$statement->execute();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row) 
	{
		$contact_map_iframe = $row['contact_map_iframe'];
	}
?>
<section class="contact-v1">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="heading-normal">
					<h2>Contact Form</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7">

<?php
// After form submit checking everything for email sending
if(isset($_POST['form_contact']))
{
	$error_message = '';
	$success_message = '';
	$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
	$statement->execute();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row) 
	{
		$send_email_from  = $row['send_email_from'];
		$receive_email_to = $row['receive_email_to'];
		$smtp_active      = $row['smtp_active'];
		$smtp_ssl         = $row['smtp_ssl'];
		$smtp_host        = $row['smtp_host'];
		$smtp_port        = $row['smtp_port'];
		$smtp_username    = $row['smtp_username'];
		$smtp_password    = $row['smtp_password'];

		$recaptcha_status = $row['recaptcha_status'];
	}

    $valid = 1;

    if(empty($_POST['visitor_name']))
    {
        $valid = 0;
        $error_message .= 'Please enter your name.<br>';
    }

    if(empty($_POST['visitor_phone']))
    {
        $valid = 0;
        $error_message .= 'Please enter your phone number.<br>';
    }


    if(empty($_POST['visitor_email']))
    {
        $valid = 0;
        $error_message .= 'Please enter your email address.<br>';
    }
    else
    {
    	// Email validation check
        if(!filter_var($_POST['visitor_email'], FILTER_VALIDATE_EMAIL))
        {
            $valid = 0;
            $error_message .= 'Please enter a valid email address.<br>';
        }
    }

    if(empty($_POST['visitor_comment']))
    {
        $valid = 0;
        $error_message .= 'Please enter your comment.<br>';
    }

    if($recaptcha_status == 'On')
    {
	    if(empty($_POST['g-recaptcha-response'])) {
	    	$valid = 0;
	        $error_message .= 'Please check the the captcha form.<br>';
	    }	
    }
    

    if($valid == 1)
    {

    	$visitor_name = $_POST['visitor_name'];
    	$visitor_email = $_POST['visitor_email'];
    	$visitor_phone = $_POST['visitor_phone'];
    	$visitor_comment = $_POST['visitor_comment'];

        // sending email
		$message = '
<html><body>
<table>
<tr>
<td>Name</td>
<td>'.$visitor_name.'</td>
</tr>
<tr>
<td>Email</td>
<td>'.$visitor_email.'</td>
</tr>
<tr>
<td>Phone</td>
<td>'.$visitor_phone.'</td>
</tr>
<tr>
<td>Comment</td>
<td>'.nl2br($visitor_comment).'</td>
</tr>
</table>
</body></html>
';

		require_once('assets/mail/class.phpmailer.php');
        $mail = new PHPMailer();
        $mail->CharSet = 'UTF-8';

        if($smtp_active == 'Yes')
	    {
	    	if($smtp_ssl == 'Yes')
	    	{
	    		$mail->SMTPSecure = "ssl";
	    	}
	    	else
	    	{
	    		$mail->SMTPSecure = "tls";
	    	}
            $mail->IsSMTP();
			$mail->SMTPAuth = true;
			$mail->Host     = $smtp_host;
			$mail->Port     = $smtp_port;
			$mail->Username = $smtp_username;
			$mail->Password = $smtp_password;
        }

        $mail->addReplyTo($visitor_email);
	    $mail->setFrom($send_email_from);
	    $mail->addAddress($receive_email_to);
	    
	    $mail->isHTML(true);
	    $mail->Subject = 'Contact form email';

	    $mail->Body = $message;
	    $mail->send();
		
        $success_message = 'Thank you for sending the email. We will contact you shortly.';

    }
}
?>
				

				<form action="<?php echo BASE_URL; ?>page/<?php echo $_REQUEST['slug']; ?>" class="form-horizontal cform-1" method="post">
					<div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" class="form-control" placeholder="Name" name="visitor_name">
                        </div>
                    </div>
					<div class="form-group">
                        <div class="col-sm-12">
                            <input type="email" class="form-control" placeholder="Email Address" name="visitor_email">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" class="form-control" placeholder="Phone Number" name="visitor_phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <textarea name="visitor_comment" class="form-control" cols="30" rows="10" placeholder="Message"></textarea>
                        </div>
                    </div>
                    
                    <?php if($recaptcha_status == 'On'): ?>
					<div class="form-group">
						<div class="col-sm-12">
	                        <div class="g-recaptcha" data-sitekey="<?php echo $recaptcha_site_key; ?>"></div>
	                    </div>
                    </div>
                	<?php endif; ?>

                    <div class="form-group">
	                    <div class="col-sm-12">
	                        <input type="submit" value="Save" class="btn btn-success" name="form_contact">
	                    </div>
	                </div>
				</form>
			</div>
			<div class="col-md-5">
				<div class="google-map">
					<?php echo $contact_map_iframe; ?>
				</div>	
			</div>
			
		</div>
	</div>
</section>
<?php endif; ?>



<?php if($page_layout == 'FAQ Page Layout'): ?>
<section class="faq">
	<div class="container">
		<div class="row">
			<div class="col-md-12">			
				
				<?php
				$i=0;
				$j=0;
				$statement = $pdo->prepare("SELECT * FROM tbl_faq_category ORDER BY faq_category_id ASC");
				$statement->execute();
				$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
				foreach ($result as $row) {
					$i++;
					?>
					<h1><?php echo $row['faq_category_name']; ?></h1>
					<div class="panel-group" id="accordion<?php echo $i; ?>" role="tablist" aria-multiselectable="true">
						<?php
						$statement1 = $pdo->prepare("SELECT * FROM tbl_faq WHERE faq_category_id=?");
						$statement1->execute(array($row['faq_category_id']));
						$result1 = $statement1->fetchAll(PDO::FETCH_ASSOC);							
						foreach ($result1 as $row1) {
							$j++;
							?>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="heading1">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion<?php echo $i; ?>" href="#collapse<?php echo $j; ?>" aria-expanded="false" aria-controls="collapse<?php echo $j; ?>">
											<?php echo $row1['faq_title']; ?>
										</a>
									</h4>
									
								</div>
								<div id="collapse<?php echo $j; ?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
									<div class="panel-body">
										<?php echo $row1['faq_content']; ?>
									</div>
								</div>
							</div>
							<?php
						}
						?>
					</div>
					<?php
				}
				?>				
			</div>			
		</div>
	</div>
</section>
<?php endif; ?>



<?php if($page_layout == 'Photo Gallery Page Layout'): ?>
<section class="gallery">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<ul class="gallery-menu">
					<li class="filter" data-filter="all" data-role="button">All</li>
					<?php
					$statement = $pdo->prepare("SELECT * FROM tbl_category_photo WHERE status=?");
					$statement->execute(array('Active'));
					$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
					foreach ($result as $row) {
						$temp_string = strtolower($row['p_category_name']);
    					$temp_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    					?>
    					<li class="filter" data-filter=".<?php echo $temp_slug; ?>" data-role="button"><?php echo $row['p_category_name']; ?></li>
						<?php
					}
					?>
				</ul>

				<div id="mix-container">
					<?php
					$i=0;
					$statement = $pdo->prepare("SELECT
					                           	t1.photo_id,
												t1.photo_caption,
												t1.photo_name,
												t1.p_category_id,
												t2.p_category_id,
												t2.p_category_name,
												t2.status
					                            FROM tbl_photo t1
					                            JOIN tbl_category_photo t2
					                            ON t1.p_category_id = t2.p_category_id 
					                            ");
					$statement->execute();
					$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
					foreach ($result as $row) {
						$i++;
						$temp_string = strtolower($row['p_category_name']);
    					$temp_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
						?>
						<div class="col-md-4 mix <?php echo $temp_slug; ?> all" data-my-order="<?php echo $i; ?>">
							<div class="inner">
								<div class="photo" style="background-image:url(<?php echo BASE_URL; ?>assets/uploads/<?php echo $row['photo_name']; ?>);"></div>
								<div class="overlay"></div>
								<div class="icons">
									<div class="icons-inner">
										<a class="gallery-photo" href="<?php echo BASE_URL; ?>assets/uploads/<?php echo $row['photo_name']; ?>"><i class="fa fa-search-plus"></i></a>
									</div>
								</div>
							</div>
						</div>
						<?php
					}
					?>

				</div>

			</div>
		</div>
	</div>
</section>
<?php endif; ?>





<?php if($page_layout == 'Video Gallery Page Layout'): ?>
<section class="gallery">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<ul class="gallery-menu">
					<li class="filter" data-filter="all" data-role="button">All</li>
					<?php
					$statement = $pdo->prepare("SELECT * FROM tbl_category_video WHERE status=?");
					$statement->execute(array('Active'));
					$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
					foreach ($result as $row) {
						$temp_string = strtolower($row['v_category_name']);
    					$temp_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    					?>
    					<li class="filter" data-filter=".<?php echo $temp_slug; ?>" data-role="button"><?php echo $row['v_category_name']; ?></li>
						<?php
					}
					?>
				</ul>

				<div id="mix-container">
					<?php
					$i=0;
					$statement = $pdo->prepare("SELECT
					                           	t1.video_id,
												t1.video_title,
												t1.video_iframe,
												t1.v_category_id,
												t2.v_category_id,
												t2.v_category_name,
												t2.status
					                            FROM tbl_video t1
					                            JOIN tbl_category_video t2
					                            ON t1.v_category_id = t2.v_category_id 
					                            ");
					$statement->execute();
					$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
					foreach ($result as $row) {
						$i++;
						$temp_string = strtolower($row['v_category_name']);
    					$temp_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
						?>
						<div class="col-md-4 mix <?php echo $temp_slug; ?> all" data-my-order="<?php echo $i; ?>">
							<div class="inner viframe">
								<?php echo $row['video_iframe']; ?>
							</div>
						</div>
						<?php
					}
					?>

				</div>

			</div>
		</div>
	</div>
</section>
<?php endif; ?>



<?php if($page_layout == 'Blog Page Layout'): ?>
<section class="blog">
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				
				<!-- Blog Classic Start -->
				<div class="blog-grid">
					<div class="row">
						<div class="col-md-12">
							

							<?php
							$statement = $pdo->prepare("SELECT * FROM tbl_news ORDER BY news_id DESC");
							$statement->execute();
							$total = $statement->rowCount();
							?>

							<?php if(!$total): ?>
							<p style="color:red;">Sorry! No News is found.</p>
							<?php else: ?>




<?php
/* ===================== Pagination Code Starts ================== */
		$adjacents = 10;	
		
		$statement = $pdo->prepare("SELECT * FROM tbl_news ORDER BY news_id DESC");
		$statement->execute();
		$total_pages = $statement->rowCount();
		
		$targetpage = $_SERVER['PHP_SELF'];
		$limit = 5;                                 
		$page = @$_GET['page'];
		if($page) 
			$start = ($page - 1) * $limit;          
		else
			$start = 0;	
		

		$statement = $pdo->prepare("SELECT
								   t1.news_title,
		                           t1.news_slug,
		                           t1.news_content,
		                           t1.news_date,
		                           t1.photo,
		                           t1.category_id,

		                           t2.category_id,
		                           t2.category_name,
		                           t2.category_slug
		                           FROM tbl_news t1
		                           JOIN tbl_category t2
		                           ON t1.category_id = t2.category_id 		                           
		                           ORDER BY t1.news_id 
		                           LIMIT $start, $limit");
		$statement->execute();
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		
		
		$s1 = $_REQUEST['slug'];
				
		if ($page == 0) $page = 1;                  
		$prev = $page - 1;                          
		$next = $page + 1;                          
		$lastpage = ceil($total_pages/$limit);      
		$lpm1 = $lastpage - 1;   
		$pagination = "";
		if($lastpage > 1)
		{   
			$pagination .= "<div class=\"pagination\">";
			if ($page > 1) 
				$pagination.= "<a href=\"$targetpage?slug=$s1&page=$prev\">&#171; previous</a>";
			else
				$pagination.= "<span class=\"disabled\">&#171; previous</span>";    
			if ($lastpage < 7 + ($adjacents * 2))   //not enough pages to bother breaking it up
			{   
				for ($counter = 1; $counter <= $lastpage; $counter++)
				{
					if ($counter == $page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage?slug=$s1&page=$counter\">$counter</a>";                 
				}
			}
			elseif($lastpage > 5 + ($adjacents * 2))    //enough pages to hide some
			{
				if($page < 1 + ($adjacents * 2))        
				{
					for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
					{
						if ($counter == $page)
							$pagination.= "<span class=\"current\">$counter</span>";
						else
							$pagination.= "<a href=\"$targetpage?slug=$s1&page=$counter\">$counter</a>";                 
					}
					$pagination.= "...";
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=$lpm1\">$lpm1</a>";
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=$lastpage\">$lastpage</a>";       
				}
				elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
				{
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=1\">1</a>";
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=2\">2</a>";
					$pagination.= "...";
					for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
					{
						if ($counter == $page)
							$pagination.= "<span class=\"current\">$counter</span>";
						else
							$pagination.= "<a href=\"$targetpage?slug=$s1&page=$counter\">$counter</a>";                 
					}
					$pagination.= "...";
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=$lpm1\">$lpm1</a>";
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=$lastpage\">$lastpage</a>";       
				}
				else
				{
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=1\">1</a>";
					$pagination.= "<a href=\"$targetpage?slug=$s1&page=2\">2</a>";
					$pagination.= "...";
					for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
					{
						if ($counter == $page)
							$pagination.= "<span class=\"current\">$counter</span>";
						else
							$pagination.= "<a href=\"$targetpage?slug=$s1&page=$counter\">$counter</a>";                 
					}
				}
			}
			if ($page < $counter - 1) 
				$pagination.= "<a href=\"$targetpage?slug=$s1&page=$next\">next &#187;</a>";
			else
				$pagination.= "<span class=\"disabled\">next &#187;</span>";
			$pagination.= "</div>\n";       
		}
		/* ===================== Pagination Code Ends ================== */
		?>

							<?php
							foreach ($result as $row) {
								?>
								<div class="post-item">
									<div class="image-holder">
										<img class="img-responsive" src="<?php echo BASE_URL; ?>assets/uploads/<?php echo $row['photo']; ?>" alt="<?php echo $row['news_title']; ?>">
									</div>
									<div class="text">
										<h3><a href="<?php echo BASE_URL; ?>news/<?php echo $row['news_slug']; ?>"><?php echo $row['news_title']; ?></a></h3>
										<ul class="status">
											<li><i class="fa fa-tag"></i>Category: <a href="<?php echo BASE_URL; ?>category/<?php echo $row['category_slug']; ?>"><?php echo $row['category_name']; ?></a></li>
											<li><i class="fa fa-calendar"></i>Date: <?php echo $row['news_date']; ?></li>
										</ul>
										<p>
											<?php echo substr($row['news_content'],0,200).' ...'; ?>
										</p>
										<p class="button">
											<a href="<?php echo BASE_URL; ?>news/<?php echo $row['news_slug']; ?>">Read More</a>
										</p>
									</div>
								</div>
								<?php
							}
							?>							
							<?php endif; ?>

						</div>

						<div class="col-md-12">
							<?php if($total): ?>
							<?php echo $pagination; ?>
							<?php endif; ?>
						</div>

					</div>
				</div>
				<!-- Blog Classic End -->

			</div>
			<div class="col-md-3">
				
				<?php require_once('sidebar.php'); ?>
			
			</div>

			


		</div>
	</div>
</section>
<?php endif; ?>



<?php if($page_layout == 'Attorney Page Layout'): ?>
<section class="attorney-v3">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
				<!-- Attorney Container Start -->
				<div class="attorney-inner">
					
					<?php
					$statement = $pdo->prepare("SELECT
												
												t1.id,
												t1.name,
												t1.slug,
												t1.designation_id,
												t1.photo,
												t1.degree,
												t1.detail,
												t1.facebook,
												t1.twitter,
												t1.linkedin,
												t1.youtube,
												t1.google_plus,
												t1.instagram,
												t1.flickr,
												t1.address,
												t1.practice_location,
												t1.phone, 
												t1.email,
												t1.website,
												t1.status,

												t2.designation_id,
												t2.designation_name
						
					                            FROM tbl_attorney t1
					                            JOIN tbl_designation t2
					                            ON t1.designation_id = t2.designation_id
					                            WHERE t1.status=?
					                            ");
					$statement->execute(array('Active'));
					$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
					foreach ($result as $row) {
						?>
						<div class="col-md-3 item">
							<div class="inner">
								<div class="thumb">
									<div class="photo" style="background-image:url(<?php echo BASE_URL; ?>assets/uploads/<?php echo $row['photo']; ?>)"></div>
									<div class="overlay"></div>
									<div class="social-icons">
										<ul>
											<?php if($row['facebook']!=''): ?>
												<li><a href="<?php echo $row['facebook']; ?>" target="_blank"><i class="fa fa-facebook"></i></a></li>
											<?php endif; ?>

											<?php if($row['twitter']!=''): ?>
												<li><a href="<?php echo $row['twitter']; ?>" target="_blank"><i class="fa fa-twitter"></i></a></li>
											<?php endif; ?>

											<?php if($row['linkedin']!=''): ?>
												<li><a href="<?php echo $row['linkedin']; ?>" target="_blank"><i class="fa fa-linkedin"></i></a></li>
											<?php endif; ?>

											<?php if($row['youtube']!=''): ?>
												<li><a href="<?php echo $row['youtube']; ?>" target="_blank"><i class="fa fa-youtube"></i></a></li>
											<?php endif; ?>

											<?php if($row['google_plus']!=''): ?>
												<li><a href="<?php echo $row['google_plus']; ?>" target="_blank"><i class="fa fa-google-plus"></i></a></li>
											<?php endif; ?>

											<?php if($row['instagram']!=''): ?>
												<li><a href="<?php echo $row['instagram']; ?>" target="_blank"><i class="fa fa-instagram"></i></a></li>
											<?php endif; ?>

											<?php if($row['flickr']!=''): ?>
												<li><a href="<?php echo $row['flickr']; ?>" target="_blank"><i class="fa fa-flickr"></i></a></li>
											<?php endif; ?>
										</ul>
									</div>
								</div>
								<div class="text">
									<h3><a href="<?php echo BASE_URL; ?>attorney/<?php echo $row['slug']; ?>"><?php echo $row['name']; ?></a></h3>
									<h4><?php echo $row['designation_name']; ?></h4>
									<p class="button">
										<a href="<?php echo BASE_URL; ?>attorney/<?php echo $row['slug']; ?>">See Full Profile</a>
									</p>
								</div>
							</div>
						</div>
						<?php
					}
					?>
					
				</div>
				<!-- Attorney Container End -->
			</div>
		</div>
	</div>
</section>
<?php endif; ?>



	<!-- <section id="featuredBooks" class="mt40">
		<div class="mt40 visible-xs-block"></div>
			<div class="container">
				<div class="row">
					<div class="col-sm-11 col-sm-offset-1 mt10"><h2 class="indexh"><b>Featured</b> eBooks</h2></div>
					
					<div class="col-sm-24 pr">
						<div id ="bookListing">
							<div class="half">
								<div class="thumbs cover-wrapper" id="featured-books">

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> -->












		<!-- e-library Container Start -->
				<?php if($page_layout == 'e-library Page Layout'): ?>
				    <div class="container" style="padding-top:20px;">
					    <div class="row">
					        <h4>Explore Library</h4>
					    </div>
					    <div class="row" id="books-container">
					        <?php 
					        $limit = 8;
					        $offset = 0;
					        $stmt = $pdo->prepare("SELECT * FROM tbl_library LIMIT 8");
					        $stmt->execute();
					        $all_books = $stmt->fetchAll(PDO::FETCH_ASSOC);
					        ?>
					        <?php if(count($all_books) > 0): ?>
					            <?php foreach ($all_books as $book): ?>
					                <div class="col-lg-3">
									    <div class="card p-4 mt-2">
									        <img src="<?php echo PHOTO_URL ?><?php echo $book['image'] ?>" class="card-img-top" alt="Book Image">
									        <div class="card-body">
									            <h5 class="card-title"><?php echo $book['name']; ?></h5>
									            <p class="card-text">Author: <?php echo $book['author']; ?></p>
									            <p class="card-text"><?php echo $book['description']; ?></p>
									            <?php if ($book['price'] !== null): ?>
									                <a href="<?php echo BASE_URL; ?>details-book.php?id=<?php echo $book['id']; ?>" class="btn btn-primary">Purchase</a>
									            <?php endif; ?>
									            <?php if ($book['price'] == null): ?>
									                <!-- HTML button element -->
													<a href="<?php echo BASE_URL; ?>download.php?filename=<?php echo $book['pdf_file']; ?>" class="btn btn-primary">Download PDF</a>
									            <?php endif; ?>
									        </div>
									    </div>
									</div>
					            <?php endforeach; ?>
					    </div>
					        <div class="msg mt-2"></div>
					        <div class="row">
					            <div class="col-lg-12 text-center load_more_btn_div" style="padding-top:30px; padding-bottom:10px ;">
					                <button id="load-more-btn" class="btn btn-danger mt-4">Load more</button>
					            </div>
					        </div>
					    <?php else: ?>
					        <div class="container">
					            <div class="row">
					                <div class="col-lg-12 d-flex align-items-center justify-content-center">
					                    <div class="card p-5">
					                        <h4 class="text-danger">No books available at the moment</h4>
					                    </div>
					                </div>
					            </div>
					        </div>
					    <?php endif; ?>
					</div>
				<?php endif; ?>

				

				<!--End e-library Container Start -->

<?php require_once('footer.php'); ?>


<script>

    $(document).ready(function() {
    var limit = <?php echo $limit; ?>;
    var offset = <?php echo $offset; ?>;
    var base_url = "<?php echo BASE_URL; ?>";
    var photo_url = "<?php echo PHOTO_URL; ?>";
    var loading = false;
    offset += limit;

    function loadMoreBooks() {
        if (!loading) {
            loading = true;
            $.ajax({
                url: base_url + 'action.php',
                method: 'POST',
                data: { limit: limit, offset: offset, action: 'load_more_books' },
                success: function(response) {
                    response = JSON.parse(response);
                    if (response.success == true) {
                        var books = response.msg;
                        var html = '';
                        books.forEach(function(book) {
						    html += '<div class="col-lg-3">';
						    html += '<div class="card p-4 mt-2">';
						    html += '<img src="' + photo_url + book.image + '" class="card-img-top" alt="Book Image">';
						    html += '<div class="card-body">';
						    html += '<h5 class="card-title">' + book.name + '</h5>';
						    html += '<p class="card-text">Author: ' + book.author + '</p>';
						    html += '<p class="card-text">' + book.description + '</p>';
						    if (book.price !== null) {
						        html += '<a href="' + base_url + 'details-book.php?id=' + book.id + '" class="btn btn-primary">Purchase</a>';
						    } else {
						        
						        html += '<a href="'+base_url+'download.php?filename='+book.pdf_file+'" class="btn btn-primary" onclick="downloadPDF('+book.pdf_file+')">Download</a>';
						    }
						    html += '</div>'; // Close card-body
						    html += '</div>'; // Close card
						    html += '</div>'; // Close col-lg-3
						});
                        $('#books-container').append(html);
                        offset += limit;
                    } else {
                        console.log('Error: ' + response.msg);
                        $('.load_more_btn_div').html('');
                        $('.msg').html('<p class="alert alert-danger">' + response.msg + '</p>');
                        setTimeout(function() {
                            $('.msg').html('');
                        }, 3000);
                    }
                    loading = false;
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                    loading = false;
                }
            });
        }
    }

    $('#load-more-btn').click(function() {
        loadMoreBooks();
    });
    
});

</script>