<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website Menu 08</title>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.0/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="style.css"> <!-- Link your CSS file -->

     <style>
        #page-content-wrapper {
            padding: 20px;
        }
    </style>
</head>
<body>
    <section>
        <div class="container-full">
            <nav class="navbar navbar-expand-lg ftco_navbar ftco-navbar-light" id="ftco-navbar" style="padding: unset; border-radius: unset;">
                <div class="container">
                    <a class="navbar-brand" href="index.html">Lawyer</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="fa fa-bars"></span> Menu
                    </button>
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown04" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown04">
                                    <form action="action.php" method="post">
                                        <button type="submit" class="dropdown-item" name="logout_button" >Logout</button>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        <!-- END nav -->
        </div>
    </section>

    <!-- Sidebar -->
    <div id="wrapper">
        <div id="sidebar-wrapper">
            <?php
                function isActive($pageName) {
                    $currentPage = basename($_SERVER['REQUEST_URI']);
                    return ($currentPage == $pageName) ? 'nav-active' : '';
                }
            ?>
            <ul class="sidebar-nav">
                <li class="sidebar-brand <?= isActive('dashboard.php'); ?>">
                    <a href="#"><i class="fa fa-dashboard"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#appointmentsDropdown" aria-expanded="false" aria-controls="appointmentsDropdown">
                        <i class="fa fa-home"></i> Lawyers <i class="fa fa-caret-down dropdown-icon"></i>
                    </a>
                    <div class="collapse" id="appointmentsDropdown">
                        <ul class="nav flex-column">
                            <li class="nav-item <?= isActive('explore-lawyers.php'); ?>">
                                <a class="nav-link" href="explore-lawyers.php">Explore Lawyers</a>
                            </li>
                            <li class="nav-item <?= isActive('my-lawyers.php'); ?>">
                                <a class="nav-link" href="my-lawyers.php">My Lawyers</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#appointmentDropdown" aria-expanded="false" aria-controls="appointmentDropdown">
                        <i class="fa fa-home"></i> E-Library <i class="fa fa-caret-down dropdown-icon"></i>
                    </a>
                    <div class="collapse" id="appointmentDropdown">
                        <ul class="nav flex-column">
                            <li class="nav-item <?= isActive('my-books.php'); ?>">
                                <a class="nav-link" href="my-books.php">My Books</a>
                            </li>
                            <li class="nav-item <?= isActive('request-approval.php'); ?>">
                                <a class="nav-link" href="request-approval.php">Request Approval</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">